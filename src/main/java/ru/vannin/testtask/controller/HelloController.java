package ru.vannin.testtask.controller;

import org.springframework.web.bind.annotation.*;

@RestController
public class HelloController {
    @GetMapping ( "/" )
    public String hello() {
        return "Hello, world!";
    }
}
