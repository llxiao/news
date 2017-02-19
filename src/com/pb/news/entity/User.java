package com.pb.news.entity;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import com.pb.news.util.Constants;

/**
 * Application Lifecycle Listener implementation class User
 *
 */
@WebListener
public class User implements HttpSessionBindingListener {

    private int id;
    private String userName;
    private String password;
    private String email;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/**
     * @see HttpSessionBindingListener#valueUnbound(HttpSessionBindingEvent)
     */
    public void valueUnbound(HttpSessionBindingEvent event) {
        // TODO Auto-generated method stub
    	////从session中删除时自动调用
    	Constants.ONLINE_USER_COUNT --;
    	System.out.println("valueUnbound 人数-1 -------> "+Constants.ONLINE_USER_COUNT);
    }

	/**
     * @see HttpSessionBindingListener#valueBound(HttpSessionBindingEvent)
     */
    public void valueBound(HttpSessionBindingEvent event) {
        // TODO Auto-generated method stub
    	////从session中创建时自动调用
    	Constants.ONLINE_USER_COUNT ++;
    	System.out.println("valueBound 人数+1 -------> "+Constants.ONLINE_USER_COUNT);
    }
	
}
