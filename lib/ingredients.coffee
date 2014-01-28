
class @Ingredient extends Minimongoid
  @embedded_in: 'recipe'

  @defaults:
    quantity: 1

  nice_quantity: ->
    if @quantity == 1 then "#{@quantity} dash" else "#{@quantity} dashes"

  myRecipe: ->
    @recipe.myRecipe()

