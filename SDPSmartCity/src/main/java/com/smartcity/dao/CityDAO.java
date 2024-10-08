package com.smartcity.dao;

import java.util.List;

import com.smartcity.model.City;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

public class CityDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Transactional
	public void save(City city)
	{
		 em.persist(city);
	}
	public City find(Long id) {
        return em.find(City.class, id);
    }
    public List<City> findAll() {
        return em.createQuery("SELECT c FROM City c", City.class).getResultList();
    }
}
