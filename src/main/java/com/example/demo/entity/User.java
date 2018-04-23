package com.example.demo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class User {

	@Id
	private String userid;
	private String name;
	private String description;
	private String imgurl;
	
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="user",cascade = CascadeType.ALL)
	private List<UserFriends> friendList;
	
	
	public User() {
		// TODO Auto-generated constructor stub
		super();
	}
	
	public User(String userid, String name, String description, String imgurl, List<UserFriends> friendList) {
		super();
		this.userid = userid;
		this.name = name;
		this.description = description;
		this.imgurl = imgurl;
		this.friendList = friendList;
	}

	public List<UserFriends> getFriendList() {
		return friendList;
	}
	
	public void setFriendList(List<UserFriends> friendList) {
		this.friendList = friendList;
	}
	
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userid + ", userName=" + name + ", profilePhoto="
				+ imgurl + ", description=" + description + "]";
	}
}
