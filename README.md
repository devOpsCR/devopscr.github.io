# Website DevOps Costa Rica

Este sitio utiliza [Harp Server](http://harpjs.com/) (a static web server with built-in pre-processing build with NodeJS).
Y esta el diseño basado en el template [Clean Blog](http://startbootstrap.com/template-overviews/clean-blog/)_

## Index

- [How to use it?](#how-to-use-it)
    - [On your own computer](#on-your-own-computer)
- [Controlling your content](#controlling-your-content)
- [Adding new posts](#adding-new-posts)
- [Adding new pages](#adding-new-pages)
- [TODOs](#todos)
- [Support](#support)
- [License](#license)

---

## How to use it?

### On your own computer

1. [Install Harp Server](http://harpjs.com/docs/environment/install) on your computer
2. Open your terminal and start a new project:

````
$ git clone git@github.com:devOpsCR/devopscr.github.io.git
$ cd devopscr.github.io
$ harp server -p 9966
````

Go to [http://localhost:9966](http://localhost:9966/) from your browser to see the website.


## Controlling your content

Harp brings you back to the basics of the web. Always keep in mind that your directory structure and file names are your URL paths.

Creating a new page is as simple as creating a new file and writing content in it.

### `public/posts`

This is where your posts and their content live.

### `public/_layout.jade`

The layout of your site, including header, footer and sidebar. External scripts or stylesheets are included in this file. Global elements belong here as well (i.e.: header, nav, sidebar, etc.)

### `public/index.jade`

This is the default page when you visit your domain (i.e.: `http://localhost:9966/`). Here we build the loop that goes through your posts and shows them in the front page.

### `public/assets/css/app.less`

This is the place where your blog CSS should live.

## Adding new posts

__1__. Create a new file (`.jade`, `.ejs`, `.html` or `.md`) in the `public/posts/` directory

````
$ touch public/posts/kittens.html
````

__2__. Enter your post content in the file you just created:

_public/posts/kittens.html:_

````
<h1><a href="/posts/kittens">I love kittens!</a></h1>
<p>This is my first post using Harp!</p>
````

__3__. Open `public/posts/_data.json` and add your new post data:

````
{
  ...                        <-- other blog posts
  "kittens": {               <-- post slug (file name without extension)
    "title": "Cute Kittens"  <-- post title
  }
  ...                        <-- other blog posts
}
````

## Adding new pages

__1__. Create a new file inside the `public` directory:

````
$ touch public/about.html
````

__2__. Enter the page content in the newly created file

_public/about.html:_

````
<h1>About me</h1>
<p>I love fotoshapz and taking pictures of foods</p>
````

__3__. Your can now access your page in your browser. I.e.: `http://localhost:9966/about`

## Enabling/Disabling Comments

This blog boilerplate makes it really easy to enable your visitors to leave comments on your blog posts.

Open the `/harp.json` file and look for the disqus section. It should look something like this:

```
...
"disqus": {
  "enabled": false,
  "shortname": ""
}
...
```

In the disqus configuration there are two configurable keys:

`enabled`: can be `true` or `false`. Make it true to display comments and false to disable them. Make sure the value is not wrapped in quotes like this `"false"`, otherwise it will still show the comments.

`shortname`: this is your shortname assigned by Disqus. [Signup for Disqus](https://disqus.com/admin/signup/) and get your own shortname, then enter it as a string (with wrapping double quotes) as the shortname value.

This is what it looks like when it’s enabled:

```
...
"disqus": {
  "enabled": true,
  "shortname": "jorgepedret"
}
...
```

## Enabling/Disabling Sitemap.xml

Open the `/harp.json` file and look for the sitemap section:

```
...
"sitemap": {
  "enabled": true,
  "changefreq": "daily"
}
...
```

Change "changefreq" to fit your blog needs. The result will be live in /sitemap.xml

## Support

Please [create an issue](https://github.com/devOpsCR/devopscr.github.io-issues on github’s bug tracker. Feedback and bug reports are greatly appreciated.

## License

MIT  
