package com.semiproject.healingzoo.board.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.semiproject.healingzoo.board.model.exception.BoardException;
import com.semiproject.healingzoo.board.model.service.BoardService;
import com.semiproject.healingzoo.board.model.vo.Board;
import com.semiproject.healingzoo.board.model.vo.Image;
import com.semiproject.healingzoo.board.model.vo.PageInfo;
import com.semiproject.healingzoo.common.Pagination;
import com.semiproject.healingzoo.member.model.vo.Member;

@Controller
public class BoardController {
	
	private static final int String = 0;
	@Autowired
	private BoardService bService;
	
	// 글쓰기 페이지 이동 (카테고리 모두 동일)
	@RequestMapping("writeView.bo")
	public String writeBoardView(@RequestParam("category") String category, Model model) {
		model.addAttribute("category", category);
		return "writeBoard";
	}
	
	// 글쓰기 insert(카테고리 모두 동일)
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
		
		//공지, 예약/문의 게시글 분리
		resultBoard = bService.insertBoard(b);
		if(b.getCateNo() == 100) {
			
		}else if(b.getCateNo() == 101 || b.getCateNo() == 103) {
			bService.insertQuBo(b);
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
		if(f.exists()) {
			f.delete();
		}
	}

	// 이미지 저장
	public String[] saveImg(MultipartFile img, HttpServletRequest request) {
		String savePath = request.getSession().getServletContext().getRealPath("resources") + "/uploadImg";
		
		File f = new File(savePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHmmssSSS");
		int randomNum = (int)Math.random()*1000000;
		
		String originName = img.getOriginalFilename();
		String rename = sdf.format(new Date()) + randomNum + originName.substring(originName.indexOf("."));
		
		String renamePath = f + "/" + rename;
		
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
	public String pwdConfirm(@RequestParam("bId") int bId,
							 @RequestParam("page") int page,
							 @RequestParam("category") int category,
							 Model model) {
		model.addAttribute("category", category);
		model.addAttribute("bId", bId);
		model.addAttribute("page", page);
		return "boardPwdConfirm";
	}
	
	
	// 예약/문의글 비밀번호 체크
	@RequestMapping("checkPwd.bo")
	public String checkPwdBoard(@ModelAttribute Board b,
								@RequestParam("page") int page,
								Model model) {
		int result = bService.checkPwdBoard(b);
		
		if(result > 0 ) {
			model.addAttribute("category", b.getCateNo());
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("page", page);
			return "redirect:boardView.bo";
		}else {
			throw new BoardException("게시글을 불러올 수 없습니다.");
		}
	}
	
	
	// 상세 글 보기 + 조회수 증가
	@RequestMapping("boardView.bo")
	public String selectBoard(@RequestParam("bId") int bId,
							  @RequestParam("page") int page,
							  @RequestParam("category") int category,
							  HttpSession session,
							  Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Integer userNo = null;
		if(loginUser != null) {
			userNo = (Integer)loginUser.getMemNo();
		}
		
		// 카테고리별 상세 글 불러오는 메소드 나뉨
		Board b = null;
		
		if(category == 100) {
			b = bService.selectNoBoard(bId, userNo);
		}else if(category == 101 || category == 103){
			b = bService.selectBoard(bId, userNo);
		}else {
			b = bService.selectReBoard(bId, userNo);
		}
		
		ArrayList<Image> imgList = bService.selectImg(bId);
		
		if(b.getCateNo() == 100) {
			b.setBoardWriterName("관리자");
		}
		
		if(b != null && imgList != null) {
			model.addAttribute("b", b);
			model.addAttribute("imgList", imgList);
			model.addAttribute("page", page);
			
			return "boardDetail";
		}else {
			throw new BoardException("게시글을 불러 오는데 실패했습니다.");
		}
	}
	
	// 게시글 삭제
	@RequestMapping("delete.bo")
	public String deleteBoard(@RequestParam("bId") int boardNo,
							  @RequestParam("list") int listSize,
							  @RequestParam("category") String category) {
		int deleteBoardResult = bService.deleteBoard(boardNo);
		int deleteImgResult = bService.updateImgStatus(boardNo);
		
		if(deleteBoardResult + deleteImgResult == 1 + listSize) {
			return "redirect:" + category + ".menu";
		}else {
			throw new BoardException("게시글 삭제 중 에러 발생");
		}
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping("updateView.bo")
	public String updateView(@ModelAttribute Board b,
							  @RequestParam("page") int page,
							  Model model) {
		b = bService.selectBoard(b.getBoardNo(), null);
		ArrayList<Image> imgList = bService.selectImg(b.getBoardNo());
		
		model.addAttribute("imgList", imgList);
		model.addAttribute("bId", b.getBoardNo());
		model.addAttribute("b", b);
		model.addAttribute("page", page);
		return "boardUpdate";
	}
	
	// 게시글 수정
	@RequestMapping("updateBoard.bo")
	public String updateBoard(@ModelAttribute Board b,
							  @RequestParam(value="checkDelete", defaultValue="none") ArrayList<String> checkDeletes,
							  @RequestParam("file") ArrayList<MultipartFile> imgs,
							  @RequestParam("page") int page,
							  HttpServletRequest request,
							  Model model) {
		// 추가 이미지 등록
		ArrayList<Image> imgList = new ArrayList<Image>();
		
		for(MultipartFile img : imgs) {
			if(!img.isEmpty() && img != null) {
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
	
		if(checkDeletes != null) {
			for(String checkDelete : checkDeletes) {
				if(!checkDelete.equals("none")) {
					deleteImg.add(checkDelete);
				}
			}
		}
		System.out.println(deleteImg);
		
		int deleteImgResult = 0;
		if(!deleteImg.isEmpty()) {
			deleteImgResult = bService.deleteImg(deleteImg);
			
			if(deleteImgResult > 0) {
				for(String deleteImgRename : deleteImg) {
					delete(deleteImgRename, request);
				}
			}else {
				throw new BoardException("게시판 수정에 실패했습니다.");
				
			}
		}
		
		// 문의/예약 글일 경우
		if(b.getCateNo() == 101 || b.getCateNo() == 103) {
			int quBoBoardResult = bService.updateQuBo(b);
			if(quBoBoardResult < 0) {
				throw new BoardException("게시판 수정에 실패했습니다.");
			}
		}
		
		
		int boardResult = bService.updateBoard(b);
		
		// 추가 이미지가 있을 때만
		int imgResult = 0;
		if(!imgList.isEmpty()) {
			imgResult = bService.insertImg(imgList);
		}
		if(boardResult + imgResult == 1 + imgList.size()) {
			model.addAttribute("bId", b.getBoardNo());
			model.addAttribute("page", page);
			
			return "redirect:boardView.bo";
		}else {
			throw new BoardException("게시판 수정에 실패했습니다.");
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
