Template.Layout.events

    'click #openLoginModal': (event) ->
        loginModal = $('.login.modal')
        loginModal
            .modal
                onApprove: () ->
                    email = $('[name=email]').val().toLowerCase()
                    password = $('[name=password]').val()

                    Meteor.loginWithPassword email, password, (error) ->
                        if error
                            loginModal.transition('jiggle')
                        else
                            loginModal.modal('hide')
                            Router.go('Home')
                    return false
            .modal('show')
