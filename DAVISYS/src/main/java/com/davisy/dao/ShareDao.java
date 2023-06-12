package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.davisy.entity.Share;

public interface ShareDao extends JpaRepository<Share, Integer> {

}
