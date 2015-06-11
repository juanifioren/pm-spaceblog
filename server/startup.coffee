Meteor.startup () ->

    if Posts.find().count() == 0

        console.log('Create some dummy categories.')
        firstCategory = Categories.insert({ name: 'Greetings' })
        secondCategory = Categories.insert({ name: 'Sports' })

        console.log('Create some dummy posts.')
        Posts.insert({ category: firstCategory, title: 'Hello World', slug: 'hello-world', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', createdAt: new Date('October 15, 2014 11:30:00') })
        Posts.insert({ category: secondCategory, title: 'Second Post', slug: 'second-post', content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', createdAt: new Date('January 20, 2015 09:30:00') })