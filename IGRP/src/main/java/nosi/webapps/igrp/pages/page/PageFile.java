package nosi.webapps.igrp.pages.page;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Part;

import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.FileHelper;

/**
 * Emanuel
 * 18 Jul 2019
 */
public class PageFile {

	private String fileXml;
	private String fileJson;
	private String fileXsl;
	private String fileModel;
	private String fileView;
	private String fileController;
	private String filePageDelegate;
	
	public PageFile() {
		try {
			Part fileXml = Core.getFile("p_page_xml");
			Part fileJson = Core.getFile("p_data");
			Part fileXsl = Core.getFile("p_page_xsl");
			Part fileModel = Core.getFile("p_model");
			Part fileView = Core.getFile("p_view");
			Part fileController = Core.getFile("p_controller");
			Part filePageDelegate = Core.getFile("p_interface");
			
			if(fileXml!=null) {
				this.setFileXml(new FileHelper().convertToString(fileXml.getInputStream()));
				fileXml.delete();
			}
			if(fileJson!=null) {
				this.setFileJson(new FileHelper().convertToString(fileJson.getInputStream()));
				fileJson.delete();
			}
			if(fileXsl!=null) {
				this.setFileXsl(new FileHelper().convertToString(fileXsl.getInputStream()));
				fileXsl.delete();
			}
			if(fileModel!=null) {
				this.setFileModel(new FileHelper().convertToString(fileModel.getInputStream()));
				fileModel.delete();
			}
			if(fileView!=null) {
				this.setFileView(new FileHelper().convertToString(fileView.getInputStream()));
				fileView.delete();
			}
			if(fileController!=null) {
				this.setFileController(new FileHelper().convertToString(fileController.getInputStream()));
				fileController.delete();
			}
			
			if(filePageDelegate != null) {
				this.setFilePageDelegate(new FileHelper().convertToString(filePageDelegate.getInputStream()));
				filePageDelegate.delete();
			}
		} catch (IOException | ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String getFileXml() {
		return fileXml;
	}
	public void setFileXml(String fileXml) {
		this.fileXml = fileXml;
	}
	public String getFileJson() {
		return fileJson;
	}
	public void setFileJson(String fileJson) {
		this.fileJson = fileJson;
	}
	public String getFileXsl() {
		return fileXsl;
	}
	public void setFileXsl(String fileXsl) {
		this.fileXsl = fileXsl;
	}
	public String getFileModel() {
		return fileModel;
	}
	public void setFileModel(String fileModel) {
		this.fileModel = fileModel;
	}
	public String getFileView() {
		return fileView;
	}
	public void setFileView(String fileView) {
		this.fileView = fileView;
	}
	public String getFileController() {
		return fileController;
	}
	public void setFileController(String fileController) {
		this.fileController = fileController;
	}
	public String getFilePageDelegate() {
		return filePageDelegate;
	}
	public void setFilePageDelegate(String filePageDelegate) {
		this.filePageDelegate = filePageDelegate;
	}
	
	public boolean xslFileExists() {
		return Core.isNotNull(this.getFileXsl());
	}
	
	public boolean xmlFileExists() {
		return Core.isNotNull(this.getFileXml());
	}	
	
	public boolean jsonFileExists() {
		return Core.isNotNull(this.getFileJson());
	}
	
	public boolean modelFileExists() {
		return Core.isNotNull(this.getFileModel());
	}
	
	public boolean viewFileExists() {
		return Core.isNotNull(this.getFileView());
	}	
	
	public boolean controllerFileExists() {
		return Core.isNotNull(this.getFileController());
	}
	public boolean pageDelegateFileExists() {
		return Core.isNotNull(this.getFilePageDelegate());
	}

	public boolean isAllFileExists() {
		return this.pageDelegateFileExists() && this.modelFileExists() && this.viewFileExists() && this.controllerFileExists()
				&& this.jsonFileExists() && this.xmlFileExists() && this.xslFileExists();
	}
}
