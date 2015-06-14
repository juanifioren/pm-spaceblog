Router.configure

    layoutTemplate: 'Layout'
    notFoundTemplate: 'NotFound'

Router.plugin 'dataNotFound',

    notFoundTemplate: 'NotFound'

initialSubscriptions = () ->
    Meteor.subscribe('categories')

Router.waitOn initialSubscriptions

Router.map ->

    @route 'Home',

        path: '/'

        onBeforeAction: () ->
            Meteor.subscribe('lastPosts')
            @next()

        data: () ->
            posts = Posts.find({}, { sort: { createdAt: -1 } }).fetch()
            categories = Categories.find({}, { sort: { name: 1 } }).fetch()
            return data =
                posts: posts
                categories: categories

    @route 'Post',

        path: '/post/:slug'

        waitOn: () ->
            Meteor.subscribe('postBySlug', @params.slug)

        data: () ->
            return Posts.findOne({ slug: @params.slug })

    @route 'Category',

        path: '/category/:slug'

        onBeforeAction: () ->
            Meteor.call 'categoryPostsBySlug', @params.slug, (error, result) ->
                Session.set('categoryPosts', result) if result
            
            @next()

        data: () ->
            category = Categories.findOne({ slug: @params.slug })
            posts = Session.get('categoryPosts')
            return data =
                category: category
                posts: posts

        onStop: () ->
            delete Session.keys['categoryPosts']

    @route 'AdminCreatePost',

        path: '/admin/post'
