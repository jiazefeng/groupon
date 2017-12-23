package com.tortuousroad.admin.security.controller;

import com.tortuousroad.admin.base.controller.BaseAdminController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * RegisterController
 */
@Controller
public class RegisterController extends BaseAdminController {

    private final static Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @RequestMapping(value = "/register", method = {RequestMethod.POST, RequestMethod.GET})
    public String register(Model model, HttpServletRequest request) {
        return "/security/register";
    }
}
