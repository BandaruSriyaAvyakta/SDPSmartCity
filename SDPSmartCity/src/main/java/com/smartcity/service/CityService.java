package com.smartcity.service;


import com.smartcity.dao.CityDAO;
import com.smartcity.model.City;
import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.List;

@Stateless
public class CityService {
    @Inject
    private CityDAO cityDAO;

    public void addCity(City city) {
        cityDAO.save(city);
    }

    public City getCity(Long id) {
        return cityDAO.find(id);
    }

    public List<City> getAllCities() {
        return cityDAO.findAll();
    }
}
