$(document).ready(function() {
  var currentFeedsPage = 1;
  var currentFriendsPage = 1;
  var currentCommentsPage = 1;
   
  $(function($) {
    $('.feeds-content').bind('scroll', function() {
      if($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight) {
        currentFeedsPage++;
        $.ajax({
          url: 'paginate_feeds?page=' + currentFeedsPage,
          type: 'GET',
          dataType: 'json',
          success: function(data) {
            console.log(data);
            html = ""
            for (i=0;i<data.length;i++) {
              html += "<p>"+ data[i]["message"] +"</p><hr>";
            }
            $('.feeds-content').append(html);
          }
        });
      }
    });

    $('.comments-list').bind('scroll', function() {
      if($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight) {
        currentCommentsPage++;
        $.ajax({
          url: 'paginate_comments?page=' + currentCommentsPage + '&id=' + document.getElementById('methodology_').value,
          type: 'GET',
          dataType: 'json',
          success: function(data) {
            console.log(data);
            html = ""
            for (i=0;i<data.length;i++) {
              html += toHtmlComment(data[i]["image_path"], data[i]["user_name"], data[i]["time"], data[i]["content"]);
            }
            $('.comments-list').append(html);
          }
        });
      }
    });

    function toHtmlComment(image, user_name, time, content) {
      var html = "<div class='row'>";
      html += "<div class='col-lg-1'>"+ image + "</div>";
      html += "<div class='col-lg-11'>";
      html += "<p><b>"+ user_name +"</b> - "+ time +"</p>";
      html += "<div class='comment-content'>";
      html += "<p>"+ content +"</p>";
      html += "</div>";
      html += "</div>";
      html += "</div>";
      html += "<hr>";

      return html;
    }

    $('.user-friends-content').bind('scroll', function() {
      if($(this).scrollTop() + $(this).innerHeight() >= this.scrollHeight) {
        currentFriendsPage++;
        $.ajax({
          url: 'paginate_friends?page=' + currentFriendsPage,
          type: 'GET',
          dataType: 'json',
          success: function(data) {
            console.log(data);
            html = ""
            for (i=0;i<data.length;i++) {
              html += "<p><a href='/users/profile/"+ data[i]["friend_id"] +"'>"+ data[i]["name"] +"</a>";
              html += " - <a data-confirm='Tem certeza que deseja remover amigo?' data-method='delete'";
              html += " href='/friendships/"+ data[i]["id"] +"' rel='no-follow'>Remover amigo</a></p>";
            }
            $('.user-friends-content').append(html);
          }
        });
      }
    })
  });
});