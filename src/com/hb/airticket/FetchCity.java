package com.hb.airticket;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.pojo.airticket.CityBean;
import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;


public class FetchCity {
	
	public FetchCity(){}
	public HashMap<String,String> getCityDetails(){
		
		HashMap<String,String> map = new HashMap<String,String>();
		StandardServiceRegistry ssr=new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();  
	    Metadata meta=new MetadataSources(ssr).getMetadataBuilder().build();  
	   
	    SessionFactory factory=meta.getSessionFactoryBuilder().build();  
	    Session session=factory.openSession();  
	    TypedQuery query = session.createQuery("from CityBean");
	    List <CityBean> list = query.getResultList();
	    Iterator <CityBean> itr =list.iterator();
		while(itr.hasNext()) {
			CityBean cb = itr.next();
			map.put(cb.getCity_code(), cb.getCity_name());
		}
		session.close();
		return map;	
	}
	
//	public static void main(String[] args) {
//		HashMap<String,String> map = new HashMap<String,String>();
//		map = FetchCity.getCityDetails();
//		System.out.println(map);
//	}
}
