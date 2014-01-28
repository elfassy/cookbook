class @FriendsController extends RouteController
  before: ->
    @subscribe('userData').wait()
  # waitOn: ->
  #   Meteor.subscribe('userData')
  
  data: ->
    other_users: User.where({_id: {$ne: Meteor.userId()} }, {fields: {username: 1}})

Template.friends.events
  'click #friends a' : (e, t) ->
    e.preventDefault()
    attr = {friend_ids: @id}
    
    if User.current().friendsWith(@id)
      User.current().pull(attr)
    else 
      console.log(attr)
      User.current().push(attr)    

