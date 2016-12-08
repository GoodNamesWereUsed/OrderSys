package com.ordersys.controller.manage.dishes;

import com.ordersys.controller.base.BaseController;
import com.ordersys.entity.Page;
import com.ordersys.service.manage.categories.CategoriesManager;
import com.ordersys.service.manage.dishes.DishesManager;
import com.ordersys.util.AppUtil;
import com.ordersys.util.Jurisdiction;
import com.ordersys.util.ObjectExcelView;
import com.ordersys.util.PageData;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：菜品管理
 */
@Controller
@RequestMapping(value="/dishes")
public class DishesController extends BaseController {
	
	String menuUrl = "dishes/list.do"; //菜单地址(权限用)
	@Resource(name="dishesService")
	private DishesManager dishesService;
	@Resource(name="categoriesService")
	private CategoriesManager categoriesService;
	
	/**保存
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/save")
	public ModelAndView save() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"新增Dishes");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "add")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("DISHES_ID", this.get32UUID());	//主键
		pd.put("ADD_USER",Jurisdiction.getUsername());
		dishesService.save(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**删除
	 * @param out
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter out) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"删除Dishes");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return;} //校验权限
		PageData pd = new PageData();
		pd = this.getPageData();
		dishesService.delete(pd);
		out.write("success");
		out.close();
	}
	
	/**修改
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"修改Dishes");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "edit")){return null;} //校验权限
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		dishesService.edit(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"列表Dishes");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		List<PageData>	varList = dishesService.list(page);	//列出Dishes列表
		for (int i = 0;i < varList.size();i++){
			String MENU_CATEGORIES_ID = varList.get(i).getString("MENU_CATEGORIES_ID");
			PageData catePd = new PageData();
			catePd.put("MENU_CATEGORIES_ID",MENU_CATEGORIES_ID);
			catePd = categoriesService.findById(catePd);
			varList.get(i).put("MENU_CATEGORIES_NAME",catePd.getString("MENU_CATEGORIES_NAME"));
		}
		mv.setViewName("manage/dishes/dishes_list");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		return mv;
	}
	
	/**去新增页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		List<PageData> varList = categoriesService.findAllCategories(pd);
		mv.setViewName("manage/dishes/dishes_edit");
		mv.addObject("msg", "save");
		mv.addObject("pd", pd);
		mv.addObject("varList",varList);
		return mv;
	}

	
	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goEdit")
	public ModelAndView goEdit()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = dishesService.findById(pd);	//根据ID读取
		List<PageData> varList = categoriesService.findAllCategories(pd);
		mv.setViewName("manage/dishes/dishes_edit");
		mv.addObject("msg", "edit");
		mv.addObject("varList",varList);
		mv.addObject("pd", pd);
		return mv;
	}

	/**去细阅页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/goRead")
	public ModelAndView goRead()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = dishesService.findById(pd);	//根据ID读取
		PageData catePd = new PageData();
		catePd = categoriesService.findById(pd);
		pd.put("MENU_CATEGORIES_NAME",catePd.getString("MENU_CATEGORIES_NAME"));
		System.out.println(pd);
		mv.setViewName("manage/dishes/dishes_read");
		mv.addObject("msg", "read");
		mv.addObject("pd", pd);
		return mv;
	}
	
	 /**批量删除
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"批量删除Dishes");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "del")){return null;} //校验权限
		PageData pd = new PageData();		
		Map<String,Object> map = new HashMap<String,Object>();
		pd = this.getPageData();
		List<PageData> pdList = new ArrayList<PageData>();
		String DATA_IDS = pd.getString("DATA_IDS");
		if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			dishesService.deleteAll(ArrayDATA_IDS);
			pd.put("msg", "ok");
		}else{
			pd.put("msg", "no");
		}
		pdList.add(pd);
		map.put("list", pdList);
		return AppUtil.returnObject(pd, map);
	}
	
	 /**导出到excel
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/excel")
	public ModelAndView exportExcel() throws Exception{
		logBefore(logger, Jurisdiction.getUsername()+"导出Dishes到excel");
		if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;}
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		Map<String,Object> dataMap = new HashMap<String,Object>();
		List<String> titles = new ArrayList<String>();
		titles.add("菜品名称");	//1
		titles.add("菜品简介");	//2
		titles.add("菜单详情");	//3
		titles.add("是否推荐菜品");	//4
		titles.add("菜品价格");	//5
		titles.add("添加人");	//6
		titles.add("状态");	//7
		titles.add("菜品分类");	//8
		dataMap.put("titles", titles);
		List<PageData> varOList = dishesService.listAll(pd);
		List<PageData> varList = new ArrayList<PageData>();
		for(int i=0;i<varOList.size();i++){
			PageData vpd = new PageData();
			vpd.put("var1", varOList.get(i).getString("DISHES_NAME"));	//1
			vpd.put("var2", varOList.get(i).getString("DISHES_SYNOPSIS"));	//2
			vpd.put("var3", varOList.get(i).getString("DISHES_DETAILS"));	//3
			vpd.put("var4", varOList.get(i).get("IS_RECOMMEND").toString());	//4
			vpd.put("var5", varOList.get(i).get("DISHES_PRICE").toString());	//5
			vpd.put("var6", varOList.get(i).getString("ADD_USER"));	//6
			vpd.put("var7", varOList.get(i).get("IS_EXISTENCE").toString());	//7
			vpd.put("var8", varOList.get(i).getString("MENU_CATEGORIES_ID"));	//8
			varList.add(vpd);
		}
		dataMap.put("varList", varList);
		ObjectExcelView erv = new ObjectExcelView();
		mv = new ModelAndView(erv,dataMap);
		return mv;
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
