---
title: 'The Twelve-Second Code Year [part 4]'
date: '2014/11/05 13:32:21'
layout: post
published: true
---

_(I'm taking an [intensive web development bootcamp](http://makersacademy.com). [Part 1](http://henrystanley.com/2014/08/25/the-twelve-second-code-year-part-1/), [part 2](http://henrystanley.com/2014/09/07/the-twelve-second-code-year-part-2/) and [part 3](http://henrystanley.com/2014/09/29/the-twelve-second-code-year-part-3/) of the story. Names of students have been changed.)_

## 10.

It's over.

> These students have what it takes to be developers. It's not about knowing a language, it's about knowing how to solve a problem; how to bring simplicity into the world. — Enrique Comba Riepenhausen

## 11.

Makers has been a lot of fun. Twelve weeks of intensive work, learning a new skill, totally retraining, having only moments earlier thrown away a half-decent career. Other people have come from similar backgrounds to do the course: one worked in strategic consulting, and had a similar gradual realisation to me that his field was slowly sucking the life out of him. I think everyone, with a single exception, got a lot out of the course. Not everyone is at the same place – those who had done more preparation when they started are further ahead than those who did less. But I think in terms of what's been achieved and learnt in twelve weeks, everyone is amazed at their own progress. (I should note that Makers recently updated their website to describe the course as being sixteen weeks: twelve weeks taught plus four weeks of full-time self-study beforehand. I suspect this is partly to get much of the boring material out of the way before students join, and partly to ensure everyone's at the same level when they start.)

## 12.

Our final project was an internet-connected thermal printer that could read an RFID card (like an Oyster card), identify you from a database and print out a custom chit – with, say, your calendar events for the day, your current GitHub stats, or (if it's getting late) any Tube delays and the weather for the next hour. The plan is that the device stays at Makers and using becomes part of the daily routine there. It's based on [Spark Core](http://spark.io), so we call it [Spark Printer](http://github.com/henryaj/Maker-Spark-Server). It's pretty neat. Engineering it was the biggest challenge I've faced so far. Specifically, working my way through the Spark documentation and figuring out how we were going to make this work – what functionality the Texas Instruments chip on the Core has, how it talks to their cloud server, the limits in size and number of API requests, using `Spark.publish` to listen to events from the Spark – all the technical stuff that makes the internet hard and is usually abstracted away for you. But most final projects are pretty bog-standard Rails web applications. It was incredibly rewarding to go against the grain and build something different. We made a real product that lives in the physical world, and learnt a bunch of new technologies in the process. While we were building this, the excellent [Chris Waclawek](https://twitter.com/chriswaclawek) from Estimote came in to talk about iBeacons and the Estimote product line. The audience was wowed – the more he spoke, the more use cases people dreamed up for these magical little devices that give your phone context and tell it what's nearby. It was the kind of magic that the early iPhone had: none of the components were particularly innovative, but they were put together in such a way that opened up millions of possibilities that Apple had never thought of and that developers were free to implement.

## 13.

Whether working in tech will be the dream we hoped for has yet to be seen, but the signs are there. It has a vibrant community, it's full of smart and engaged people, there's a tremendous focus on continuous learning and understanding new technologies. It's a huge world – some people work for giant corporates, some for small web shops, some for themselves, others remotely in far-flung countries. It's meritocratic in a way that I don't think exists elsewhere any more. Now, we polish our [GitHub profiles](http://github.com/henryaj/cv), ensure our code repos are well-documented, and wait to be placed. I'm excited to get started.
