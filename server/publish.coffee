Meteor.publish 'lastPosts', () ->

    return Posts.find({}, { limit: 8, sort: { createdAt: -1 } })

Meteor.publish 'postBySlug', (slug) ->

    return Posts.find({ slug: slug })