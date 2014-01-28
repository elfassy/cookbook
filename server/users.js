 Meteor.startup(function () {
    // code to run on server at startup

    // back to the basics, delete everything
    // User.destroyAll();
    // Recipe.destroyAll();

  });

  Meteor.publish('userData', function() {
    return User.find({}, {
      fields: {
        username: 1,
        friend_ids: 1,
        createdAt: 1
      }
    });
    return User.find()
  });


  Meteor.users.allow({
    update: function(user_id, doc, fields, modifier) {
      if (doc._id !== Meteor.userId()) {
        return false;
      } else {
        return true; 
      }
    }
  });



  // Meteor.methods({
  //   add_friend: function() {}
  // })



  Accounts.onCreateUser(function(options, user) {
    // give the user a "username" based on the initial part of their email address
    user.username = User.init(user).email().split('@')[0];
    if (options.profile) user.profile = options.profile;
    return user;
  });
