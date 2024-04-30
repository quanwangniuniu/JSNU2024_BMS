package cn.edu.jsnu.service;

import cn.edu.jsnu.dao.BookDao;
import cn.edu.jsnu.domain.Book;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class BookServiceImpl implements BookService{
    @Resource
    private BookDao dao;

    @Override
    public int findBookRows(String keyword) {
        return dao.findBookRows(keyword);
    }

    @Override
    public List<Book> findBookList(int begin, int pageSize, String keyword) {
        return dao.findBookList(begin, pageSize, keyword);
    }

    @Override
    public int delBookById(int id) {
        return dao.delBookById(id);
    }

    @Override
    public Book findBookById(int id) {
        return dao.findBookById(id);
    }

    @Override
    public int updateBookById(Book bk) {
        return dao.updateBookById(bk);
    }

    @Override
    public int addBook(Book book) {
        return dao.addBook(book);
    }
}
