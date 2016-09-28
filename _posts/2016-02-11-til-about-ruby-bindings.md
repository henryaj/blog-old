---
title: TIL about Ruby bindings
date: 2016/02/11 18:31:54
layout: post
---
# TIL about Ruby bindings

_(I'm writing more about programming things I've learned.)_ In Ruby, the `pry` gem lets you call `binding.pry` in your code, so that when it runs, you get dropped into a breakpoint. From there, you can play around with variables and methods, just like you would in a REPL. Today I learned what `binding` actually is -- it's an object containing the current execution context at the point it's called. Effectively, it's a snapshot of the state of your program. And now, courtesy of [@harxy](http://twitter.com/harxy): 

> Why was the meek programmer bad at debugging? Because he didn't like to pry!
