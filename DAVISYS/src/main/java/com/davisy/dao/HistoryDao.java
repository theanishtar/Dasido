package com.davisy.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.davisy.entity.History;

public interface HistoryDao extends JpaRepository<History, Integer>{

}
