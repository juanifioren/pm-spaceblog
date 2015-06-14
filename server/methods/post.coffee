slugify = (text) ->
    return text.toString().toLowerCase()
        .replace(/\s+/g, '-')
        .replace(/[^\w\-]+/g, '')
        .replace(/\-\-+/g, '-')
        .replace(/^-+/, '')
        .replace(/-+$/, '')

Meteor.methods
    
    createPost: (title, content, categoryId) ->
        if not Meteor.user()
            throw new Meteor.Error('user_must_be_login')

        postId = Posts.insert
            category: categoryId
            title: title
            slug: slugify(title)
            content: content
            createdAt: new Date()

        return postId