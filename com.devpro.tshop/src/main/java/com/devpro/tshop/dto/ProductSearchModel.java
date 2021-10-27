package com.devpro.tshop.dto;
// chứa tất cả các thông tin cần tìm kiếm
public class ProductSearchModel {
	// tìm theo keyword
	private String keyword;
	private Integer categoryId;
	private Integer categoryParentId;
	private int page;
	private String seo;
	private Boolean isHot;
	
	public Boolean getIsHot() {
		return isHot;
	}
	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer integer) {
		this.categoryId = integer;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public Integer getCategoryParentId() {
		return categoryParentId;
	}
	public void setCategoryParentId(Integer categoryParentId) {
		this.categoryParentId = categoryParentId;
	}
	@Override
	public String toString() {
		return "ProductSearchModel [keyword=" + keyword + ", categoryId=" + categoryId + ", categoryParentId="
				+ categoryParentId + ", page=" + page + ", seo=" + seo + "]";
	}
	
}
