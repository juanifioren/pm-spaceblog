Meteor.publish 'lastPosts', () ->

    return Posts.find({}, { limit: 8, sort: { createdAt: -1 } })