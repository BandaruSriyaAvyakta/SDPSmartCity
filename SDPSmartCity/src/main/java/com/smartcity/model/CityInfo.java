package com.smartcity.model;

public class CityInfo {
    private int id;
    private String cityName;
    private String state;
    private String country;
    private int population;
    private String cityReports;
    private double area;
    private String infrastructureStatus;
    private String description;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public String getCityReports() {
        return cityReports;
    }

    public void setCityReports(String cityReports) {
        this.cityReports = cityReports;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getInfrastructureStatus() {
        return infrastructureStatus;
    }

    public void setInfrastructureStatus(String infrastructureStatus) {
        this.infrastructureStatus = infrastructureStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
