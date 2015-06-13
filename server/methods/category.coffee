Meteor.methods
    
    categoryPostsBySlug: (slug) ->
    	category = Categories.findOne({ slug: slug })
    	posts = Posts.find({ category: category._id }, { fields: { 'content': 0 }, sort: { createdAt: -1 } }).fetch()

    	return posts