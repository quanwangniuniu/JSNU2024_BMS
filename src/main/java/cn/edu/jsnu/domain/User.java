package cn.edu.jsnu.domain;
import java.sql.Date;
public class User {
    private Integer id;
    private String address;
    private String avatar;
    private Date birthday;
    private  String email;
    private Integer identity;
    private Integer isadmin;
    private String nickname;
    private String password;
    private Integer size;
    private String username;
    private String tel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }

    public Integer getIsadmin() {
        return isadmin;
    }

    public void setIsadmin(Integer isadmin) {
        this.isadmin = isadmin;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", avatar='" + avatar + '\'' +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                ", identity=" + identity +
                ", isadmin=" + isadmin +
                ", nickname='" + nickname + '\'' +
                ", password='" + password + '\'' +
                ", size=" + size +
                ", username='" + username + '\'' +
                ", tel='" + tel + '\'' +
                '}';
    }
}
