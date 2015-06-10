Meteor.startup () ->

    if Posts.find().count() == 0

        console.log('Create some dummy posts.')
        Posts.insert({ title: 'Hello World', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', createdAt: new Date('October 15, 2014 11:30:00') })
        Posts.insert({ title: 'Second Post', content: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.', createdAt: new Date('January 20, 2015 09:30:00') })