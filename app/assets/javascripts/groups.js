$(function() {
    var list = $('#user-search-result');
    var preword;
    function addUserList(name) {
        var item = $(`<li class= "user_list">
                        ${name}
                        <a class= "add-user" data-user_name=${name}>追加</a>
                      </li>`);
        list.append(item);
    }

    function userList(name) {
        var group_member = $(`<li class= "member-list">
                                ${name}
                                <a class= "remove-user">削除</a>
                              </li>`);
        $('.remove-input').append(group_member);
    }

    $("#keyword").on("keyup", function() {
        var input = $("#keyword").val();
        $.ajax ({
          type: 'GET',
          url: '/users/search',
          data: {
            name: input
          },
          dataType: 'json'
        })

        .done(function(data) {
          $('.user_list').remove();
          if (input.length !== 0) {
            $.each(data, function(i, user) {
              var user_info = user.name;
              addUserList(user_info);
            });
          }
        })
        .fail(function() {
          alert('error');
        });
        preword = input;
    });

  $('#user-search-result').on('click', '.add-user', function() {
      var name = $(this).data('user_name');
      userList(name);
      $(this).parent().remove();
  });

  $('.remove-input').on('click', '.remove-user', function() {
      $(this).parent().remove();
  });
});
