package com.devpro.tshop.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.tshop.components.Utilities;
import com.devpro.tshop.dto.ProductSearchModel;
import com.devpro.tshop.entities.ProductImages;
import com.devpro.tshop.entities.Products;




@Service // là 1 bean<service>
public class ProductService extends BaseService<Products> {

	@Autowired
	private ProductImagesService productImagesService;
	
	@Override
	protected Class<Products> clazz() {
		return Products.class;
	}

	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}

	/**
	 * Dùng để thêm mới sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Products add(Products p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) {
			// tạo đường dẫn tới folder chứa avatar
			String pathToFile = UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename();
			
			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToFile));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) {

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImage(pi);
			}
		}
		//tạo seo
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);
	}

	/**
	 * Cập nhật sản phẩm
	 * 
	 * @param p
	 * @param productAvatar
	 * @param productPictures
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@Transactional
	public Products update(Products p, MultipartFile productAvatar, MultipartFile[] productPictures) throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Products productInDb = super.getById(p.getId());

		// có đẩy avartar mới không ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File(UPLOAD_FOLDER_ROOT + productInDb.getAvatar()).delete();

			// add avartar moi
			productAvatar
					.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/avatar/" + productAvatar.getOriginalFilename()));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
			p.setStatus(true);
		} else {
			// su dung lai avatar cu
			p.setAvatar(productInDb.getAvatar());
			p.setStatus(true);
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImage() != null && productInDb.getProductImage().size() > 0) {
				for (ProductImages opi : productInDb.getProductImage()) {
					// xóa avatar trong folder lên
					new File(UPLOAD_FOLDER_ROOT + opi.getPath()).delete();

					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File(UPLOAD_FOLDER_ROOT + "product/pictures/" + pic.getOriginalFilename()));

				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImage(pi);
			}
		}
		//tạo seo
		p.setSeo(Utilities.slugify(p.getTitle()));
		// lưu vào database
		return super.saveOrUpdate(p);

	}
	
	public PagerData<Products> search(ProductSearchModel searchModel){
		//Khởi tạo câu truy vấn
		String sql = "SELECT * FROM balotshop.tbl_products p WHERE 1=1";
		if (searchModel != null) {
			// tìm kiếm theo category
			if (searchModel.getCategoryId() != null) {
				sql += " and p.category_id = "+searchModel.getCategoryId();
			}
			if (!StringUtils.isEmpty(searchModel.getSeo())) {
				sql += " and p.seo = '"+searchModel.getSeo()+"'";
			}
			// tìm kiếm sản phẩm hot
//			if (searchModel.getIsHot() == false) {
//				sql += " and p.is_hot = '"+searchModel.getIsHot()+"'";
//			}
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%"+ searchModel.getKeyword()+"%'"+"or p.detail_description like '%"
						+ searchModel.getKeyword() +"%'"+"or p.short_description like '%"+ searchModel.getKeyword()+ "%')";
			}
		}
		return runTransactQuerySQL(sql, searchModel ==null?0:searchModel.getPage());	
	}
	public PagerData<Products> searchByParentID(ProductSearchModel searchModel){
		//Khởi tạo câu truy vấn
		String sql = "SELECT * FROM balotshop.tbl_products p ,balotshop.tbl_category c WHERE 1=1 and p.category_id=c.id";
		if (searchModel != null) {
			// tìm kiếm theo category
			if (searchModel.getCategoryId() != null) {
				sql += " and c.parent_id = "+searchModel.getCategoryId();
				System.out.println(sql);
			}
		}
		sql = sql+" order by p.id;";
		return runTransactQuerySQL(sql, searchModel ==null?0:searchModel.getPage());	
	}
	
	
}
