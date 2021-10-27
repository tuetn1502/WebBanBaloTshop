package com.devpro.tshop.dto;

public class CategorySearchModel {
	private String keyword;
	private Integer categoryParentId;
	private Integer categoryId;
	private String seo;
	private int page;
	private Boolean status;
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getCategoryParentId() {
		return categoryParentId;
	}
	public void setCategoryParentId(Integer categoryParentId) {
		this.categoryParentId = categoryParentId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getSeo() {
		return seo;
	}
	public void setSeo(String seo) {
		this.seo = seo;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CategorySearchModel [keyword=" + keyword + ", categoryParentId=" + categoryParentId + ", categoryId="
				+ categoryId + ", seo=" + seo + ", page=" + page + ", status=" + status + "]";
	}
	
}
