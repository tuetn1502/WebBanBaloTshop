package com.devpro.tshop.dto;

import java.math.BigDecimal;

public class CartItem {
	// mã sản phẩm 
		private int productId;
		
		// tên sản phẩme
		private String productName;
		
		// số lương sản phẩm
		private int quality;
		
		// đơn giá sản phẩm
		private BigDecimal priceUnit;
		
		private String avatar;
		
		

		public String getAvatar() {
			return avatar;
		}

		public void setAvatar(String avatar) {
			this.avatar = avatar;
		}

		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public int getQuality() {
			return quality;
		}

		public void setQuality(int quality) {
			this.quality = quality;
		}

		public BigDecimal getPriceUnit() {
			return priceUnit;
		}

		public void setPriceUnit(BigDecimal priceUnit) {
			this.priceUnit = priceUnit;
		}
}
