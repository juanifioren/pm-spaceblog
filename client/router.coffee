Router.configure

    layoutTemplate: 'Layout'

Router.plugin 'dataNotFound',

    notFoundTemplate: 'NotFound'

Router.map ->

    @route 'Home',

        path: '/'

        onBeforeAction: () ->
            Meteor.subscribe('lastPosts')
            @next()

        data: () ->
            posts = Posts.find({}, { sort: { createdAt: -1 } }).fetch()
            return data =
                posts: posts

    @route 'Post',

        path: '/post/:slug'

        waitOn: () ->
            Meteor.subscribe('postBySlug', @params.slug)

        data: () ->
            return Posts.findOne({ slug: @params.slug })