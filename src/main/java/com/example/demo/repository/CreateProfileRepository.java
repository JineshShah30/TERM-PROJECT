package com.example.demo.repository;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Profile;

@Repository
public interface CreateProfileRepository extends  CrudRepository<Profile ,Integer> {
	
}
