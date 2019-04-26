package com.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TDocDAO;
import com.dao.TShitiDAO;
import com.model.TDoc;
import com.model.TShiti;
import com.opensymphony.xwork2.ActionSupport;

public class shitiAction extends ActionSupport
{
	private int id;
	private String mingcheng;
	private String fujian;
	private String fujianYuanshiming;
	 
	private String message;
	private String path;
	
	private TShitiDAO shitiDAO;
	
	public String shitiAdd()
	{
		TShiti shiti=new TShiti();
		shiti.setMingcheng(mingcheng);
		shiti.setFujian(fujian);
		shiti.setFujianYuanshiming(fujianYuanshiming);
		shiti.setShijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		shiti.setDel("no");
		shitiDAO.save(shiti);
		this.setMessage("操作成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shitiDel()
	{
		TShiti shiti=shitiDAO.findById(id);
		shiti.setDel("yes");
		shitiDAO.attachDirty(shiti);
		this.setMessage("删除成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shitiMana()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	

	public String shitiAll()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	public String shitiDetailQian()
	{
		TShiti shiti=shitiDAO.findById(id);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shiti", shiti);
		return ActionSupport.SUCCESS;
	}

	public String getFujian()
	{
		return fujian;
	}

	public void setFujian(String fujian)
	{
		this.fujian = fujian;
	}

	public String getFujianYuanshiming()
	{
		return fujianYuanshiming;
	}

	public TShitiDAO getshitiDAO()
	{
		return shitiDAO;
	}

	public void setshitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}

	public void setFujianYuanshiming(String fujianYuanshiming)
	{
		this.fujianYuanshiming = fujianYuanshiming;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public TShitiDAO getShitiDAO()
	{
		return shitiDAO;
	}

	public void setShitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getMingcheng()
	{
		return mingcheng;
	}

	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}
	
}
