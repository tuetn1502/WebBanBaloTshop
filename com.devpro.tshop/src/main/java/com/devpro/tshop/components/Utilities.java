package com.devpro.tshop.components;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.github.slugify.Slugify;

public class Utilities {
	
	public static String slugify(String tittle) {
		return new Slugify().slugify(tittle);
	}
	public static void main(String[] args) {
		//sử dung slugify tạo seo
		String productTittle ="Iphone 12 Promax";
		String productTittleSeo = new Slugify().slugify(productTittle);
		System.out.println(productTittleSeo);
		//tạo mã hoá cho mật khẩu
		System.out.println(new BCryptPasswordEncoder(13).encode("tuetn"));;
	}
}
