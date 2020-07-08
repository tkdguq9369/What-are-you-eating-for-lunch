package com.lunch.eating_for_lunch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LunchController {

	@RequestMapping("/lunchMap")
	public String lunchMap() {
		return "com/map/lunchMap";
	}
}
