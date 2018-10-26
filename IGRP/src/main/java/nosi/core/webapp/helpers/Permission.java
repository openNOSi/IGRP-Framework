package nosi.core.webapp.helpers;
/**
 * @author Emanuel Pereira
 * May 29, 2017
 */

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.Optional;

import javax.servlet.http.Cookie;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

public class Permission {
	private static final String ENCODE = "UTF-8";
	private static final int MAX_AGE = 60*60*24;//24h
	
	public boolean isPermition(String app,String page,String action){//check permission on app		
		if(Igrp.getInstance().getUser()!=null && Igrp.getInstance().getUser().isAuthenticated()){
			if(!new EncrypDecrypt().getWakandaList(app+"/"+page+"/"+action) ||
					(action.equalsIgnoreCase("index") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("home")) || 			
					(action.equalsIgnoreCase("myMenu") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("pesquisar-menu"))|| 
					(action.equalsIgnoreCase("myApps") && app.equalsIgnoreCase("igrp_studio") && page.equalsIgnoreCase("env")) ||				
					(action.equalsIgnoreCase("permission") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||				
					(action.equalsIgnoreCase("notFound") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page"))  ||
					(action.equalsIgnoreCase("openApp") && app.equalsIgnoreCase("igrp_studio") && page.equalsIgnoreCase("env"))
				  ){
				return true;
			}
			boolean x = new Application().getPermissionApp(app);
			if(!x){
				x = new Menu().getPermissionMen(app);
			}
			return x;
		}else if(
					(action.equalsIgnoreCase("login") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("login")) ||
					(action.equalsIgnoreCase("permission") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||
					(action.equalsIgnoreCase("exception") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")) ||
					(action.equalsIgnoreCase("notFound") && app.equalsIgnoreCase("igrp") && page.equalsIgnoreCase("error-page")))
		{
			return true;
		}
		return false;
	}
	
	public  boolean isPermission(String transaction){
		return new Transaction().getPermission(transaction);
	}

	public  void changeOrgAndProfile(String dad){
		Application app = new Application().find().andWhere("dad", "=", dad).one();
		ProfileType profType = new ProfileType();
		Organization org = new Organization();
		Profile prof = new Profile();
		if(app!=null){			
			int id_user = 0;
			
			try {// eliminar 
				id_user = Igrp.getInstance()
						.getUser().
						getIdentity().
						getIdentityId();
			}catch(Exception e) {
				
			}
			
			if(app.getPermissionApp(dad)){
				prof = (Profile) prof.getByUserPerfil(id_user,app.getId());
				if(prof!=null){
					 org.setId(prof.getOrganization().getId());
					 profType.setId(prof.getProfileType().getId());
					 ApplicationPermition appP = new ApplicationPermition(dad, prof.getOrganization().getId(), prof.getProfileType().getId());
					try {
						String json = Core.toJson(appP);
						Cookie cookie = new Cookie(dad, URLEncoder.encode( json,ENCODE));
						cookie.setMaxAge(MAX_AGE);
						Igrp.getInstance().getResponse().addCookie(cookie);
					} catch (UnsupportedEncodingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}		
		((User)Igrp.getInstance().getUser().getIdentity()).setAplicacao(app);
		((User)Igrp.getInstance().getUser().getIdentity()).setProfile(profType);
		((User)Igrp.getInstance().getUser().getIdentity()).setOrganica(org);
		if(Igrp.getInstance().getRequest().getSession()!=null && app!=null) {
			ApplicationPermition appP = new ApplicationPermition(dad, org.getId(), profType.getId());
			try {
				String json = Core.toJson(appP);
				Cookie cookie = new Cookie(dad, URLEncoder.encode( json,ENCODE));
				cookie.setMaxAge(MAX_AGE);
				Igrp.getInstance().getResponse().addCookie(cookie);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public  String getCurrentEnv() {
		ApplicationPermition appP = this.getApplicationPermition();
		return appP!=null && !appP.getDad().equals("")?appP.getDad():"igrp";
	}
	
	public  Integer getCurrentPerfilId() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null && appP.getProfId()!=null)
			return appP.getProfId();
		return -1;
	}

	public  Integer getCurrentOrganization() {
		ApplicationPermition appP = this.getApplicationPermition();
		if(appP!=null && appP.getOgrId()!=null)
			return appP.getOgrId();
		return -1;
	}
	
	public ApplicationPermition getApplicationPermition() {
		String dad = Core.getParam("dad");
		Optional<Cookie> cookies = Igrp.getInstance().getRequest().getCookies()!=null?Arrays.asList(Igrp.getInstance().getRequest().getCookies()).stream().filter(c -> c.getName().equalsIgnoreCase(dad)).findFirst():null;
		String json = (cookies!=null && cookies.isPresent())?cookies.get().getValue():null;
		if(json!=null) {
			try {
				json = URLDecoder.decode(json,ENCODE);
				if(Core.isNotNull(json)) {
					ApplicationPermition appP = (ApplicationPermition) Core.fromJson(json, ApplicationPermition.class);
					return appP;
				}
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}