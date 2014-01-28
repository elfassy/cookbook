class @Recipe extends Minimongoid
  # indicate which collection to use
  @_collection: new Meteor.Collection('recipes')

  # turning on @_debug will just enable some console logging whenever you run a query on this model
  # @_debug: true

  # model relations
  @belongs_to: [
    {name: 'user'}
  ]
  @embeds_many: [
    {name: 'ingredients'}
  ]

  # model defaults
  @defaults:
    name: ''
    cooking_time: '30 mins'

  # titleize the name before creation   
  @before_create: (attr) ->
    attr.name = _.titleize(attr.name)
    attr

  # class methods
  # Find me all recipes with an ingredient that starts with "zesty"
  @zesty: ->
    @where({'ingredients.name': /^zesty/i})


  # Add some validation parameters. As long as the @error() method is triggered, then validation will fail
  validate: ->
    unless @name and @name.length > 3
      @error('name', 'Recipe name is required and should be longer than 3 letters.')
  error_message: ->
    msg = ''
    for i in @errors
      for key,value of i
        msg += "<strong>#{key}:</strong> #{value}"
    msg

  # instance methods
  spicy: ->
    "That's a spicy #{@name}!"

  # is this one of my personal creations? T/F
  myRecipe: ->
    @user_id == Meteor.userId()

  creator_name: ->
    @r('user').username
