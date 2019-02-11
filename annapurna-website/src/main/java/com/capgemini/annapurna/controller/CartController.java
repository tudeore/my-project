package com.capgemini.annapurna.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.capgemini.annapurna.restaurant.entity.Address;
import com.capgemini.annapurna.restaurant.entity.Cart;
import com.capgemini.annapurna.restaurant.entity.FoodProducts;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping("/getAll")
	public String getAllCarts(Model model) {
		System.out.println("getAll");
		ResponseEntity<List> carts = restTemplate.getForEntity("http://localHost:8080/carts", List.class);
		model.addAttribute("carts", carts.getBody());
		return "GetAllCart";
	}

	/*
	 * @RequestMapping("/addCart") public String addCart(@RequestParam String
	 * restaurantName) { System.out.println("restaurantName " + restaurantName);
	 * return "GetAllCart"; }
	 */

	@RequestMapping("/addCart")
	public String addCart(@RequestParam String restaurantName, @RequestParam String foodName,
			@RequestParam double price, @RequestParam int quantity, Model model) {
		Set<FoodProducts> products = new HashSet<FoodProducts>();
		products.add(new FoodProducts("Biryani", 100, 2));
		Address address = new Address("Deopur", "Dhule", "Maharashtra", "India", 424002);

		Cart cart = new Cart(104, "Hotel India", products, address);
//				(104, "Hotel India", "Biryani", address);
		restTemplate.postForEntity("http://localHost:8080/carts", cart, Cart.class);
		model.addAttribute("cart", cart);
		return "GetAllCart";
	}
	
	@RequestMapping("/getCartById")
	public String getCartById(@RequestParam("cartId")Integer cartId,Model model){
		ResponseEntity<Cart> entity = restTemplate.getForEntity("http://localhost:8080/carts/"+cartId+"", Cart.class);
		System.out.println(entity.getBody());
		model.addAttribute("cart",entity.getBody());
		return "GetAllCart";		
	}
	
	@RequestMapping("/updateCart")
	public String updateCart(@ModelAttribute Cart cart,Model  model) {
		System.out.println("car  ="+cart);
	 restTemplate.put("http://localhost:8080/carts/"+cart.getCartId(), cart);
	 ResponseEntity<Cart> entity = restTemplate.getForEntity("http://localhost:8080/carts/"+cart.getCartId()+"", Cart.class);
		System.out.println(entity.getBody());
		model.addAttribute("cart",entity.getBody());
		return "GetAllCart";		
	}

	/*
	 * private Integer getUniqueId() { UUID idOne = UUID.randomUUID(); // String str
	 * = "" + idOne; int uid = idOne.hashCode(); // String filterStr = "" + uid; //
	 * str = filterStr.replaceAll("-", ""); return uid; Integer.parseInt(str) }
	 * 
	 * private static Set<FoodProducts> orderProducts;
	 */

	/*
	 * @RequestMapping("/getAll") public String getAllOrders(Model model) {
	 * ResponseEntity<List> list =
	 * restTemplate.getForEntity("http://localhost:9090/orders", List.class);
	 * System.out.println(list); model.addAttribute("message", "heyyyyyyyy !!!!");
	 * model.addAttribute("list", list.getBody()); return "GetAll"; }
	 */

	/*
	 * @RequestMapping("/getById") public String
	 * getOrderById(@RequestParam("orderId") Integer orderId, Model model) {
	 * ResponseEntity<Order> order =
	 * restTemplate.getForEntity("http://localhost:9090/orders/" + orderId + " ",
	 * Order.class); System.out.println(order.getBody());
	 * model.addAttribute("message", "heyyyyyyyy !!!!"); model.addAttribute("Order",
	 * order.getBody()); return "Order"; }
	 */

	/*
	 * @RequestMapping("/placeOrder") public String getPlaceOrder( @RequestBody Cart
	 * cart, Model model) { // Set<FoodProducts> products =cart.getProducts(); //
	 * Double totalAmount=cart.getTotalAmount(); // String
	 * restaurantName=cart.getRestaurantName(); Set<FoodProducts> products = new
	 * HashSet<FoodProducts>(); products.add(new FoodProducts("Brinjal", 234, 12));
	 * orderProducts = products; // model.addAttribute("products", products); return
	 * "AddressForm";
	 */

	/*
	 * Address address=new Address(65, "rosa villa", "Mumbai", 65423, "Maharashtra",
	 * "India"); Order order = new Order(156, "COD", "Delivered", products, 1000.00,
	 * 123, "grandmama", address, 543); ResponseEntity<Order>
	 * order1=restTemplate.postForEntity("http://localhost:9090/orders", order,
	 * Order.class); model.addAttribute("message", "heyyyyyyyy !!!!");
	 * model.addAttribute("Order",order1.getBody()); return "Order";
	 *
	}*/

	/*
	 * @RequestMapping("/submitAddress") public String placeOrder(@ModelAttribute
	 * Address address, Model model) { // PaymentGateway // Ewallet
	 * e-wallet=restTemplate.postForEntity(url, request, // responseType);//calling
	 * e-wallet API // String modeOfPayment=e-wallet.getBody().getMOdeOfPayment();
	 * String modeOfPayment = "COD"; // for now Double totalAmount = 100.0; // for
	 * now String restaurantName = "GrandMama's Cafe"; // for now Integer id =
	 * getUniqueId(); Order order = new Order(id, modeOfPayment, "pending",
	 * orderProducts, totalAmount, 123, restaurantName, address, 543);
	 * ResponseEntity<Order> order1 =
	 * restTemplate.postForEntity("http://localhost:9090/orders", order,
	 * Order.class); model.addAttribute("message", "heyyyyyyyy !!!!");
	 * model.addAttribute("Order", order1.getBody()); return "Order"; }
	 */
	/*
	 * @RequestMapping("/updateStatus") public String
	 * updateStatus(@RequestParam("orderId") Integer
	 * orderId, @RequestParam("status") String updatedStatus, Model model) {
	 * restTemplate.put("http://localhost:9090/orders/" + orderId + "?status=" +
	 * updatedStatus + "", null); ResponseEntity<Order> order =
	 * restTemplate.getForEntity("http://localhost:9090/orders/" + orderId + " ",
	 * Order.class); System.out.println(order.getBody());
	 * model.addAttribute("message", "heyyyyyyyy !!!!"); model.addAttribute("Order",
	 * order.getBody()); return "Order"; }
	 */

	/*
	 * @RequestMapping("/cancelOrder") public String
	 * cancelOrder(@RequestParam("orderId") Integer orderId, Model model) {
	 * restTemplate.delete("http://localhost:9090/orders/" + orderId + "");
	 * getAllOrders(model); return "GetAll";
	 * 
	 * }
	 */

}
