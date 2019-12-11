package com.neomind.challenge.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "SUPPLIER")
public class Supplier extends NeoEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Column(name = "NAME", nullable = false)
	private String name;
	
	@Column(name = "EMAIL", nullable = false)
	private String email;
	
	@Column(name = "COMMENT", nullable = true)
	private String comment;
	
	@Column(name = "FEDERAL_CODE", nullable = false)
	private String federalCode;

	public Supplier(String name, String email, String comment, String federalCode) {
		super();
		
		this.name = name;
		this.email = email;
		this.comment = comment;
		this.federalCode = federalCode;
	}

	public Supplier(Supplier entity) {
		super();
		
		super.setId(entity.getId());
		this.name = entity.getName();
		this.email = entity.getEmail();
		this.comment = entity.getComment();
		this.federalCode = entity.getFederalCode();
	}
	
	public Supplier() {
		super();
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
