package com.smartcity.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smartcity.model.CityInfo;
import com.smartcity.service.CityInfoService;

public class CityInfoServlet extends HttpServlet {

    private CityInfoService cityInfoService;

    public void init() throws ServletException {
        cityInfoService = new CityInfoService();  // Initialize service
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action == null) {
            List<CityInfo> cities = cityInfoService.getAllCities();
            request.setAttribute("cities", cities);
            RequestDispatcher dispatcher = request.getRequestDispatcher("managecities.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("edit")) {
            int cityId = Integer.parseInt(request.getParameter("id"));
            CityInfo city = cityInfoService.getCityById(cityId);
            request.setAttribute("city", city);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editcity.jsp");
            dispatcher.forward(request, response);
        } else if (action.equals("delete")) {
            int cityId = Integer.parseInt(request.getParameter("id"));
            cityInfoService.deleteCity(cityId);
            response.sendRedirect("CityInfoServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        String cityName = request.getParameter("cityName");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        int population = Integer.parseInt(request.getParameter("population"));
        String cityReports = request.getParameter("cityReports");
        double area = Double.parseDouble(request.getParameter("area"));
        String infrastructureStatus = request.getParameter("infrastructureStatus");
        String description = request.getParameter("description");

        CityInfo cityInfo = new CityInfo();
        cityInfo.setCityName(cityName);
        cityInfo.setState(state);
        cityInfo.setCountry(country);
        cityInfo.setPopulation(population);
        cityInfo.setCityReports(cityReports);
        cityInfo.setArea(area);
        cityInfo.setInfrastructureStatus(infrastructureStatus);
        cityInfo.setDescription(description);

        if (action.equals("add")) {
            cityInfoService.addCity(cityInfo);
        } else if (action.equals("update")) {
            int cityId = Integer.parseInt(request.getParameter("id"));
            cityInfo.setId(cityId);
            cityInfoService.updateCity(cityInfo);
        }

        response.sendRedirect("CityInfoServlet");
    }
}
