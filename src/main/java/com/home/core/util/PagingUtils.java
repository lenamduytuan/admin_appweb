package com.home.core.util;

public class PagingUtils {
	int page;
	int per_page;
	int offset;
	int total_items_number;
	int pages;
	int remian;
	
	public PagingUtils(int page, int per_page){
		this.page = page;
		this.per_page = per_page;
		
		offset = (page -1) * per_page;
	}

	public int getOffset() {
		return offset;
	}

	public int getPages(int total_items_number) {
		remian = total_items_number % per_page;
		if(remian > 0) remian = 1;
		pages = total_items_number/per_page + remian;
		
		return pages;
	}

}
