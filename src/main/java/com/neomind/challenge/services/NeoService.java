package com.neomind.challenge.services;

import java.lang.reflect.ParameterizedType;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.neomind.challenge.entity.NeoEntity;

public class NeoService<T extends NeoEntity> {

	private EntityManagerFactory factory = Persistence.createEntityManagerFactory("neomind-challenge");
	private EntityManager em = this.factory.createEntityManager();
	
	protected T find(Long id) {
		return this.getEntityManager().find(this.getEntityClass(), id);
	}
	
	protected T findByQuery(String query) {
		return this.findByQuery(query, null);
	}
	
	@SuppressWarnings("unchecked")
	protected T findByQuery(String query, Map<String, Object> params) {
		Query q = this.getEntityManager().createQuery(query);
		q = this.buildParams(q, params);
		
		T object = (T) q.getSingleResult();
		
		return object;
	}
	
	protected List<T> findAllByQuery(String query) {
		return this.findAllByQuery(query, null);
	}
	
	@SuppressWarnings("unchecked")
	protected List<T> findAllByQuery(String query, Map<String, Object> params) {
		Query q = this.getEntityManager().createQuery(query);
		q = this.buildParams(q, params);
		
		List<T> object = (List<T>) q.getResultList();
		
		return object;
	}
	
	protected T save(T object) {
		this.getEntityManager().getTransaction().begin();
		object = this.getEntityManager().merge(object);
		this.getEntityManager().persist(object);
		this.getEntityManager().getTransaction().commit();
		
		return object;
	}
	
	protected void delete(T object) {
		this.getEntityManager().getTransaction().begin();
		object = this.getEntityManager().merge(object);
		this.getEntityManager().remove(object);
		this.getEntityManager().getTransaction().commit();
	}
	
	private Query buildParams(Query query, Map<String, Object> params) {
		if (params != null) {
			Iterator<Entry<String, Object>> iterator = params.entrySet().iterator();
			while (iterator.hasNext()) {
				Entry<String, Object> pair = iterator.next();
				query.setParameter(pair.getKey(), pair.getValue());
			}
		}
		
		return query;
	}
	
	protected EntityManager getEntityManager() {
		return this.em;
	}
	
	@SuppressWarnings("unchecked")
	protected Class<T> getEntityClass() {
		Class<T> clazz = null;
		
		if ((this.getClass().getGenericSuperclass() != null)) {
			Class<?> auxClazz = this.getClass();
			
			while (auxClazz != null && !(auxClazz.getSuperclass() == NeoService.class)) {
				auxClazz = auxClazz.getSuperclass();
			}
			
			if (auxClazz.getGenericSuperclass() instanceof ParameterizedType) {
				ParameterizedType type = (ParameterizedType) auxClazz.getGenericSuperclass();
				
				if ((type.getActualTypeArguments() != null) && (type.getActualTypeArguments().length > 0)) {
					try {
						clazz = ((Class<T>) type.getActualTypeArguments()[0]);
					} catch (ClassCastException e) {
						Class<?> auxClazzTry = this.getClass();
						while (auxClazzTry != null && !(auxClazzTry.getSuperclass() == auxClazz)) {
							auxClazzTry = auxClazzTry.getSuperclass();
						}
						type = (ParameterizedType) auxClazzTry.getGenericSuperclass();
						clazz = ((Class<T>) type.getActualTypeArguments()[0]);
					}
				}
			}
		}
		
		if (clazz == null) {
			throw new RuntimeException("Could not find entity class.");
		}
		
		return clazz;
	}
}
