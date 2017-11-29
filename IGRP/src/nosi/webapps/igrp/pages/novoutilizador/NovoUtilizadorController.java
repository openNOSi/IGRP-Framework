/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novoutilizador;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.core.webapp.activit.rest.UserService;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class NovoUtilizadorController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoUtilizador model = new NovoUtilizador();
		model.load();
		NovoUtilizadorView view = new NovoUtilizadorView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
		view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && !id.equals("")){
			User u =  (User) new User().findIdentityById(Integer.parseInt(id));
			view.email.setValue(u.getEmail());
		}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			NovoUtilizador model = new NovoUtilizador();
			model.load();
			Profile p = new Profile();
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			p.setProfileType(new ProfileType().findOne(model.getPerfil()));
			p.setType("PROF");
			User u = new User().find().andWhere("email", "=", model.getEmail()).one();
			if(u!=null){
				p.setUser(u);
				p.setType_fk(model.getPerfil());
				p = p.insert();
				if(p!=null){
					p = new Profile();
					p.setUser(u);
					p.setOrganization(new Organization().findOne(model.getOrganica()));
					p.setProfileType(new ProfileType().findOne(model.getPerfil()));
					p.setType("ENV");
					p.setType_fk(model.getAplicacao());
					p = p.insert();
					if(p!=null){
						//Associa utilizador a grupo no Activiti
						UserService userActiviti0 = new UserService();
						userActiviti0.setId(u.getUser_name());
						userActiviti0.setPassword("password.igrp");
						userActiviti0.setFirstName(u.getName());
						userActiviti0.setLastName("");
						userActiviti0.setEmail(u.getEmail());
						userActiviti0.create(userActiviti0);	
						new GroupService().addUser(p.getOrganization().getCode()+"."+p.getProfileType().getCode(),userActiviti0.getId());
						Igrp.getInstance().getFlashMessage().addMessage("success",gt("Opera��o efetuada com sucesso"));
					}else{
						Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta opera��o"));
					}
				}else{
					Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta opera��o"));
				}
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Email inv�lido"));
			}
		}
		return this.redirect("igrp", "novo-utilizador", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	public Response actionEditar(@RParam(rParamName = "p_id") String idProfile) throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		if(idProfile!=null){
			Profile p = new Profile().findOne(Integer.parseInt(idProfile));
			if(p!=null){
				NovoUtilizador model = new NovoUtilizador();
				model.setAplicacao(p.getProfileType().getApplication().getId());
				model.setOrganica(p.getOrganization().getId());
				model.setPerfil(p.getProfileType().getId());
				
				NovoUtilizadorView view = new NovoUtilizadorView(model);
				view.aplicacao.setValue(new Application().getListApps());
				view.organica.setValue(new Organization().getListOrganizations(model.getAplicacao()));
				view.perfil.setValue(new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()));
				view.email.setValue(p.getUser().getEmail());
				view.btn_gravar.setLink("editarProfile&p_id="+idProfile);
				return this.renderView(view);
			}
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEditarProfile(@RParam(rParamName = "p_id") String id) throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		if(Igrp.getMethod().equalsIgnoreCase("post") && id!=null){
			NovoUtilizador model = new NovoUtilizador();
			model.load();
			Profile p = new Profile().findOne(Integer.parseInt(id));
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			p.setProfileType(new ProfileType().findOne(model.getPerfil()));
			p.setType("PROF");
			User u = new User().find().andWhere("email", "=", model.getEmail()).one();
			if(u!=null){
				p.setUser(u);
				p.setType_fk(model.getPerfil());
				p = p.update();
				if(p!=null){
					Core.setMessageSuccess();
					return this.forward("igrp", "novo-utilizador", "editar&p_id="+id);
				}else{
					Core.setMessageError();
				}
			}else{
				Core.setMessageError(gt("Email inv�lido"));
			}
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}
	/*----#END-PRESERVED-AREA----*/
}
