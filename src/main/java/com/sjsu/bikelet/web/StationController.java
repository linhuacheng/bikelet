package com.sjsu.bikelet.web;

import com.sjsu.bikelet.domain.Station;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/stations")
@Controller
@RooWebScaffold(path = "stations", formBackingObject = Station.class)
public class StationController {
}
