package cn.edu.jsnu.service;

import cn.edu.jsnu.domain.User;

public interface LoginService {
    User findUserByNameAndPwd(String userName, String password);
}
