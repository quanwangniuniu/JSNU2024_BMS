package cn.edu.jsnu.controller;

import cn.edu.jsnu.domain.Book;
import cn.edu.jsnu.service.BookService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {
    @Resource
    private BookService service;
    @RequestMapping("/getBookList.do")
    public void getBookList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String json = request.getReader().readLine();
        Map<String, Object> maps = JSON.parseObject(json);
        int currPage = Integer.parseInt(maps.get("currPage").toString());
        int pageSize = Integer.parseInt(maps.get("pageSize").toString());
        String keyword = maps.get("keyword").toString();
        int  total = service.findBookRows(keyword);

        int begin = (currPage - 1) * pageSize;

        List<Book> booklist = service.findBookList(begin, pageSize, keyword);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("total", total);
        jsonObj.put("list", booklist);
        jsonObj.put("currPage", currPage);
        jsonObj.put("pageSize", pageSize);

        JSONObject jsons = new JSONObject();
        jsons.put("data", jsonObj);

        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(jsons));
        out.flush();
        out.close();
    }

    @RequestMapping("delBook.do")
    public void delBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int success = service.delBookById(id);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("code", success > 0 ? 200 : 0);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(jsonObj));
        out.flush();
        out.close();
    }

    @RequestMapping("/getBookUpdate.do")
    public ModelAndView getBookUpdate(int id) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("id", id);
        mv.setViewName("book/book-update");
        return mv;
    }

    @RequestMapping("/getBookDetail.do")
    public void getBookDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book bk = service.findBookById(id);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("data", bk);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(jsonObj));

        out.flush();
        out.close();
    }

    @RequestMapping("updateBook.do")
    public void updateBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        String json = request.getReader().readLine();
        Map<String, Object> maps = JSONObject.parseObject(json);
        Book bk = new Book();
        bk.setId(Integer.parseInt(maps.get("id").toString()));
        bk.setIsbn(maps.get("isbn").toString());
        bk.setName(maps.get("name").toString());
        bk.setAuthor(maps.get("author").toString());
        bk.setPages(Integer.parseInt(maps.get("pages").toString()));
        bk.setTranslate(maps.get("translate").toString());
        bk.setPublish(maps.get("publish").toString());
        bk.setPrice(Double.parseDouble(maps.get("price").toString()));
        bk.setSize(Integer.parseInt(maps.get("size").toString()));
        bk.setType(maps.get("type").toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        bk.setPublish_time(sdf.parse(maps.get("publishTime").toString()));

        int success = service.updateBookById(bk);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("code", 200);
        jsonObj.put("data", success > 0 ? true : false);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(jsonObj));

        out.flush();
        out.close();
    }

    @RequestMapping("/addBook.do")
    public void addBook(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        String json = request.getReader().readLine();
        Map<String, Object> maps = JSONObject.parseObject(json);
        Book bk = new Book();

        bk.setIsbn(maps.get("isbn").toString());
        bk.setName(maps.get("name").toString());
        bk.setAuthor(maps.get("author").toString());
        bk.setPages(Integer.parseInt(maps.get("pages").toString()));
        bk.setTranslate(maps.get("translate").toString());
        bk.setPublish(maps.get("publish").toString());
        bk.setPrice(Double.parseDouble(maps.get("price").toString()));
        bk.setSize(Integer.parseInt(maps.get("size").toString()));
        bk.setType(maps.get("type").toString());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        bk.setPublish_time(sdf.parse(maps.get("publishTime").toString()));

        int success = service.addBook(bk);
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("code", 200);
        jsonObj.put("data", success > 0 ? true : false);
        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.write(String.valueOf(jsonObj));

        out.flush();
        out.close();
    }
}
