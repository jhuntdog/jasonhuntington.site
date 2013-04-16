

# The DocPad Configuration File
docpadConfig = {

  # =================================
  # Template Data
  templateData:

    # Site properties
    site:
      # The production url of our website
      url: "http://jasonhuntington.com"

      # Here are some old site urls that you would like to redirect from
      oldUrls: [
        'www.jasonhuntington.com',
        'jasonhuntington.herokuapp.com'
      ]

      title: "JasonHuntington"
      subtitle: "Jason Huntington Website"
      author: "Jason Huntington"
      email: "jason@jasonhuntington.com"
      description: """
        Website of Jason Huntington. Just an average guy building a website.
        """
      keywords: """
        jasonhuntington, Jason Huntington, jhuntdog, jhunt, jasonmhuntington
        """
      copyright: "© 2013 Jason Huntington"

      text:
        heading: "Jason Huntington"

      services:
        facebookLikeButton:
          applicationId: ''
        facebookFollowButton:
          applicationId: ''
          username: 'jasonmhuntington'
        twitterTweetButton: "jasonhuntington"
        twitterFollowButton: "jasonhuntington"
        githubFollowButton: "jhuntdog"
        linkedinButton: "jasonhuntington"
        googleAnalytics: 'UA-40082218-1'

      social:
        """
        googleplus
        linkedin
        twitter
        facebook
        github
        """.trim().split('\n')

      # The website's styles
      styles: [
        '/styles/styles.css'
      ]

      # The website's scripts
      scripts: """
        /components/jhtwbs/docs/assets/js/bootstrap.js
        /scripts/plugins.js
        /scripts/scripts.js
        """.trim().split('\n')




    # -----------------------------
    # Helper Functions

    # -----------------------------
    # Meta Helper Functions
    getPreparedTitle: -> if @document.title then "#{@document.title} | #{@site.title}" else @site.title
    getPreparedAuthor: -> @document.author or @site.author
    getPreparedEmail: -> @document.email or @site.email
    getPreparedDescription: -> @document.description or @site.description
    getPreparedKeywords: -> @site.keywords.concat(@document.keywords or []).join(', ')

    # Get page title
    getDocumentTitle: ->
      if @document.title
        "#{@document.title}"
      else
        @site.title

    getDocumentSubtitle: ->
      if @document.subtitle
        "#{@document.subtitle}"
      else
        @site.subtitle

  # =================================
  # Collections

  collections:
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

    navpages: (database) ->
      database.findAllLive({navOrder: $exists: true}, [pageOrder:1,title:1])

    posts: (database) ->
      database.findAllLive({relativeOutDirPath:'posts'},[date:-1])


  # =================================
  # DocPad Events

  # Here we can define handlers for events that DocPad fires
  # You can find a full listing of events on the DocPad Wiki
  events:

    # Server Extend
    # Used to add our own custom routes to the server before the docpad routes are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      # and fetch our urls from it
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      # Redirect any requests accessing one of our sites oldUrls to the new site url
      server.use (req,res,next) ->
        if req.headers.host in oldUrls
          res.redirect(newUrl+req.url, 301)
        else
          next()
}

# Export our DocPad Configuration
module.exports = docpadConfig