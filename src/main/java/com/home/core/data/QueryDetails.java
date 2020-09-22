package com.home.core.data;

public class QueryDetails implements java.io.Serializable {
	/*
	 * so luong don tren mot trang
	 */
	private Integer pageSize;
	/*
	 * Trang hien tai
	 */
	private Integer pageNumber;
	/*
	 * 
	 */
	private Integer maxPage;
	private Integer firstResult;
	private Integer maxResults;
	/**
	 * 
	 * @return
	 */
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}

	/**
	 * 
	 * @return
	 */
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	private int computeFirstPage(int iPageNumber, int iMaxPage) {
		int firstPage = ((int) (iPageNumber / iMaxPage)) * iMaxPage;
		int lastPage = ((int) (iPageNumber / iMaxPage)) * iMaxPage + iMaxPage;
		if (iPageNumber > firstPage) {
			return firstPage;
		} else {
			return firstPage - iMaxPage;
		}
	}
	/*
	public int getLastIndex() {
		int beginIndex = this.getBeginIndex();
		//System.out.println("Begin: "+beginIndex);
		int iPageSize =  (pageSize == null)?Constants.PAGE_SIZE_DEFAULT.intValue():pageSize.intValue();
		int iMaxPage =  (maxPage == null)?Constants.MAX_PAGE_DEFAULT.intValue():maxPage.intValue();
		int ret = iMaxPage * iPageSize+1;
		//System.out.println("Max-Records: "+ret);
		return ret;
	}
	
	public int getBeginIndex() {
		int iPageSize =  (pageSize == null)?Constants.PAGE_SIZE_DEFAULT.intValue():pageSize.intValue();
		int iMaxPage =  (maxPage == null)?Constants.MAX_PAGE_DEFAULT.intValue():maxPage.intValue();
		int iPageNumber = (pageNumber == null)? 1:pageNumber.intValue();
		int firstPage = this.computeFirstPage(iPageNumber,iMaxPage);	
		//System.out.println("Begin: "+firstPage * iPageSize);	
		return 	firstPage * iPageSize;		
	}
	*/
	/**
	* @return
	*/
	public Integer getMaxPage() {
		return maxPage;
	}

	/**
	 * @param integer
	 */
	public void setMaxPage(Integer integer) {
		maxPage = integer;
	}
	public int getTotal(int totalSearch) {
		int pNum = this.getPageNumber().intValue();
		int pSize = this.getPageSize().intValue();
		int phanNguyen = totalSearch / pSize;
		int phanDu = (totalSearch - 1) % pSize;
		if (phanNguyen > 1 && (phanDu == 0 || phanDu < pSize) && pNum - 1 < phanNguyen)
			return pNum * pSize;
		else
			return (pNum - 1) * pSize + phanDu + 1;
	}
	///*
	public int getLastIndex() {
		int retVal = 52;
		try {
			retVal = pageSize.intValue() * 5 +2;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retVal;
	}

	public int getBeginIndex() {
		int retVal = 0;
		try {
			retVal = (pageNumber.intValue() - 1) * pageSize.intValue();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retVal;
	}
	//*/
	
	public Integer getFirstResult() {
		return firstResult;
	}
	
	public void setFirstResult(Integer firstResult) {
		this.firstResult = firstResult;
	}
	
	public Integer getMaxResults() {
		return maxResults;
	}
	
	public void setMaxResults(Integer maxResults) {
		this.maxResults = maxResults;
	}
}
