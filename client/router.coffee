Router.configure

    layoutTemplate: 'Layout'

Router.map ->

    @route 'Home',

        path: '/'

        onBeforeAction: () ->
            Meteor.subscribe('lastPosts')
            @next()

        data: () ->
            posts = Posts.find().fetch()
            return data =
                posts: posts
