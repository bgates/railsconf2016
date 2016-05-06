# Notes!

OK, I made it up through slide 34, the rubber ducking video.

The next section is called "Our Friend, the Error Message".

Slide 35 is how I used to read error messages, when I identified my code with myself: The error meant my code was flawed, which meant _I_ was flawed. I got so caught up with worrying about myself that I had no mental capacity left to fix the bug!

What happens with most problems is that I'm better at recognizing them when other people have them. When I started teaching  software development, I could see students dreading the appearance of the error message. That's when I realized how much better off we'd be if we didn't see it as an attack, but as a learning opportunity. That's when I started calling it "My Friend the Error Message". Whenever it appeared, whether I was pairing or teaching in front of the class, whether it was a planned part of the curriculum or a for-real screwup, I'd adopt my best Mr Rogers voice and say "Look - it's Our Friend the Error Message. It's come to tell us about an error." And just like that, the error message stopped being a vicious attack, and started being a helpful little emissary from Ruby. 

It's just a bit hard to understand if you're not used to it. Slide 37 was a short list of a few of the most common error messages. If you are unused to them, open up irb and try them out:

If you enter `@previously_undefined_instance_variable.some_method` in irb, you'll get `NoMethodError: undefined method 'some_method' for nil`. Instance variables for any object live in a collection that's kind of like a hash - they associate names with values. Also like a hash, the default value for instance variables is `nil`. So if you use an instance variable that hasn't been defined yet, Ruby sees it as a nil. Then if you try to call a method on that instance variable, Ruby thinks you're calling a method on nil, which will probably lead to the NoMethodError, because `NilClass` doesn't have many methods.

If you enter `"string".upcase(:right_away)` in irb, you'll get `ArgumentError: wrong number of arguments(1 for 0)`. The `upcase` method doesn't take any arguments, which means having one argument is the wrong number of arguments - specifically, using one when you should have used zero.

If Ruby sees something capitalized that isn't the name of a constant it has loaded, it will respond with a `NameError`. Likewise if Ruby sees something uncapitalized that hasn't been initialized yet, though in that case to cover its bases Ruby will let you know that the undefined thing might be either a local variable or a method. 

There are a handful of other errors, but you will get used to many of them and learn to Google for occurrences of (and fixes for) the others. You might also see errors that don't come from your code, but from libraries you have loaded. Those errors are usually Googleable too. (That's a hint.)

Slide 38 directs you to try to start up a Rails app. I have to confess, there's really no code in there - I realized we'd have enough to do for the workshop. Nonetheless, when you start the app and visit localhost:3000, something interesting happens. Take a look at `logs/development.log` to get a clue as to what's going on.

The next-to-last things I wanted to point you towards were a couple of small helpful gems specifically for Rails debugging. Quiet Assets (https://github.com/evrone/quiet_assets) stops the logger from recording all of the css and js files that get loaded as part of the asset pipeline, which makes `logs/development.log` much easier to read. Better Errors (https://github.com/charliesome/better_errors) replaces the default Rails error page with a much more informative one which includes a rails console, information about the environment, and more.

Pry (https://pryrepl.org) is an amazing piece of work, which explains itself better than I can. It's a replacement for irb. Check it out.

That's all for my notes; thanks for coming to the workshop, and if you run into any bugs you'd like help with, please send me an email; like I said on the first two slides, my name is Brian Gates and I work at theironyard.com, so insert the dot and the @ in the appropriate places.

Oh! And these slides were made with a sweet little gem called Reveal-CK (https://github.com/jedcn/reveal-ck), which has nothing to do with the perfume Reveal by Calvin Klein. It's a way to build presentations powered by the reveal.js library, but you can write the slides in your choice of HTML, ERB, Haml, or (my choice) Slim. You can open the file `slides/index.html` right in your browser and see the whole deck.