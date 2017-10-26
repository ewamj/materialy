package com.isa.jjdd2.postman.view;

import com.isa.jjdd2.postman.service.PostOffice;
import com.isa.jjdd2.postman.service.PostmanManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/index.jsp")
public class PostBagServlet extends HttpServlet {

    public static final String POST_BAG_ATTRIBUTE = "postBag";

    @Inject
    PostmanManager postmanManager;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("username", request.getParameter("username"));
        request.getSession().setAttribute(POST_BAG_ATTRIBUTE, postmanManager.preparePostBag());
        getServletContext().getRequestDispatcher("/postBag.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/postBag.jsp").forward(request, response);
    }
}
