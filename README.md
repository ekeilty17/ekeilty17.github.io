# Eric Keilty's Personal Website

This is the personal website of me, Eric Keilty. You can find it at [https://erickeilty.com/](https://erickeilty.com/). 

In a way, this website is for me more than anyone else. Here, I catalog all of the stuff I've done in my life, so that way I won't forget about them! I also host my blog, where I discuss various unrelated topics that interest me. I don't expect anyone will ever read it, but I personally find writing them enjoyable.

## Local Development

Install gems (found in `Gemfile`)
```
bundle install
```

Compile the website and run the local server, listening on port [4000](http://127.0.0.1:4000/).
```
bundle exec jekyll serve
``` 

## Deployment

This website is hosted by GitHub Pages and built using Jekyll.

There is a script called `push_ghpages.sh`. What this does is it copies the locally compiled site files (found in `_site/`) and pushes them into the branch `gh-pages`. These are the files that actually generate the website. The reason for this is to allow **custom plugins**. Github operates on safe-mode and only allows approved jekyll plugins to run at deployment. This was the cleanest and most straightforward workaround that I could find. Other solutions included creating custom Github actions in order to simulate a local environment at deployment. This just felt way too hacky and opening the possibility for bugs that I don't want to fix.

Thus, committing to the `main` branch will not change the website. Only once we execute
```
./push_ghpages.sh
```
will the website update.