package com.scottmarden.loginandreg.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.scottmarden.loginandreg.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	User findByUsername(String username);
}
