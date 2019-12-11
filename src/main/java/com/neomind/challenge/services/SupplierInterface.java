package com.neomind.challenge.services;

import java.util.List;

import com.neomind.challenge.entity.Supplier;

public interface SupplierInterface {

	public Supplier findById(Long id);
	
	public List<Supplier> findAll();
	
	public Supplier save(Supplier entity);
	
	public void delete(Supplier entity);
}
