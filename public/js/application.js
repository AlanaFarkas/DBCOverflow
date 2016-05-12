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

  $('#question-comments-container').on('submit', '#new-comment-form-question', function(e){
      e.preventDefault();

      var data = $(e.target).serialize();
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

  //Comments for answers
  $('#answer-comments-container').on('submit', '#new-comment-form-answer', function(e) {
    e.preventDefault();

    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url,
      data: data
    }).done(function(response){
      $('#answer-comment-list').append(response);
    });
  });

});
