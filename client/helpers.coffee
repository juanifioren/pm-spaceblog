Template.registerHelper 'showCategoryName', (categoryId) ->

    category = Categories.findOne({ _id: categoryId })

    return category.name

Template.registerHelper 'dateFormat', (date, format) ->

	return moment(date).format(format)

Template.registerHelper 'dateFromNow', (date) ->

	return moment(date).fromNow(true)