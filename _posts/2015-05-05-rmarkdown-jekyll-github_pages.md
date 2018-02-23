---
layout: post
title: "Creating a website on Github using Rmarkdown with Jekyll and servr"
published: false
---

I am pretty new to using R and to GitHub, but I liked the idea of creating a static website on GitHub and then publishing Rmarkdown both to my project repository (on patent analytics) and to a static website. What I didn't want to bother with, amid learning R, was messing around with Content Management Systems, databases, hosting packages and complicated templates. 

Having never heard of [Jekyll](http://jekyllrb.com/) I found it a bit intimidating but cheered up when I read Tom Preston-Werner's [Blogging Like A Hacker](http://tom.preston-werner.com/2008/11/17/blogging-like-a-hacker.html) article on the background to Jekyll. This made sense to me and so I decided to brace myself and go for it. 

There are a few ways to get started. I'll start with the way I found worked best for me as a newbie and then list the other ways below. They all worked and a different approach may suit you better.  

###My preferred route.

Assuming you already have a [GitHub account](https://github.com/) (it takes no time at all), I found the easiest way to get started is to follow Barry Clark's excellent guide at [Jekyll Now](http://www.barryclark.co/introducing-jekyll-now/). HitHub pages come in two forms, user pages and project pages. I decided to start with project pages because they are easier. This involves forking the [Jekyll Now GitHub repository](https://github.com/barryclark/jekyll-now), replacing the name with your username, following some simple instructions and you have a functioning site in a few minutes. 

It is easy enough to edit and create posts directly in GitHub. The suggested onsite editor [Prose by Development Seed](http://prose.io/) is very easy to use. More info on Prose can be found on their website [website](https://developmentseed.org/blog/2012/june/25/prose-a-content-editor-for-github/). 

You are now good to go in terms of a GitHub user site. Barry Clark's more detailed follow on guide for GitHub blogs is [here](http://www.smashingmagazine.com/2014/08/01/build-blog-jekyll-github-pages/).

I then cloned the repository to my machine to start editing and adding posts and pages. But, the main idea behind all of this is to use RStudio to write and publish my posts. What is needed then is a way to convert Rmarkdown into GitHub flavoured markdown and, as far as possible, post directly from RStudio. More on that below. First, let's briefly list other ways to get going with Jekyll for GitHub pages.  

###Other ways to get started

Different people may prefer different approaches. Here are the other ways I tried. 

1. You can simply go to [Jekyll](http://jekyllrb.com/) and follow the v. fast instructions leading to the [GitHub Pages instructions](https://pages.github.com/). It worked as it said on the packet but I felt I needed my hand holding a bit more. 
2. [Jekyllbootstrap](http://jekyllbootstrap.com/) also offered a quick start and worked. I guess what I was less happy about was that I had no idea what was going on. You may be different of course.
3. I also tried the GitHub help [Using Jekyll with Pages](https://help.github.com/articles/using-jekyll-with-pages/). I'm running Mac OSX Yosemite and found that I struggled with the [gem install bundler](https://help.github.com/articles/using-jekyll-with-pages/) step. I found the [RailsApps Project](http://railsapps.github.io/installrubyonrails-mac.html) article really helpful in getting the machine organised before heading back to the GitHub instructions. 

##From Rmarkdown to Jekyll

There seem to be two main approaches to this. The first is a short term approach that works very nicely and the second may work better in the long term. 

1. Jerid Francom has a very nice article discussing [publishing Rmarkdown to Wordpress and Jekyll](http://francojc.github.io/publishing-rmarkdown-to-wordpress-or-jekyll/). Building on a knitr function posted by [jfischer-usgs](https://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/) it is easy to convert an Rmarkdown file into markdown. Here is [Jerid's](http://francojc.github.io/publishing-rmarkdown-to-wordpress-or-jekyll/) function.


{% highlight r %}
library(knitr)
my.jekyll.site <- "gitusername.github.io"
KnitPost <- function(input, base.url = my.jekyll.site) {
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("images/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  knit(input, envir = parent.frame())
}
{% endhighlight %}

Copy the code into an R script, replace the "gitusername.github.io" with your own, then save the script into your website root. Note that `fig.path` will look for the `_images` folder in the site directory to place any images there. 

Before running the function you may want to check that you are in the right working directory using `getwd()` and if it is a blog post then set the working directory to the `_posts` folder using `setwd("yourpathtoposts")`.

Then run the script for your post: 


{% highlight r %}
KnitPost("YYYY-MM-DD-my-filename.Rmd")
{% endhighlight %}

This worked very nicely indeed. A few things to note: 

###1. Images. any images created will be in images/my-filename/. Move those into THE INSTRUCTIONS DO NOT MAKE SENSE HERE. TRY INCLUDING AN IMAGE 

Note that you can preview the results by running 'jekyll serve' in the terminal and the going to 'xxxxx' in your browser. However, you will not see any images until the site changes are committed to GitHub (using GitHUb mac in my case). 

This is a nice and simple solution that is easy to follow and works. 

###2. Using servr and knitr

This seems to be a longer term solution for integrating the workflow from RStudio to Github pages. I am not quite there yet in understanding how to implement this but will show you where I am and update later. 

Yihui Xie and collaborators at [RStudio](http://www.rstudio.com/) have developed the [servr](https://github.com/yihui/servr) package as "A Simple HTTP Server to Serve Static Files or Dynamic Documents". The beauty of this is that it can be used to preview documents, including images, directly in a browser inside RStudio. It is also possible to publish Rmarkdown documents direct to the Jekyll site on GitHub. 


{% highlight r %}
install.packages("servr")
{% endhighlight %}


{% highlight r %}
library(servr)
library(knitr)
{% endhighlight %}

It is also important to read Yihui Xie's [article](http://yihui.name/knitr-jekyll/2014/09/jekyll-with-knitr.html) to get started and the documentation (which oddly won't call easily inside RStudio but is [here](http://cran.r-project.org/web/packages/servr/servr.pdf)) or accessible by clicking the package name servr in the  Packages tab.  

What servr does is start an HTTP server in R that can be used to serve statis or dynamic documents and allows those to be converted to HTML or Jekyll .md to post to a Github site. 

First, let's take a look at the server. It is worth checking the working directory with `getwd()` and changing as needed `setwd()` before you start. I selected the `_posts` directory for my site.  


{% highlight r %}
httd("/Users/pauloldham17inch/poldham.github.io/_posts")
{% endhighlight %}

You should see a list of files inside the directory and clicking on one will bring it into the browser. This will give you an idea of how the text looks including any images that may have been generated. Note that if you make changes to the actual text you will need to stop the server (red stop button) and rerun the httd command to make them visible. So far so good...

The next part can be a bit of a struggle.

servr has a number of functions. For our purposes they are

1. jekyll
2. make 
3. rmdv1
4. rmdv2

###jekyll

jekyll(dir = ".", input = c(".", "_source", "_posts"), output = c(".", 
    "_posts", "_posts"), script = c("Makefile", "build.R"), serve = TRUE, 
    command = "jekyll build", ...)
    

{% highlight r %}
jekyll("/Users/pauloldham17inch/poldham.github.io", input = c("/Users/pauloldham17inch/poldham.github.io", "_source", "_posts"), output = c("/Users/pauloldham17inch/poldham.github.io", "_posts", "_posts"), script = c("Makefile", "build.R"), serve = TRUE, command = "jekyll build")
{% endhighlight %}



{% highlight text %}
## Error in jekyll_build(): Failed to run: jekyll build
{% endhighlight %}




###Other Guides and Resources

1. The [Jekyll Documentation](http://jekyllrb.com/docs/home/) is helpul. 
2. Adam-p's [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) on GitHub is really handy.
3. [Made Mistakes](https://mademistakes.com/) is a cool Jekyll website by designer Michael Rose. 
4. For R users Yihui Xie at RStudio has developed [servr](http://yihui.name/knitr-jekyll/2014/09/jekyll-with-knitr.html) that with knitr will directly serve R pages to Jekyll for websites.
5. For R Users [Jason Bryer's article and code](http://jason.bryer.org/posts/2012-12-10/Markdown_Jekyll_R_for_Blogging.html) provides a solution to using RMarkdown with Jekyll for GitHub pages.
6. Jerid Francom has a nice article discussing [publishing Rmarkdown to Wordpress and Jekyll](http://francojc.github.io/publishing-rmarkdown-to-wordpress-or-jekyll/)
7. jfischer-usgs [Blog with Knitr and Jekyll](https://jfisher-usgs.github.io/r/2012/07/03/knitr-jekyll/)
