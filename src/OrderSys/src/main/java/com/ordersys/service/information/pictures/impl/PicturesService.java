package com.ordersys.service.information.pictures.impl;

import com.ordersys.dao.DaoSupport;
import com.ordersys.entity.Page;
import com.ordersys.service.information.pictures.PicturesManager;
import com.ordersys.service.manage.picture_used_details.Picture_Used_DetailsManager;
import com.ordersys.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/** 图片管理
 */
@Service("picturesService")
public class PicturesService implements PicturesManager {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	@Resource(name = "picture_used_detailsService")
	private Picture_Used_DetailsManager picture_used_detailsService;
	
	/**列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("PicturesMapper.datalistPage", page);
	}
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("PicturesMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		/**
		 * notes start
		 *
		 * decription :  由于业务需求，在删除图片时,先删除其使用详情
		 * @Author huangMP
		 */
		picture_used_detailsService.deleteByPictureID(pd.getString("PICTURES_ID"));
		/**
		 * notes end
		 */
		dao.delete("PicturesMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("PicturesMapper.edit", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("PicturesMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{

		/**
		 * notes start
		 *
		 * decription : 由于业务需求，在删除图片时,先删除其使用详情
		 * @Author huangMP
		 */
		picture_used_detailsService.deleteAllByPicturesId(ArrayDATA_IDS);
		/**
		 * notes end
		 */
		dao.delete("PicturesMapper.deleteAll", ArrayDATA_IDS);
	}
	
	/**批量获取
	 * @param ArrayDATA_IDS
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> getAllById(String[] ArrayDATA_IDS)throws Exception{
		return (List<PageData>)dao.findForList("PicturesMapper.getAllById", ArrayDATA_IDS);
	}
	
	/**删除图片
	 * @param pd
	 * @throws Exception
	 */
	public void delTp(PageData pd)throws Exception{
		dao.update("PicturesMapper.delTp", pd);
	}
	
}

