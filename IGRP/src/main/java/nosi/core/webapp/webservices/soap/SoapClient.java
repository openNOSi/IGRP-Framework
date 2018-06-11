package nosi.core.webapp.webservices.soap;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPConstants;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;

import cjm.component.cb.map.ToMap;
import cjm.component.cb.xml.ToXML;

/**
 * Iekiny Marcel
 * May 22, 2018
 */
public class SoapClient {
	
	private String wsdl;
	private Map<String, String> headers;
	private SOAPMessage request;
	
	private SOAPMessage response;
	
	private List<String> errors;
	
	public SoapClient() {
		errors = new ArrayList<String>();
	}
	
	public SoapClient(String wsdl) {
		this();
		this.wsdl = wsdl;
	}
	
	public SoapClient(String wsdl, Map<String, String> headers) {
		this(wsdl);
		this.headers = headers;
	}
	
	public void call() {
		try {
			SOAPConnectionFactory sfc = SOAPConnectionFactory.newInstance();
		    SOAPConnection connection = sfc.createConnection();
		    URL url = new URL(this.wsdl);
		    this.request.writeTo(System.out);
		    this.response = connection.call(this.request, url);
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
	}
	
	public Map<String, Object> getResponseBody() {
		Map<String, Object> result = null;
		try {
			ToMap toMap = new ToMap();
			String xml = "";
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			response.writeTo(out);
			xml = new String(out.toByteArray());
			result = toMap.convertToMap(xml); 
			
			if(result != null && !result.isEmpty()) 
				result = (Map<String, Object>) result.get("soap:Envelope");
				if(result != null && !result.isEmpty()) 
					result = (Map<String, Object>) result.get("soap:Body");
				
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public Map<String, Object> getResponseHeader() {
		Map<String, Object> result = null;
		try {
			ToMap toMap = new ToMap();
			String xml = "";
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			response.writeTo(out);
			xml = new String(out.toByteArray());
			result = toMap.convertToMap(xml); 
			
			if(result != null && !result.isEmpty()) 
				result = (Map<String, Object>) result.get("soap:Envelope");
				if(result != null && !result.isEmpty()) 
					result = (Map<String, Object>) result.get("soap:Header");
				
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public void doRequest(String xmlContent) {
		ByteArrayInputStream is = new ByteArrayInputStream(xmlContent.getBytes());
		try {
			MimeHeaders h = new MimeHeaders();
			 if(this.headers != null) {
			    	this.headers.forEach((k,v)->{
			    		h.addHeader(k, v);
			    	});
			 }
			this.request = MessageFactory.newInstance(SOAPConstants.SOAP_1_2_PROTOCOL).createMessage(h, is);	
		} catch (IOException | SOAPException e) {
			e.printStackTrace();
		}finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void doRequest(Map<String, String> namespaces, Map<String, Object> bodyContent) {
		try {
			MessageFactory messageFactory = MessageFactory.newInstance();
			request = messageFactory.createMessage();
			SOAPPart soapPart = request.getSOAPPart();
	   	    SOAPEnvelope soapEnvelope = soapPart.getEnvelope();
	   	    
	   	    if(namespaces != null)
	   	    	namespaces.forEach((k, v)->{
	   	    		try {
						soapEnvelope.addNamespaceDeclaration(k, v);
					} catch (SOAPException e) {
						e.printStackTrace();
					}
	   	    	});
	   	  
	   	 if(this.headers != null)
		    	this.headers.forEach((k,v)->{
		    		request.getMimeHeaders().addHeader(k, v);
		    	});
	   	    
			SOAPBody soapBody = soapEnvelope.getBody();
			
			ToXML toXml = new ToXML();
			String rawXml = String.valueOf(toXml.convertToXML(bodyContent, true));
			
			
			soapBody.addTextNode(":_r");
			
			request.saveChanges();
			 
			 ByteArrayOutputStream out = new ByteArrayOutputStream();
			request.writeTo(out);
			String xml = new String(out.toByteArray());
			xml = xml.replace(":_r", rawXml);
			
			this.doRequest(xml);
			
		}catch(Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}
	}
	
	public SOAPMessage getResponse() {
		return response;
	}

	public String getWsdl() {
		return wsdl;
	}

	public void setWsdl(String wsdl) {
		this.wsdl = wsdl;
	}

	public Map<String, String> getHeaders() {
		return headers;
	}

	public void setHeaders(Map<String, String> headers) {
		this.headers = headers;
	}
	
	public List<String> getErrors(){
		return errors;
	}
	
	public boolean hasErrors() {
		return !errors.isEmpty();
	}
}
