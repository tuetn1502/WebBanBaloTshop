package com.devpro.tshop.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.tshop.dto.CategorySearchModel;
import com.devpro.tshop.entities.Categories;

@Service
public class CategoryService extends BaseService<Categories> {

	@Override
	protected Class<Categories> clazz() {
		// TODO Auto-generated method stub
		return Categories.class;
	}
	public PagerData<Categories> search(CategorySearchModel searchModel){
		//Khởi tạo câu truy vấn
		String sql = "SELECT * FROM balotshop.tbl_category c WHERE 1=1";
		if (searchModel != null) {
			
			if (!StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and c.seo = '"+searchModel.getSeo()+"'";
			}
		}
		return runTransactQuerySQL(sql, searchModel ==null?0:searchModel.getPage());
		
	}
	
}
