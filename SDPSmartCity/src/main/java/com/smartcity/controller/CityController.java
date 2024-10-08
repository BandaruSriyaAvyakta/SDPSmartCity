package com.smartcity.controller;

import com.smartcity.service.CityService;
import com.smartcity.model.City;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/addCity")
public class CityController extends HttpServlet {
    @Inject
    private CityService cityService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        City city = new City();
        city.setName(name);
        city.setDescription(description);

        cityService.addCity(city);

        resp.sendRedirect("index.jsp");
    }
}
