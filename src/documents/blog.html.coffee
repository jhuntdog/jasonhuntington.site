---
layout: 'page'
title: 'Articles'
tags: ['page']
scripts: []
navlinktitle: 'Blog'
navicon: 'icon-rss'
isPage: true
pageOrder: 3
navOrder: 3
url: '/blog'
urls: ['/blog/','/blog/index.html','/blog.html']
---

# Post Listing
posts = []
for document in @getCollection('posts').toJSON()
  posts.push(document)
if posts.length
  text @partial 'document-list.html.coffee', {
    documents: posts
  }