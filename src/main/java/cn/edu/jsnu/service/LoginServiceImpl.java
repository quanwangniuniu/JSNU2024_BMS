package cn.edu.jsnu.service;

import cn.edu.jsnu.dao.LoginDao;
import cn.edu.jsnu.domain.Book;
import cn.edu.jsnu.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LoginServiceImpl implements LoginService {
    @Resource
    private LoginDao dao;
    @Override
    public User findUserByNameAndPwd(String userName, String password) {
        return dao.findUserByNameAndPwd(userName,password);
    }

}
