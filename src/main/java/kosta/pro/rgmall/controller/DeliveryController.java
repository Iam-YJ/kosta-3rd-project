package kosta.pro.rgmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.pro.rgmall.domain.Orders;
import kosta.pro.rgmall.domain.UserList;
import kosta.pro.rgmall.service.DeliveryService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/delivery")
@RequiredArgsConstructor
public class DeliveryController {
	
	private final DeliveryService deliveryService;
	
	@RequestMapping("/listDelivery")
	public ModelAndView selectAllDelivery() {
		List<Orders> orderList = deliveryService.selectAllDelivery();
		return new ModelAndView("/delivery/deliveryList", "orderList", orderList);
	}
	
	@RequestMapping("/{orderNo}")
	public String updateListDelivery(@PathVariable Long orderNo) {
		deliveryService.updateDeliveryState(orderNo);
		return "redirect:/delivery/listDelivery";
	}
}//class
