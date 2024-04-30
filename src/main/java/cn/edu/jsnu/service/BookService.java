package cn.edu.jsnu.service;

import cn.edu.jsnu.domain.Book;

import java.util.List;

public interface BookService {
    int findBookRows(String keyword);
    List<Book> findBookList(int begin, int pageSize, String keyword);

    int delBookById(int id);

    Book findBookById(int id);

    int updateBookById(Book bk);

    int addBook(Book book);
}
