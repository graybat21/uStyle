package com.ustyle.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ustyle.domain.Pin;
import com.ustyle.domain.PinBoard;
import com.ustyle.domain.PinBoardLike;
import com.ustyle.domain.PinBoardReply;
import com.ustyle.domain.User;
import com.ustyle.service.PinService;
import com.ustyle.utils.PageMaker;

@Controller
@RequestMapping("/pin/*")
public class PinController {

	private static final Logger logger = LoggerFactory.getLogger(PinController.class);

	@Inject
	private PinService pinService;
	
	@RequestMapping("pinBoardList.do")
	public ModelAndView pinBoardList(@RequestParam(value = "pageCount", required = false) Integer pageCount,
			HttpSession session) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		pageMaker.setPage(page);
		
		ModelAndView mav = new ModelAndView("pin/pinBoardList/PinBoard");
		
		int totalCnt = pinService.selectListCnt(); // DB연동_ 총 갯수 구해오기
		
		int countPerPaging = 10;
		int pageCnt = 12;			// 한 페이지당 12개씩 보이게 함. 
		
		pageMaker.setCount(totalCnt, pageCnt, countPerPaging);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		int first = ((pageMaker.getPage() - 1) * pageCnt) + 1;
		int last = ( first + pageCnt - 1 > totalCnt ) ? totalCnt : first + pageCnt - 1;
		
		map.put("first", first);
		map.put("last", last);
		
		List<PinBoard> pinBoardList = pinService.selectPinBoardList(map);
		logger.info(pinBoardList.toString());
		
		mav.addObject("pinBoardList", pinBoardList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("first", first);
		mav.addObject("last", last);
		
		return mav;
	}

	@RequestMapping("myPinBoardList.do")
	public ModelAndView myPinBoardList(@RequestParam(value = "pageCount", required = false) Integer pageCount,
			@RequestParam(value = "productid", required = false) Integer productid, HttpSession session) throws Exception {
		
		PageMaker pageMaker = new PageMaker();
		
		int page = ( pageCount != null ) ? pageCount.intValue() : 1;
		pageMaker.setPage(page);
		
		ModelAndView mav = new ModelAndView("pin/myPinBoardList/My PinBoard");
		User user = (User) session.getAttribute("session_user");
		
		String username = user.getUsername();
		
		int totalCnt = pinService.selectListCntForUsername(username); // DB연동_ 총 갯수 구해오기
		int countPerPaging = 10;
		int pageCnt = 11;			// 4 X 3 행렬에서 맨 위쪽에 있는 추가 버튼을 하나 제외하여 한 페이지당 11개씩 보이게 함. 
		
		pageMaker.setCount(totalCnt, pageCnt, countPerPaging);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("username", username);

		int first = ((pageMaker.getPage() - 1) * pageCnt) + 1;
		int last = ( first + pageCnt - 1 > totalCnt ) ? totalCnt : first + pageCnt - 1;
		
		map.put("first", first);
		map.put("last", last);
		
		List<PinBoard> pinBoardList = pinService.selectPinBoardList(map);
		logger.info(pinBoardList.toString());
		
		mav.addObject("pinBoardList", pinBoardList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("productid", productid);
		return mav;
	}
		
	@RequestMapping(value = "createPinBoard.do", method = RequestMethod.GET)
	public String createPinBoardForm() throws Exception {
		return "pin/createPinBoardForm/New Create Form";
	}
	
	@RequestMapping(value = "createPinBoard.do", method = RequestMethod.POST)
	public String createPinBoard(HttpSession session, PinBoard pinBoard) throws Exception {
		User user = (User) session.getAttribute("session_user");
		pinBoard.setUsername(user.getUsername());
		logger.info(pinBoard.toString());
		pinService.createPinBoard(pinBoard);
		return "redirect:/pin/myPinBoardList.do";
	}
	
	@RequestMapping(value = "modifyPinBoard.do", method = RequestMethod.GET)
	public ModelAndView modifyPinBoardForm(HttpSession session, @RequestParam int pinboardno) throws Exception {
		
		PinBoard pinBoard = pinService.getPinBoardByNo(pinboardno);
		
		ModelAndView mav = new ModelAndView();
		
		User user = (User) session.getAttribute("session_user");
		String username = user.getUsername();
		String pinBoardUsername = pinBoard.getUsername();
		
		if ( !(pinBoardUsername.equals(username)) ) {
			mav.setViewName("pin/updatePinBoardError/Update PinBoard Error");
			return mav;
		}
		
		List<HashMap<String, Object>> pinBoardProductList = pinService.selectPinBoardProductList(pinBoard.getPinboardno());
		
		mav.setViewName("pin/updatePinBoardForm/Update PinBoard");
		mav.addObject("pinBoard", pinBoard);
		mav.addObject("pinBoardProductList", pinBoardProductList);
		
		return mav;
	}
	
	@RequestMapping(value = "modifyPinBoard.do", method = RequestMethod.POST)
	public String modifyPinBoard(PinBoard pinBoard) throws Exception {
		
		logger.info(pinBoard.toString());
		pinService.modifyPinBoard(pinBoard);
		return "redirect:/pin/myPinBoardList.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "updatePinBoardPictureurl.do", method = RequestMethod.POST)
	public ResponseEntity<String> updatePinBoardPictureurl(@RequestBody PinBoard pinBoard) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			logger.info("PINBOARD TO CHANGEMAINIMAGE = " + pinBoard.toString());
			pinService.updatePictureurl(pinBoard);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "deletePinBoard.do", method = RequestMethod.POST)
	public ResponseEntity<String> deletePinBoard(@RequestBody PinBoard pinBoard) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		int pinboardno = pinBoard.getPinboardno();
		
		try 
		{
			logger.info("PINBOARDNUM TO DELETE = " + pinboardno);
			
			pinService.deletePinBoard(pinboardno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "addLike.do", method = RequestMethod.POST)
	public int addLike(@RequestBody PinBoardLike pinBoardLike) throws Exception {
		
		logger.info("PINBOARDLIKE TO ADD = " + pinBoardLike.toString());
		
		int pinboardno = pinBoardLike.getPinboardno();
		
		pinService.plusLike(pinboardno);
		pinService.addLikeList(pinBoardLike);
		
		int selectLikeCnt = pinService.selectLikeCnt(pinboardno);
		
		return selectLikeCnt;
	}
	
	@ResponseBody
	@RequestMapping(value = "removeLike.do", method = RequestMethod.POST)
	public int removeLike(@RequestBody PinBoardLike pinBoardLike) throws Exception {
		
		logger.info("PINBOARDLIKE TO REMOVE = " + pinBoardLike.toString());
		
		int pinboardno = pinBoardLike.getPinboardno();
		
		pinService.minusLike(pinboardno);
		pinService.removeLikeList(pinBoardLike);
		
		int selectLikeCnt = pinService.selectLikeCnt(pinboardno);
		
		return selectLikeCnt;
	}
	
//	=======================================================================
	
	@RequestMapping(value = "viewPinBoard.do", method = RequestMethod.GET)
	public ModelAndView viewPinBoard(@RequestParam(value = "productid", required = false) Integer productid,
			int pinboardno, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView("pinList");
		List<Pin> pinList = pinService.getPins(pinboardno);
		PinBoard pinBoard = pinService.getPinBoardByNo(pinboardno);
		List<HashMap<String, Object>> pinBoardProductList = pinService.selectPinBoardProductList(pinboardno);
//		List<PinBoardReply> pinBoardReplyList = pinService.getPinBoardReplyByPinBoardNo(pinboardno);
		logger.info("=============" + pinList.toString());
		logger.info("=============" + pinBoard.toString());
//		logger.info("=============" + pinBoardReplyList.toString());
		
		for ( HashMap<String, Object> map : pinBoardProductList ) 
		{
			Iterator<String> iterator = map.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = String.valueOf(iterator.next());
		        logger.info("key = " + key);
		        logger.info(" value = " + map.get(key));
		    }
		}
		
		User user = (User) session.getAttribute("session_user");
		
		if ( user != null ) {
			String username = user.getUsername();
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pinboardno", pinboardno);
			map.put("username", username);
			
			boolean isCheckLike = pinService.checkLike(map);		// 특정 PinBoard에 대한 좋아요를 체크했는지 확인하는 변수
			
			mav.addObject("isCheckLike", isCheckLike);
			mav.addObject("username", username);
		}
		
		mav.addObject(pinList);
		mav.addObject("pinBoardProductList", pinBoardProductList);
		mav.addObject(pinBoard);
		
		if ( productid != null )
			mav.addObject("productid", productid);

//		mav.addObject(pinBoardReplyList);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "insertPin.do", method = RequestMethod.POST)
	public ResponseEntity<String> insertPin(@RequestBody Pin pin) {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			logger.info("PIN TO INSERT = " + pin.toString());
			
			boolean isExistPin = pinService.existPin(pin);		// 선택한 상품이 Pin으로 이미 추가되어있는지 체크함. 
			
			if ( isExistPin == true ) {
				entity = new ResponseEntity<String>("EXIST OF PIN", HttpStatus.OK);
			}
			else {
				int pinboardno = pin.getPinboardno();
				
				int totalPinCnt = pinService.selectPinCnt(pinboardno);
				// 하나의 PinBoard에 Pin을 최대 4개까지만 넣을 수 있도록 함. 
				
				if ( totalPinCnt >= 4 ) {
					entity = new ResponseEntity<String>("EXCEED OF PIN", HttpStatus.OK);
				}
				else {
					// Pin이 없는 PinBoard에 Pin을 추가하는 경우, 추가하는 Pin의 대표 이미지를 PinBoard의 대표 이미지로 넣음.
					if ( totalPinCnt == 0 ) {
						PinBoard updatePinBoard = new PinBoard();
						
						updatePinBoard.setPinboardno(pinboardno);
						updatePinBoard.setMainpictureproductid(pin.getProductid());
						
						pinService.updatePictureurl(updatePinBoard);
					}
					
					pinService.insertPin(pin);
					entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
				}
			}
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value = "deletePin.do", method = RequestMethod.POST)
	public ResponseEntity<String> deletePin(@RequestBody Pin pin) throws Exception {
		
		ResponseEntity<String> entity = null;
		
		try 
		{
			logger.info("PIN TO DELETE = " + pin.toString());
			
			pinService.deletePin(pin);
			
			int pinboardno = pin.getPinboardno();
			
			int mainPictureProductid = pinService.getPinBoardByNo(pinboardno).getMainpictureproductid();
			int pinBoardProductid = pin.getProductid();
			
			int totalPinCnt = pinService.selectPinCnt(pinboardno);
			
			/* PinBoard에 있는 Pin이 하나도 없거나 삭제하려는 Pin이 PinBoard의 메인 이미지로 설정된 경우, 
			 PinBoard의 이미지를 다시 기본 이미지로 바꿈. */
			if ( totalPinCnt == 0 || mainPictureProductid == pinBoardProductid ) {		
				PinBoard updatePinBoard = new PinBoard();
				
				updatePinBoard.setPinboardno(pinboardno);
				updatePinBoard.setMainpictureproductid(0);
				
				pinService.updatePictureurl(updatePinBoard);
			}
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}
		catch ( Exception e ) 
		{
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
//	=======================================================================
	
	@RequestMapping(value="pinBoardReply.do", method=RequestMethod.POST)
	public String insertPinBoardReply(PinBoardReply pinBoardReply){
		pinService.insertPinBoardReply(pinBoardReply);
		return "redirect:/viewPinBoard.do";
	}
	
	@RequestMapping(value="pinBoardReply.do", method=RequestMethod.DELETE)
	public String deletePinBoardReply(int pinboardreplyno){
		pinService.deletePinBoardReply(pinboardreplyno);
		return "redirect:/viewPinBoard.do";
	}
}
