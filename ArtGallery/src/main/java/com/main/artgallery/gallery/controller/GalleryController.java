package com.main.artgallery.gallery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.main.artgallery.gallery.service.GalleryService;

@Controller
public class GalleryController {
	@Autowired
	private GalleryService galleryService;
	
	
	
}
