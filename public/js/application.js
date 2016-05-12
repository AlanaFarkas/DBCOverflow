$(document).ready(function() {

  $('#post-answer-container').on('submit', '#answer-form', function(e) {
      e.preventDefault();

      var data = $(e.target).serialize();
      var url = e.target.action;
      var type = e.target.method;

      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response){
        $('#answer-list').append(response);
      });
    });

  $('#question-comments-container').on('submit', '#new-comment-form', function(e){
      e.preventDefault();

      var data= $(e.target).serialize();
      var url = e.target.action;
      var type = e.target.method;
      debugger;

      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response){
        $('#question-comment-list').append(response);
      });
  });
});
