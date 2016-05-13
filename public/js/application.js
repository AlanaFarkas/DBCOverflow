$(document).ready(function() {

  // Post answer to question
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
        // $('#answer-form').find("textarea[body]").clear();
      });
    });

  // Comments for questions
  $('#question-comments-container').on('submit', '#new-comment-form-question', function(e){
      e.preventDefault();

      var data = $(e.target).serialize();
      var url = e.target.action;
      var type = e.target.method;

      $.ajax({
        type: type,
        url: url,
        data: data
      }).done(function(response){
        $('#question-comment-list').append(response);
      });
  });

  //Comments for answers
  $('.answer-comments-container').on('submit', '.new-comment-form-answer', function(e) {
    e.preventDefault();

    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    // debugger;

    $.ajax({
      type: type,
      url: url,
      data: data
    }).done(function(response){
      debugger;
      $(e.target).closest(".new-comment-form-answer-container").siblings(".answer-comment-list").append(response);
    });
  });

  //Voting question AJAX
  $('#upvote-button-form-question').on('submit', function(e){
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {

      $('#question-vote-count').text(response);
    });

  });

  $('#downvote-button-form-question').on('submit', function(e){
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {
      $('#question-vote-count').text(response);
    });
  });

  // Voting answer AJAX
    $('#upvote-button-form-answer').on('submit', function(e){
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {

      $('#answer-vote-count').text(response);
    });

  });

  $('#downvote-button-form-answer').on('submit', function(e){
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {
      $('#answer-vote-count').text(response);
    });
  });

  $('#answer-delete').on('submit', function(e) {
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;
    debugger;

    $.ajax({
      type: type,
      url: url,
    }).done(function(response){

    });
  });

});
