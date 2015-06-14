Template.AdminCreatePost.events

    'click #createPost': (event) ->
        title = $('[name=title]').val()
        content = $('[name=content]').val()
        categoryId = $('[name=category]').val()

        if title and content and categoryId
            Meteor.call 'createPost', title, content, categoryId, (error, result) ->
                if error
                    alert('Something goes wrong!')
                else
                    Router.go('Home')