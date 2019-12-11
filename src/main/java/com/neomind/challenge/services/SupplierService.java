package com.neomind.challenge.services;

import java.util.List;

import com.neomind.challenge.entity.Supplier;

public class SupplierService extends NeoService<Supplier> implements SupplierInterface {

	public Supplier findById(Long id) {
		return super.find(id);
	}
	
	public List<Supplier> findAll() {
		return this.findAllByQuery(String.format("SELECT i FROM %s i", Supplier.class.getName()));
	}
	
	@Override
	public Supplier save(Supplier entity) {
		return super.save(entity);
	}
	
	@Override
	public void delete(Supplier entity) {
		super.delete(entity);
	}
}
