package com.app;

import org.springframework.web.bind.annotation.*;

@RestController
public class DemoController {

    @GetMapping("/api/hello")
    public String hello() {
        return "Hello from Java Backend";
    }
}
