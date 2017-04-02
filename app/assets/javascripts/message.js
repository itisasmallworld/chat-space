$(function() {
  function buildHTML(message) {
    var html = `<span>
                  <div class="messages__member">${message.name}</div>
                </span>
                <span>
                  <div class="messages__date">${message.created_at}</div>
                </span>
                <span>
                  <div class="messages__text">${message.body}</div>
                </span>`;
    return html;
  }

  $('.js-form'). on('submit', function(e){
    e.preventDefault();
    e.stopPropagation();
    var textarea = $('.textarea');
    var formData = new FormData ($(this).get(0));
    var path_name = location.pathname;
    $.ajax ({
      type:'POST',
      url: path_name,
      data: formData,
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data);
      var html = buildHTML(data);
      $('.messages').append(html);
    })
    .fail(function() {
      alert('error');
    });
  });
});
