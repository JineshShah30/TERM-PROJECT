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
	

	@OneToMany(cascade= CascadeType.ALL)
	@JoinColumn(name="userid")
	public List<Post> post;
	
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name="userid")
	private List<Friends> friends;


	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userid, String name, String description, String imgurl, List<Post> post, List<Friends> friends) {
		super();
		this.userid = userid;
		this.name = name;
		this.description = description;
		this.imgurl = imgurl;
		this.post = post;
		this.friends = friends;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
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
	
	public List<Friends> getFriends() {
		return friends;
	}

	public void setFriends(List<Friends> friends) {
		this.friends = friends;
	}

	@Override
	public String toString() {
		return "User [userId=" + userid + ", userName=" + name + ", profilePhoto="
				+ imgurl + ", description=" + description + "]";
	}
}