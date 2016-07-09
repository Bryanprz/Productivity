App.notices = App.cable.subscriptions.create('NoticesChannel', {
  received: function(data) {
              $("#notices-channel").removeClass('hidden')
              return $("#notices-channel").append(this.renderNotice(data));
            },
  renderNotice: function(data) {
                  return data.notice;
                }
});

