package cv.nosi.webapps.igrp.pages.detalhesprocesso;

import java.io.IOException;

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.QueryInterface;
import cv.nosi.core.webapp.util.helpers.database.ResultSet;
import cv.nosi.core.webapp.workflow.activit.rest.business.TaskServiceIGRP;
import cv.nosi.core.webapp.workflow.activit.rest.entities.DeploymentService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessDefinitionService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ProcessInstancesService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.ResourcesService;
import cv.nosi.core.webapp.workflow.activit.rest.entities.TaskServiceQuery;
import cv.nosi.core.webapp.workflow.activit.rest.services.DeploymentServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessDefinitionServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ProcessInstanceServiceRest;
import cv.nosi.core.webapp.workflow.activit.rest.services.ResourceServiceRest;
import cv.nosi.core.webapp.workflow.bpmn.BPMNConstants;
		
public class DetalhesProcessoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		DetalhesProcesso model = new DetalhesProcesso();
		model.load();
		DetalhesProcessoView view = new DetalhesProcessoView();
		/*----#start-code(index)----*/
	

		String taskId = Core.getParam(BPMNConstants.PRM_TASK_ID);
		String processId = Core.getParam(BPMNConstants.PRM_PROCESS_ID);
		String process_definitionId = Core.getParam(BPMNConstants.PRM_DEFINITION_ID);
		boolean showView = Core.isNotNullMultiple(processId,process_definitionId);
		if(Core.isNotNull(taskId)) {
			TaskServiceIGRP taskQuery = new TaskServiceIGRP();
			taskQuery.addFilterBody("taskId", taskId);
			for(TaskServiceQuery task:taskQuery.queryHistoryTask()) {
				model.setNumero_de_processo(task.getProcessInstanceId());
				process_definitionId = task.getProcessDefinitionId();
				ProcessDefinitionService process = new ProcessDefinitionServiceRest().getProcessDefinition(task.getProcessDefinitionId());
				ProcessInstancesService history = new ProcessInstanceServiceRest().historicProcess(task.getProcessInstanceId());
				DeploymentService deploy = new DeploymentServiceRest().getDeployment(process.getDeploymentId());
				model.setData_criacao_de_processo(Core.isNotNull(deploy.getDeploymentTime())?Core.ToChar(deploy.getDeploymentTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setDescricao(Core.isNotNull(process.getDescription())?process.getDescription():process.getName());
				model.setData_inicio_de_processo(Core.isNotNull(history.getStartTime())?Core.ToChar(history.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				model.setData_fim_processo(Core.isNotNull(history.getEndTime())?Core.ToChar(history.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"):"");
				break;
			}
			processId = model.getNumero_de_processo();
		}

		ProcessDefinitionServiceRest processDefinitionRest =new ProcessDefinitionServiceRest();
		//Get Diagram in runtime
		String content = processDefinitionRest.getProcessDiagram(processId);
		if(content!=null) {
			//System.out.println(content);
			view.img_1.setValue("data:image/png;base64,"+content);
		}else {
			//Get Diagram on historic
			ProcessDefinitionService p = processDefinitionRest.getProcessDefinition(process_definitionId);
			if(Core.isNotNull(p.getDiagramResource())) {
				ResourceServiceRest resource = new ResourceServiceRest();
				ResourcesService r = resource.getResource(p.getDiagramResource());
				if(Core.isNotNull(r.getContentUrl())) {
					content = resource.getResourceContent(r.getContentUrl());
					view.img_1.setValue("data:image/png;base64,"+content);
				}
			}
		}
		if(showView) {
			view.view_1.setVisible(false);
			view.sectionheader_1.setVisible(false);
		}
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
