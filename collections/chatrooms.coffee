@Chatrooms = new Meteor.Collection 'chatrooms'

Meteor.methods
  addRoom: (roomInfo) ->
    if Meteor.user()
      roomAttributes = _.extend(_.pick(roomInfo, "name", "description", "createdBy", "roomMembers", "isTemporary"),
        created: new Date().getTime()
      )
      chatroomId = Chatrooms.insert(roomAttributes)


  deleteRoom: (Inputs) ->
    if Inputs.userID is Inputs.owner
      Chatrooms.remove(Inputs.roomname)
    else
      throw new Meteor.Error(401, "You're not the owner of this room")