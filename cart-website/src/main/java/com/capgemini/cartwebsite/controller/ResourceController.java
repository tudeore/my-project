package com.capgemini.cartwebsite.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.capgemini.cartwebsite.entity.Address;
import com.capgemini.cartwebsite.entity.Cart;
import com.capgemini.cartwebsite.entity.FoodProducts;

@Controller
@RequestMapping("/cart")
public class ResourceController {

	@Autowired
	private RestTemplate restTemplate;
	
	@RequestMapping("/getAll")
	public String getAllCarts(Model model) {
		System.out.println("getAll");
		ResponseEntity<List> carts =  restTemplate.getForEntity("http://localHost:8080/carts", List.class);
		System.out.println(carts);
		model.addAttribute("carts",carts.getBody());
		return "GetAll";
	}
	
	
	@RequestMapping("/addCart")
	public String addCart(@RequestParam String restaurantName,@RequestParam Address address,@RequestParam String foodName,
							@RequestParam double price,@RequestParam int quantity,Model model) {
		Set<FoodProducts> products =new HashSet<FoodProducts>();
		products.add(new FoodProducts(foodName,price, quantity));
		
		Cart cart = new Cart(106, restaurantName, products, 100, address);
	 restTemplate.postForEntity("http://localHost:8080/carts", cart, Cart.class);	
	 model.addAttribute("cart",cart);
		return"GetAll";
	}
	
}
