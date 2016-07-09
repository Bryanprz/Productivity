//= require cable
//= require_self
//= require_tree .

// Since this is handling the creation of an instance of the connection between a consumer (different than subscription) for the consumer App.cable, these two lines should really be in their own file, separating the concern away from notes.js.
this.App = {};
App.cable = ActionCable.createConsumer(); // this doesn't specify socket URI, ws://localhost:3000/cable

// Here is where we add the subscription (a subscription is the connection between the subscriber and the channel) to the channel 'notes'.
// When App.cable.subscriptions.create is invoked, the callback function NotesChannel#subscribed is called. That method in turn streams all new broadcasts. Broadcasts are being sent from NotesController to channel, sending along any new
// notes as JSON to the client-side subscription here
//
// controller -> channel -> subscriber
//
// data is the JSON object being sent from the channel, and that data has "note" definted on it from the key "note" from ActionCable.server.broadcast 'notes', note: @note.description
App.notes = App.cable.subscriptions.create('NotesChannel', {
  received: function(data) {
              $('#notes').removeClass('hidden')
              return $('#notes').append(this.renderNotes(data));
            },

  renderNotes: function(data) {
                   return "<tr>" + "<td>" + data.note + "</td>" + "<td><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/notes/" + data.id + "'>Destroy</a></td>" + "</tr>";
                 }
});

$("#new_note_button").click(function() {
  var form = $("#new_note")[0];
  form.submit();
});
