/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.RouteEntity;
import com.mycompany.spring_mvc_project_final.service.RouteService;
import com.mycompany.spring_mvc_project_final.utils.SecurityUtils;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {

    @Autowired
    private RouteService routeService;

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String welcomePage(Model model, HttpSession session) {
        model.addAttribute("listDeparture", routeService.listDeparture());
        session.setAttribute("listDeparture", routeService.listDeparture());
        
//        List<String> roles = SecurityUtils.getRolesOfUser();
//        if (!CollectionUtils.isEmpty(roles) && (roles.contains("ROLE_ADMIN")
//                || roles.contains("ROLE_SELLER") || roles.contains("ROLE_MANAGER"))) {
//            return "redirect:/admin/home";
//        }
        return "index";
    }

    @RequestMapping("/login")
    public String loginPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login Fail!!!");
        }
        return "login";
    }

    @RequestMapping("/403")
    public String accessDenied(Model model) {
        return "403Page";
    }

    @RequestMapping(value = "/select-dest", method = RequestMethod.POST)
    @ResponseBody
    public String chooseSize(
            @RequestParam("dept") int deptId) {

        List<RouteEntity> destinations = routeService.listDestination(deptId);

        String ajaxResponse = "";
        for (RouteEntity d : destinations) {
            ajaxResponse += "<option value = " + d.getDestination().getId() + ">" + d.getDestination().getDescription() + "</option>";
        }

        return ajaxResponse;
    }
}
