// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

// This will ready a consumer that'll connect against /cable on your server by default.
// Creates subscription
(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
