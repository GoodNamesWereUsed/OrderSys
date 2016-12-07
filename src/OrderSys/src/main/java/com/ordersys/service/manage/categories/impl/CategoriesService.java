package com.ordersys.service.manage.categories.impl;

import com.ordersys.dao.DaoSupport;
import com.ordersys.entity.Page;
import com.ordersys.service.manage.categories.CategoriesManager;
import com.ordersys.util.PageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 说明： 菜单分类管理
 */
@Service("categoriesService")
public class CategoriesService implements CategoriesManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("CategoriesMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("CategoriesMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("CategoriesMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("CategoriesMapper.datalistPage", page);
	}

	public List<PageData> findAllCategories(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("CategoriesMapper.findAllCategories",pd);
	}

	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("CategoriesMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("CategoriesMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

