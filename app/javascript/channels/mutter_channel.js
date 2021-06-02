import consumer from "./consumer"

consumer.subscriptions.create("MutterChannel", {
  connected() {
    console.log('MutterChannel#connected');
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    if (data.message == 'add') {
      let el = document.querySelector('button[id=reload]');
      if (el != null) {
        el.click();
      }
      // document.querySelector('button[id=reload]').click();
    }    
    // Called when there's incoming data on the websocket for this channel
  }
});
