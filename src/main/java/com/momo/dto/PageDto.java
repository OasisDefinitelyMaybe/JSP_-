package com.momo.dto;

public class PageDto {
	
	  // 페이지 블럭을 그리기 위해 필요한 정보
      int startNo;        // 페이지 블럭 시작번호
      int endNo;          // 페이지 블럭 끝번호
      int realEnd;        // 게시물의 진짜 끝 페이지 번호 (총 게시물의 수 / 페이지당 게시물수)
      boolean prev, next; // 이전, 다음 버튼(true : 보여주기)
      
      // 위의 정보들을 세팅하기위해 필요한 값
      int totalCnt;       // 총 게시물의 수
      Criteria cri;       // pageNo : 요청 페이지번호, amount : 페이지당 게시물 수 
      int blockAmount = 5;  // 페이지블럭에 보여줄 페이지의 수(블럭에서 보여줄 번호의 수)
      
      
      /**
       * 생성자를 통해 페이지네이션(페이지블럭)을 그리기 위한 값(정보)을 세팅.
       * - 모듈처럼 사용가능함
       * @param totalCnt
       * @param blockAmount
       * @param cri
       */
  	public PageDto(int totalCnt, Criteria cri, String blockAmount) {		
		// 생성자 호출
		this(totalCnt, cri);
		
		if(blockAmount != null && !"".equals(blockAmount)) {		
			this.blockAmount = Integer.parseInt(blockAmount);
		}
	}
      
	public PageDto(int totalCnt, Criteria cri) {
		super();
		this.totalCnt = totalCnt;
		this.cri = cri;
		
		// 요청 페이지, 블럭당 페이지 수에 따라서 블럭의 범위가 정해집니다.
		// 1-10, 11-20, 21-30
		
		// 페이지 블럭의 끝번호
		// ex) 올림(7/10.0) = 1 * blockAmount = 10
		// 끝번호 = 올림처리(요청페이지 번호 / (블럭당 페이지수*1.0(더블로만들어줘야함)) * 블럭당페이지수
		endNo = (int)Math.ceil(cri.getPageNo() / (blockAmount*1.0)) * blockAmount;
		
		// 페이지 블럭 시작번호 
		// 시작번호 = 끝번호 - (블럭당페이지수 -1)
		startNo = endNo - (blockAmount-1);
		
		// 페이지 진짜 끝번호
		// 진짜 끝번호 = 올림처리((총 게시물의 수 * 1.0(더블로만들어줘야함))/ 페이지당 게시물수)
		realEnd = (int) Math.ceil((totalCnt * 1.0)/cri.getAmount());
		
		// 게시물이 67건인 경우
		// 페이지 진짜 끝번호는 7인데 블럭의 끝번호 10입니다.
		// 끝번호가 게시물의 진짜 끝번호보다 큰 경우
		endNo = endNo > realEnd? realEnd : endNo;
		
		// 앞으로 가기 버튼, 뒤로 가기 버튼 설정
		// prev이 startNo와 같고 그 값이 1이면 false(비활성화) : true(활성화)
		prev = startNo == 1 ? false : true;
		// next이 endNo와 같고 그 값이 realEnd이면 false(비활성화) : true(활성화)
		next = endNo == realEnd ? false : true;
		
		System.out.println("시작번호 : " + startNo);
		System.out.println("끝번호 : " + endNo);
		System.out.println("진짜끝번호 : " + realEnd);
		System.out.println("prev : " + prev);
		System.out.println("next : "  + next);
		System.out.println("==============================");
		System.out.println("요청페이지번호 : " + cri.getPageNo());
		System.out.println("페이지당 게시물의 수  : " + cri.getAmount());
		System.out.println("총 게시물의 수  : " + totalCnt);

	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getRealEnd() {
		return realEnd;
	}

	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
      
      
}
