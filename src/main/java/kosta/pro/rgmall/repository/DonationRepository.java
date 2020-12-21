package kosta.pro.rgmall.repository;




import org.springframework.data.jpa.repository.JpaRepository;

import kosta.pro.rgmall.domain.Donation;

public interface DonationRepository extends JpaRepository<Donation, Long> {
	
	Donation findByUserListUserNo(Long userNo);


}//class
