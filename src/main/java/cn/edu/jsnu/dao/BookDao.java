package cn.edu.jsnu.dao;

import cn.edu.jsnu.domain.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
    int findBookRows(@Param("keyword") String keyword);
    int delBookById(@Param("bookId") int id);
    Book findBookById(@Param("id") int id);
    int updateBookById(@Param("bk") Book bk);
    int addBook(@Param("bk") Book book);
    List<Book> findBookList(@Param("begin") int begin, @Param("pageSize") int pageSize, @Param("keyword") String keyword);
}
