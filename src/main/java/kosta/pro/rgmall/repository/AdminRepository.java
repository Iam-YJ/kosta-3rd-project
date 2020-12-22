package kosta.pro.rgmall.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.pro.rgmall.domain.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long> {

}// class
