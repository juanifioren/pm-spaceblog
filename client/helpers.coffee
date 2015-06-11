Template.registerHelper 'showCategoryName', (categoryId) ->

    category = Categories.findOne({ _id: categoryId })

    return category.name