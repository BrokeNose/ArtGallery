package com.main.artgallery.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AuctionController {
	@RequestMapping("/auction/house")
	public void AuctionHouse(HttpServletRequest request) {
	}
}
