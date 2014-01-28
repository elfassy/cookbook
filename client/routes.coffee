Template.navbar.currentUserId = ->
  Meteor.userId()

Template.navbar.helpers {
  'active' : (route_name) ->
    if Router.current().route.name == route_name
      "active"
}  

Router.map ->
  @route "home", {
    path: "/"
  }

  @route "friends", {
    path: "/friends"
  } 

  @route "friends_recipes", {
    path: "/friends_recipes"
  } 

  @route "recipes", {
    path: "/recipes"
  } 


Router.configure {
  layoutTemplate: "layout"
}