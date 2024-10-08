package com.smartcity.service;

import com.smartcity.model.CityInfo;

import java.util.ArrayList;
import java.util.List;

public class CityInfoService {

    // Mock database for demonstration purposes
    private List<CityInfo> cityDatabase = new ArrayList<>();

    // Constructor to populate some data (this should be replaced with actual DB access)
    public CityInfoService() {
        CityInfo city1 = new CityInfo();
        city1.setId(1);
        city1.setCityName("City A");
        city1.setState("State A");
        city1.setCountry("Country A");
        city1.setPopulation(100000);
        city1.setCityReports("Report A");
        city1.setArea(150.5);
        city1.setInfrastructureStatus("Good");
        city1.setDescription("Description of City A");
        
        CityInfo city2 = new CityInfo();
        city2.setId(2);
        city2.setCityName("City B");
        city2.setState("State B");
        city2.setCountry("Country B");
        city2.setPopulation(200000);
        city2.setCityReports("Report B");
        city2.setArea(250.75);
        city2.setInfrastructureStatus("Average");
        city2.setDescription("Description of City B");

        cityDatabase.add(city1);
        cityDatabase.add(city2);
    }

    // Method to get all cities
    public List<CityInfo> getAllCities() {
        return cityDatabase;
    }

    // Method to add a new city
    public void addCity(CityInfo cityInfo) {
        cityInfo.setId(cityDatabase.size() + 1); // Auto-increment id for mock database
        cityDatabase.add(cityInfo);
    }

    // Method to get a city by ID
    public CityInfo getCityById(int id) {
        return cityDatabase.stream()
                .filter(city -> city.getId() == id)
                .findFirst()
                .orElse(null);
    }

    // Method to update a city
    public void updateCity(CityInfo cityInfo) {
        CityInfo existingCity = getCityById(cityInfo.getId());
        if (existingCity != null) {
            existingCity.setCityName(cityInfo.getCityName());
            existingCity.setState(cityInfo.getState());
            existingCity.setCountry(cityInfo.getCountry());
            existingCity.setPopulation(cityInfo.getPopulation());
            existingCity.setCityReports(cityInfo.getCityReports());
            existingCity.setArea(cityInfo.getArea());
            existingCity.setInfrastructureStatus(cityInfo.getInfrastructureStatus());
            existingCity.setDescription(cityInfo.getDescription());
        }
    }

    // Method to delete a city
    public void deleteCity(int id) {
        cityDatabase.removeIf(city -> city.getId() == id);
    }
}
