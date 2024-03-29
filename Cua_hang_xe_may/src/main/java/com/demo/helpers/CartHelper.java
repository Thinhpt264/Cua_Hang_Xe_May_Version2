package com.demo.helpers;

import java.util.Iterator;
import java.util.List;

import com.demo.entities.Item;

public class CartHelper {
	public static int exist(List<Item> cart, int productColorId) {
		for (int i = 0; i < cart.size(); i++) {
			if(cart.get(i).getProductcolor().getId() == productColorId) {
				return i;
			}	
		}
		return -1;
	}
}
