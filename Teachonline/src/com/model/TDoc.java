package com.model;

/**
 * TDoc generated by MyEclipse Persistence Tools
 */

public class TDoc implements java.io.Serializable
{

	private Integer id;
	private String mingcheng;
	private String fujian;
	private String fujianYuanshiming;

	private String shijian;
	private String del;
	//setter ��getter ����
	public String getDel()
	{
		return del;
	}
	public void setDel(String del)
	{
		this.del = del;
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
	public void setFujianYuanshiming(String fujianYuanshiming)
	{
		this.fujianYuanshiming = fujianYuanshiming;
	}
	public Integer getId()
	{
		return id;
	}
	public void setId(Integer id)
	{
		this.id = id;
	}
	public String getMingcheng()
	{
		return mingcheng;
	}
	public void setMingcheng(String mingcheng)
	{
		this.mingcheng = mingcheng;
	}
	public String getShijian()
	{
		return shijian;
	}
	public void setShijian(String shijian)
	{
		this.shijian = shijian;
	}

}