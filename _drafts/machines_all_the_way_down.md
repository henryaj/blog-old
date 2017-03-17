Think of a calculator. It's a physical machine, with buttons and a display. It does only one thing -- arithmetic.

Now think of the calculator app on your phone. It does everything a calculator does (it even has "buttons" and a "display" made out of pixels) and maybe even much more -- but it's running on *another* machine, your phone. Your computer runs applications in the same way.

Cloud computing is the same. A developer writes a web app, a calculator app, for example. She wants to run that app so that other people can use it, so she needs a server -- just a computer, but put in a rack besides other computers with a fast internet connection and cooling and people on hand to fix it. Thing is, those computers aren't very convenient to manage, especially if you're loading your app onto them by hand.

Instead, you run your app on a *platform*, like Amazon Web Services (AWS). You request a machine from AWS -- maybe a really fast one, so your visitors don't have to wait too long for their calculations to finish. Once you have it, you can connect to it and load your app onto it for other people to access.

But that machine is really a "machine" -- a VM, or virtual machine, that's actually not a real machine at all but is another program running on a physical machine. What's the point of this needless nesting? It means you don't need to care about the underlying physical machine. A team of people at Amazon deals with that, with network configuration, and power, and cooling, and you just get a little isolated slice of that physical machine, isolated from all the other people who are using it.

Better still, our developer could use a platform like Cloud Foundry to run her app. That way, she doesn't need to set up a server -- she just points to Cloud Foundry and sends her code to it. Cloud Foundry will take her app, package it up, and run it in a *container* on a virtual machine (which, remember, is really a program running on a real, physical machine somewhere). If her app crashes, Cloud Foundry just starts it up again. If the underlying machine crashes or Amazon takes it offline
(maybe they need to swap out a disk or something), Cloud Foundry will notice and spin up her app on a different VM.
