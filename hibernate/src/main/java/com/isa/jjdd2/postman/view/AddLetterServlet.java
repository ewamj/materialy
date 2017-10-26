package com.isa.jjdd2.postman.view;

import com.isa.jjdd2.postman.model.Letter;
import com.isa.jjdd2.postman.service.PostmanManager;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@WebServlet("/addLetter")
public class AddLetterServlet extends HttpServlet {

    @Inject
    PostmanManager postmanManager;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Optional<Letter> letter = postmanManager.addLetterIfPossible(request.getParameter("sender"), request.getParameter("receiver"), request.getParameter("envelopSize"));
        if(letter.isPresent()) {
            HttpSession session = request.getSession();
            Set<Letter> postBag = (Set<Letter>) session.getAttribute(PostBagServlet.POST_BAG_ATTRIBUTE);
            if(postBag == null) {
                postBag = new HashSet<>();
            }
            postBag.add(letter.get());
            session.setAttribute(PostBagServlet.POST_BAG_ATTRIBUTE, postBag);
        }
        response.sendRedirect("");
    }
}
