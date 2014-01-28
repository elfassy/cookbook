class @User extends Minimongoid
  # indicate which collection to use
  @_collection: Meteor.users

  # class methods
  @current: ->
    User.init(Meteor.user()) if Meteor.userId()
  @has_many: [
    {name: 'recipes', foreign_key: 'user_id'}
  ]
  @has_and_belongs_to_many: [
    {name: 'friends', class_name: 'User'}
  ]

  # instance methods 
  # return true if user is friends with User where id==user_id
  friendsWith: (user_id) ->
    _.contains @friend_ids, user_id
  # return true if user is friends with the current logged in user
  myFriend: ->
    User.current().friendsWith(@id)
  # grab the first email off the emails array
  email: ->
    if (@emails and @emails.length) then @emails[0].address else ''


