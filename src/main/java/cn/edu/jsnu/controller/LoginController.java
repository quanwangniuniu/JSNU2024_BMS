package cn.edu.jsnu.controller;

import cn.edu.jsnu.domain.User;
import cn.edu.jsnu.service.LoginServiceImpl;
import cn.edu.jsnu.util.ImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Resource
    private LoginServiceImpl service;

    @RequestMapping("/toLogin.do")
    public ModelAndView toLogin(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("login");
        return mv;
    }
    @RequestMapping("/checkCode.do")
    public void checkCode(HttpServletRequest request,
                            HttpServletResponse response) throws IOException {

        Map<String, BufferedImage> imageMap=
                ImageUtil.createImage();

        String code=imageMap.keySet().iterator().next();

        request.getSession().setAttribute(
                "imgCode",code);

        BufferedImage image=imageMap.get(code);

        response.setContentType("image/jpeg");
        OutputStream ops=response.getOutputStream();

        ImageIO.write(image,"jpeg",ops);

        ops.close();





    }

    @RequestMapping("/login.do")
    @ResponseBody
    public String login(String username, String password, String checkCode, HttpSession session){
        if (username.equals("") || password.equals("") || checkCode.equals("")) {
            return "fail";
        }
        String imgCode=(String)session.getAttribute("imgCode");
        if(!imgCode.equalsIgnoreCase(checkCode) || imgCode == null) {
            return "fail";
        }

        User user = service.findUserByNameAndPwd(username, password);

        if (user == null) {
            return "fail";
        }

        session.setAttribute("loginUser", user);

        return "success";
    }

    @RequestMapping("/toIndex.do")
    public ModelAndView toIndex(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("index");
        return mv;
    }


}
