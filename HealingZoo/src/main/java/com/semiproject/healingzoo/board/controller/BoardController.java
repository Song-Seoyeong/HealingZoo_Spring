package com.semiproject.healingzoo.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.semiproject.healingzoo.board.model.exception.BoardException;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.Reply;
import com.semiproject.healingzoo.member.model.vo.Member;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	// 글쓰기 페이지 이동 (문의/예약)
	@RequestMapping("writeView.bo")
	public String writeView(@RequestParam("category") String category,
							Model model) {
		model.addAttribute("category", category);
		return "writeBoard";
	}
	
	// 글쓰기 페이지 이동 (공지/후기)
		@RequestMapping("noReWriteView.bo")
		public String noRewriteView(@RequestParam("category") String category,
								Model model) {
			model.addAttribute("category", category);
			return "noReWrite";
		}
	
	
	// 글쓰기 insert(문의/예약)
	@RequestMapping("write.bo")
	public String writeBoard(@ModelAttribute Board b,
							 @RequestParam("file") ArrayList<MultipartFile> imgList,
							 HttpServletRequest request,
							 Model model) {
		ArrayList<Image> list = new ArrayList<Image>();
		
		for(MultipartFile img : imgList) {
			if(!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				
				Image newImg = new Image();
				newImg.setImgName(img.getOriginalFilename());
				newImg.setImgPath(returnArr[0]);
				newImg.setImgRename(returnArr[1]);
				newImg.setImgRefType("BOARD");
				
				list.add(newImg);
			}
		}
		int resultBoard = 0;
		int resultImg = 0;
		
		resultBoard = bService.insertBoard(b);
		
		bService.insertQuBo(b);
		
		//이미지가 있다면 DB 넣기
		if(!list.isEmpty()) {
			for(Image i : list) {
				i.setImgRefNum(b.getBoardNo());
			}
			resultImg = bService.insertImg(list);
		}
		
		
		
		if(resultBoard + resultImg == 1 + list.size()) {
			
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("category", b.getCateNo());
			model.addAttribute("page", 1);
			return "redirect:boardView.bo";
		}else {
			for(Image a : list) {
				delete(a.getImgRename(), request);
			}
			throw new BoardException("게시글 등록에 실패 했습니다.");
		}
	}
	
	// 글쓰기 insert(공지/후기)
	@RequestMapping("noReWrite.bo")
	public String noReWrite(@ModelAttribute Board b,
							 @RequestParam("file") ArrayList<MultipartFile> imgList,
							 HttpServletRequest request,
							 Model model) {
		ArrayList<Image> list = new ArrayList<Image>();
		
		for(MultipartFile img : imgList) {
			if(!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				
				Image newImg = new Image();
				newImg.setImgName(img.getOriginalFilename());
				newImg.setImgPath(returnArr[0]);
				newImg.setImgRename(returnArr[1]);
				newImg.setImgRefType("BOARD");
				
				list.add(newImg);
			}
		}
		int resultBoard = 0;
		int resultImg = 0;
		
		resultBoard = bService.insertBoard(b);
		
		//공지 게시글 분리
		if(b.getCateNo() == 100) {
			bService.insertNotice(b);
		}
		
		//이미지가 있다면 DB 넣기
		if(!list.isEmpty()) {
			for(Image i : list) {
				i.setImgRefNum(b.getBoardNo());
			}
			resultImg = bService.insertImg(list);
		}
		
		
		
		if(resultBoard + resultImg == 1 + list.size()) {
			
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("category", b.getCateNo());
			model.addAttribute("page", 1);
			return "redirect:boardView.bo";
		}else {
			for(Image a : list) {
				delete(a.getImgRename(), request);
			}
			throw new BoardException("게시글 등록에 실패 했습니다.");
		}
	}

	// 이미지 삭제
	private void delete(String rename, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";
		File f = new File(savePath + "/" + rename);
		if (f.exists()) {
			f.delete();
		}
	}

	// 이미지 저장
	public String[] saveImg(MultipartFile img, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";

		File f = new File(savePath);
		if (!f.exists()) {
			f.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHmmssSSS");
		int randomNum = (int) Math.random() * 1000000;

		String originName = img.getOriginalFilename();
		String rename = sdf.format(new Date()) + randomNum + originName.substring(originName.indexOf("."));

		String renamePath = f + "//" + rename;

		try {
			img.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = rename;

		return returnArr;
	}

	// 예약/문의글 비밀번호 확인 페이지 이동
	@RequestMapping("pwdConfirm.bo")
	public String pwdConfirm(@RequestParam("bId") int bId, @RequestParam("page") int page,
			@RequestParam("category") int category, Model model) {
		model.addAttribute("category", category);
		model.addAttribute("bId", bId);
		model.addAttribute("page", page);
		return "boardPwdConfirm";
	}

	// 예약/문의글 비밀번호 체크
	@RequestMapping("checkPwd.bo")
	public String checkPwdBoard(@ModelAttribute Board b, @RequestParam("page") int page, Model model) {
		int result = bService.checkPwdBoard(b);

		if (result > 0) {
			model.addAttribute("category", b.getCateNo());
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("page", page);
			return "redirect:boardView.bo";
		} else {
			throw new BoardException("게시글을 불러올 수 없습니다.");
		}
	}

	// 상세 글 보기 + 조회수 증가
	@RequestMapping("boardView.bo")
	public String selectBoard(@RequestParam("bId") int bId, @RequestParam("page") int page,
			@RequestParam("category") int category, HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");

		Integer userNo = null;
		if (loginUser != null) {
			userNo = (Integer) loginUser.getMemNo();
		}

		// 카테고리별 상세 글 불러오는 메소드 나뉨
		Board b = null;

		if (category == 100) {
			b = bService.selectNoBoard(bId, userNo);
		} else if (category == 101 || category == 103) {
			b = bService.selectBoard(bId, userNo);
		} else {
			b = bService.selectReBoard(bId, userNo);
		}

		// 이미지 리스트 조회
		ArrayList<Image> imgList = bService.selectImg(bId);

		// 댓글 리스트 조회
		ArrayList<Reply> replyList =  new ArrayList<Reply>();
		
		if(category == 100 || category == 102 || category == 103) {
			replyList = bService.selectReply(bId);
		}else if(category == 101){
			replyList = bService.selectQuReply(bId);
		}

		if (b != null && imgList != null && replyList != null) {

			if (b.getCateNo() == 100) {
				b.setBoardWriterName("관리자");
			}

			for (Reply r : replyList) {
				r.setModifyDate(r.getModifyDate().split(" ")[0]);
			}

			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);
			model.addAttribute("replyList", replyList);

			return "boardDetail";
		} else {
			throw new BoardException("게시글을 불러 오는데 실패했습니다.");
		}
	}

	// 게시글 삭제
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam("bId") int boardNo, @RequestParam("list") int listSize,
			@RequestParam("relist") int relistSize, @RequestParam("category") String category) {
		int deleteBoardResult = bService.deleteBoard(boardNo);
		int deleteImgResult = bService.updateImgStatus(boardNo);
		int deleteReplyResult = bService.updateReplyStatus(boardNo);

		if (deleteBoardResult + deleteImgResult + deleteReplyResult == 1 + listSize + relistSize) {
			return "redirect:" + category + ".menu";
		} else {
			throw new BoardException("게시글을 삭제 중 에러가 발생하였습니다");
		}
	}

	// 게시글 수정 페이지 이동
	@RequestMapping("updateView.bo")
	public String updateView(@ModelAttribute Board b, @RequestParam("page") int page, Model model) {
		Board updateBoard = null;

		if (b.getCateNo() == 100) {
			updateBoard = bService.selectNoBoard(b.getBoardNo(), null);
		} else if (b.getCateNo() == 101 || b.getCateNo() == 103) {
			updateBoard = bService.selectBoard(b.getBoardNo(), null);
		} else {
			updateBoard = bService.selectReBoard(b.getBoardNo(), null);
		}

		ArrayList<Image> imgList = bService.selectImg(b.getBoardNo());

		model.addAttribute("imgList", imgList);
		model.addAttribute("bId", b.getBoardNo());
		model.addAttribute("b", updateBoard);
		model.addAttribute("page", page);
		return "boardUpdate";
	}

	// 게시글 수정
	@RequestMapping("updateBoard.bo")
	public String updateBoard(@ModelAttribute Board b,
							  @RequestParam(value="checkDelete", required=false) ArrayList<String> checkDeletes,
							  @RequestParam("file") ArrayList<MultipartFile> imgs, @RequestParam("page") int page,
							  HttpServletRequest request, Model model) {
		// 추가 이미지 등록
		ArrayList<Image> imgList = new ArrayList<Image>();

		for (MultipartFile img : imgs) {
			if (!img.isEmpty() && img != null) {
				String[] returnArr = saveImg(img, request);
				Image a = new Image();
				a.setImgName(img.getOriginalFilename());
				a.setImgRename(returnArr[1]);
				a.setImgPath(returnArr[1]);
				a.setImgRefType("BOARD");
				a.setImgRefNum(b.getBoardNo());

				imgList.add(a);
			}
		}

		// 기존 이미지 삭제
		ArrayList<String> deleteImg = new ArrayList<String>();

		if (checkDeletes != null) {
			for (String checkDelete : checkDeletes) {
				if (!checkDelete.equals("none")) {
					deleteImg.add(checkDelete);
				}
			}
		}

		int deleteImgResult = 0;
		if (!deleteImg.isEmpty()) {
			deleteImgResult = bService.deleteImg(deleteImg);

			if (deleteImgResult > 0) {
				for (String deleteImgRename : deleteImg) {
					delete(deleteImgRename, request);
				}
			} else {
				throw new BoardException("게시판 수정에 실패했습니다.");

			}
		}

		// 공지 문의/예약 글일 경우
		if (b.getCateNo() == 101 || b.getCateNo() == 103) {
			int quBoBoardResult = bService.updateQuBo(b);
			if (quBoBoardResult < 0) {
				throw new BoardException("게시판 수정에 실패했습니다.");
			}
		} else if (b.getCateNo() == 100) {
			int noResult = bService.updateNotice(b);
			if (noResult < 0) {
				throw new BoardException("게시판 수정에 실패했습니다.");
			}
		}

		int boardResult = bService.updateBoard(b);
		
		// 추가 이미지가 있을 때만
		int imgResult = 0;
		if (!imgList.isEmpty()) {
			imgResult = bService.insertImg(imgList);
		}
		
		
		if (boardResult + imgResult == 1 + imgList.size()) {
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("page", page);
			model.addAttribute("category", b.getCateNo());
			
			return "redirect:boardView.bo";
		} else {
			for(Image i : imgList) {
				delete(i.getImgRename(), request);
			}
			throw new BoardException("게시판 수정에 실패했습니다.");
		}
	}

	// 댓글 작성
	@RequestMapping("insertReply.bo")
	@ResponseBody
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {

		int result = bService.insertReply(r);

		if (result > 0) {
			// 댓글 리스트 조회
			ArrayList<Reply> replyList = bService.selectReply(r.getBoardNo());

			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			Gson gson = gb.create();
			response.setContentType("application/json; charset=UTF-8");

			try {
				gson.toJson(replyList, response.getWriter());
			} catch (JsonIOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			throw new BoardException("댓글 작성에 실패했습니다.");
		}
	}

	// 댓글 완전 삭제
	@RequestMapping("deleteReply.bo")
	@ResponseBody
	public String deleteReply(@RequestParam("reId") int reId) {
		int result = bService.deleteReply(reId);

		return result == 1 ? "success" : "fail";
	}

	// 댓글 수정
	@RequestMapping("updateReply.bo")
	@ResponseBody
	public String updateReply(@ModelAttribute Reply r) {
		int result = bService.updateReply(r);
		return result == 1 ? "success" : "fail";
	}
	
	
	

}