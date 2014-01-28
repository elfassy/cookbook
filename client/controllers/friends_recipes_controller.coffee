class @FriendsRecipesController extends RouteController
  before: ->
    @subscribe('recipes').wait()
    @subscribe('userData').wait()

  data: ->
    recipes: ->
      recipes = _.reduceRight(User.current().friends(), (a, b) ->
        a.concat b.recipes()
      , [])
      recipes