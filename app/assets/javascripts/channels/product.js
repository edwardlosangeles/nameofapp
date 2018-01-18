App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".alert.alert-info").show();

    // 20171228 6.14: ActiveJob and Advanced ActionCable
    // moved from nameofapp/app/views/comments/create.js.erb
    $('.product-reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  // 20171228 6.14: ActiveJob and Advanced ActionCable
  listen_to_comments: function() {
    return this.perform('listen', {
      product_id: $("[data-product-id]").data("product-id")
    });
  }

});

// 20171228 6.14: ActiveJob and Advanced ActionCable
$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});