package com.neomind.challenge.model;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import com.neomind.challenge.entity.Supplier;

@XmlRootElement
public class SupplierModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String name;
	
	private String email;
	
	private String comment;
	
	private String federalCode;

	public SupplierModel(Supplier supplier) {
		super();
		
		this.id = supplier.getId();
		this.name = supplier.getName();
		this.email = supplier.getEmail();
		this.comment = supplier.getComment();
		this.federalCode = supplier.getFederalCode();
	}

	public SupplierModel() {
		super();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getFederalCode() {
		return federalCode;
	}

	public void setFederalCode(String federalCode) {
		this.federalCode = federalCode;
	}
}
