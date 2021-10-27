package com.devpro.tshop.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "tbl_category")
public class Categories extends BaseEntity {

	@Column(name = "name", length = 100, nullable = false)
	private String name;

	@Column(name = "description", length = 100, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;
	

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parent_id") // seft joing
	private Categories parentId;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parentId") // Ten Property trong many to one
	private Set<Categories> childs = new HashSet<Categories>();

	public void addChildCategory(Categories category) {
		this.childs.add(category);
		category.setParentId(this);
	}

	public void deleteChildCategory(Categories category) {
		this.childs.remove(category);
		category.setParentId(null);
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "categories") // Ten Property trong many to one
	private Set<Products> products = new HashSet<Products>();

	// Trong phia OneToMany can dinh nghia 2 methods
	// tro giup cho viec them moi va xoa.
	public void addProduct(Products product) {
		this.products.add(product);
		product.setCategories(this);
	}

	public void deleteProduct(Products product) {
		this.products.remove(product);
		product.setCategories(null);
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Categories getParentId() {
		return parentId;
	}

	public void setParentId(Categories parentId) {
		this.parentId = parentId;
	}

	public Set<Categories> getChilds() {
		return childs;
	}

	public void setChilds(Set<Categories> childs) {
		this.childs = childs;
	}
	public Set<Products> getProducts() {
		return products;
	}

	public void setProducts(Set<Products> products) {
		this.products = products;
	}

//	@Override
//	public String toString() {
//		return "Categories [name=" + name + ", description=" + description + ", seo=" + seo + ", parentId=" + parentId
//				+ ", childs=" + childs + ", products=" + products + "]";
//	}

	
}
