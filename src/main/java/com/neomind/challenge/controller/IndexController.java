package com.neomind.challenge.controller;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.neomind.challenge.entity.Supplier;
import com.neomind.challenge.services.SupplierInterface;
import com.neomind.challenge.services.SupplierService;

@Path("/")
public class IndexController {

	private SupplierInterface supplierInterface = new SupplierService();
	
	@GET	
	@Path("/findAll")
	@Produces(MediaType.APPLICATION_JSON)
	public List<Supplier> findAll(){
		return this.supplierInterface.findAll();
	}
	
	@GET
	@Path("/find")
	@Produces(MediaType.APPLICATION_JSON)
	public Supplier find(@QueryParam("id") Long id){
		return this.supplierInterface.findById(id);
	}

	@POST
	@Path("/save")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Supplier save(Supplier entity) {
		return this.supplierInterface.save(entity);
	}
	
	@POST
	@Path("/remove")
	@Consumes(MediaType.APPLICATION_JSON)
	public void remove(Supplier entity) {
		this.supplierInterface.delete(this.find(entity.getId()));
	}
}