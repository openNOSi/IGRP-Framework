package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.helpers.Permission;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name = "tbl_organization")
public class Organization extends BaseActiveRecord<Organization> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3697544500624399720L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false, unique = true)
	private String code;
	@Column(nullable = false)
	private String name;
	private int status;
	@ManyToOne(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER)
	@JoinColumn(name = "env_fk", foreignKey = @ForeignKey(name = "ORGANIZATION_ENV_FK"), nullable = false)
	private Application application;
	@ManyToOne
	@JoinColumn(name = "user_created_fk", foreignKey = @ForeignKey(name = "ORGANIZATION_USER_FK"), nullable = false)
	private User user;
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "self_fk", foreignKey = @ForeignKey(name = "ORGANIZATION_SELF_FK"), nullable = true)
	private Organization organization;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "organization")
	private List<ProfileType> profilesType;
	@OneToMany(mappedBy = "organization")
	private List<Profile> profiles;

	public Organization() {
	}

	public Organization(String code, String name, int status, Application application, User user,
			Organization organization) {
		super();
		this.code = code;
		this.name = name;
		this.status = status;
		this.application = application;
		this.user = user;
		this.organization = organization;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<ProfileType> getProfilesType() {
		return profilesType;
	}

	public void setProfilesType(List<ProfileType> profilesType) {
		this.profilesType = profilesType;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}

	public HashMap<String, String> getListMyOrganizations() {
		HashMap<String, String> lista = new HashMap<>();
		lista.put("", "-- Selecionar --");
		for (Profile p : new Profile().getMyPerfile()) {
			lista.put(p.getOrganization().getId() + "", p.getOrganization().getName());
		}
		return lista;
	}

	public HashMap<String, String> getListOrganizations() {
		HashMap<String, String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for (Organization o : this.findAll()) {
			lista.put(o.getId() + "", o.getName());
		}
		return lista;
	}

	public HashMap<String, String> getListOrganizations(int app) {
		HashMap<String, String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for (Organization o : this.find().andWhere("application.id", "=", app).all()) {
			lista.put(o.getId() + "", o.getName());
		}
		return lista;
	}

	public List<Menu> getOrgMenu(int env_fk) {
		
		Menu m = new Menu();
//		String dad = Permission.getCurrentEnv();
//		Menu m1 = new Menu();
//		if ("igrp".equalsIgnoreCase(dad)) {
////			First shows all the apps than all the public apps in the menu
//			List<Menu> list = m1.find().andWhere("action", "notnull")
//					.andWhere("status", "=", 1).andWhere("application", "=", env_fk).all();
//			List<Menu> publico = m.find().andWhere("action", "notnull").andWhere("flg_base", "=", 1)
//					.andWhere("status", "=", 1).andWhere("application", "<>", env_fk).all();
//			
//			if (list != null) {
//				list.addAll(publico);
//				return list;
//			}			
//
//			return publico;
//		} else {
			List<Menu> myMenu = new ArrayList<>();
			List<Menu> menu = m.getMyMen_de_env(env_fk);
			if (menu != null) {
				for (Menu mm : menu) {
					Menu e = new Menu();					
					e.setDescr(mm.getApplication().getId()==env_fk?gt(mm.getDescr()):setMenuDescr(mm));
					e.setId(mm.getId());
					e.setFlg_base(mm.getFlg_base());
					myMenu.add(e);
				}
			}
			return myMenu;
		}
//	}

	public List<Menu> getPerfilMenu(Integer org) {
		Profile pr = new Profile();
		List<Profile> profiles = pr
				.findAll(pr.getCriteria().where(pr.getBuilder().equal(pr.getRoot().get("type"), "MEN"),
						pr.getBuilder().equal(pr.getRoot().get("organization"), org),
						pr.getBuilder().equal(pr.getRoot().get("profileType"), 0)));
		List<Menu> menus = new ArrayList<>();
		Application a = new Application();				
		for (Profile p : profiles) {			
			Menu e = new Menu().findOne(p.getType_fk());
			
			e.setDescr(e.getApplication().getId()==a.findOne(a.getCriteria().where(a.getBuilder().equal(a.getRoot().get("dad"),new Permission().getCurrentEnv() ))).getId()?setMenuDescr(e):gt(e.getDescr()));				
			menus.add(e);
		}
		return menus;
	}

private String setMenuDescr(Menu e) {
	return "("+e.getApplication().getName()+ ") "+gt(e.getDescr());
}

	public List<Transaction> getOrgTransaction(Integer app) {
		return new Transaction().find().andWhere("application", "=",app).all();
	}

	public List<Transaction> getPerfilTransaction(int org) {
		Profile pr = new Profile();
		List<Profile> profiles = pr
				.findAll(pr.getCriteria().where(pr.getBuilder().equal(pr.getRoot().get("type"), "TRANS"),
						pr.getBuilder().equal(pr.getRoot().get("organization"), org),
						pr.getBuilder().equal(pr.getRoot().get("profileType"), 0)));
		List<Transaction> trans = new ArrayList<>();
		for (Profile p : profiles) {
			trans.add(new Transaction().findOne(p.getType_fk()));
		}
		return trans;
	}
}