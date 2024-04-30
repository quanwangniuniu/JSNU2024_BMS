package cn.edu.jsnu.dao;

import cn.edu.jsnu.domain.User;
import org.apache.ibatis.annotations.Param;

public interface LoginDao {
    User findUserByNameAndPwd(@Param("userName") String userName, @Param("password") String password);
}

