Meteor.publish('recipes', function () {
  return Recipe.find();
});

Recipe._collection.allow({
  insert: function(user_id, doc) {
    return user_id && doc.user_id == user_id;
  },
  update: function(user_id, doc, fields, modifier) {
    return user_id && doc.user_id == user_id;
  },
  remove: function(user_id, doc) {
    return user_id && doc.user_id == user_id;
  }    
})