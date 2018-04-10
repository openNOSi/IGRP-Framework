
package nosi.webapps.igrp.pages.transacaoorganica;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/


public class TransacaoOrganicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		TransacaoOrganicaView view = new TransacaoOrganicaView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'transacao' as transacao,'nome' as nome "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		String type = Igrp.getInstance().getRequest().getParameter("type");
		String id = Igrp.getInstance().getRequest().getParameter("id");
	
		if(Core.isInt(id) && Core.isNotNull(type)){
		
			model.setP_id(Integer.parseInt(id));
			model.setP_type(type);
			ArrayList<TransacaoOrganica.Table_1> data = new ArrayList<>();
			List<Transaction> transactions = null;
			if(type.equals("org")){
				transactions = new Organization().getOrgTransaction(new Organization().findOne(id).getApplication().getId());
			}else if(type.equals("perfil")){
				ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
				transactions = new Organization().getPerfilTransaction(p.getOrganization()!=null?p.getOrganization().getId():1);
			}          
			for(Transaction t:transactions){
				TransacaoOrganica.Table_1 table =new TransacaoOrganica.Table_1();
				table.setTransacao(t.getId());
				table.setNome(t.getDescr()+" ("+t.getCode()+")");
				Profile prof = new Profile();
				prof.setOrganization(new Organization().findOne(Integer.parseInt(id)));
				prof.setProfileType(new ProfileType().findOne(0));
				prof.setUser(new User().findOne(0));
				prof.setType_fk(t.getId());
				if(type.equals("perfil")){
					ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
					prof.setOrganization(p.getOrganization());
					prof.setProfileType(new ProfileType().findOne(p.getId()));
				}
				if((type.equals("org") && prof.isInsertedOrgTrans()) || (type.equals("perfil") && prof.isInsertedPerfTrans())){
					table.setTransacao_check(t.getId());
				}else{
					table.setTransacao_check(-1);
				}
				data.add(table);
			}
			
			view.table_1.addData(data);
		}
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		/*----#start-code(gravar)----*/
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && type!=null && id!=null){
			TransacaoOrganica model = new TransacaoOrganica();
			model.load();
			Profile profD = new Profile();
			if(type.equals("org")){
				profD.setOrganization(new Organization().findOne(Integer.parseInt(id)));
				profD.setType("TRANS");
				profD.setProfileType(new ProfileType().findOne(0));
				profD.setUser(new User().findOne(0));
				profD.deleteAllProfile();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType().findOne(Integer.parseInt(id));
				profD.setOrganization(pt.getOrganization());
				profD.setType("TRANS");
				profD.setUser(new User().findOne(0));
				profD.setProfileType(new ProfileType().findOne(Integer.parseInt(id)));
				profD.deleteAllProfile();
			}
			String [] trans = Igrp.getInstance().getRequest().getParameterValues("p_transacao");
			if(trans!=null  && trans.length>0){
				for(String x:trans){
					Profile prof = new Profile();
					prof.setUser(new User().findOne(0));
					prof.setType("TRANS");
					prof.setType_fk(Integer.parseInt(x.toString()));
					if(type.equals("org")){
						prof.setOrganization(new Organization().findOne(Integer.parseInt(id)));
						prof.setProfileType(new ProfileType().findOne(0));
					}else if(type.equals("perfil")){
						ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
						prof.setOrganization(p.getOrganization());
						prof.setProfileType(new ProfileType().findOne(Integer.parseInt(id)));
					}
					prof = prof.insert();
				}
			}
			Igrp.getInstance().getFlashMessage().addMessage("success", gt("Operação realizada com sucesso"));
          	return this.redirect("igrp", "TransacaoOrganica", "index","id="+id+"&type="+type);
		}
	
		/*----#end-code----*/
		
		return this.redirect("igrp","transacaoorganica","index");	
	}
	
	public Response actionGestao_de_transacoes() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","Transaccao","index");
		}
		
		----#gen-example */
		/*----#start-code(gestao_de_transacoes)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Transaccao","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
