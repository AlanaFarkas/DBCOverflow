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
        // debugger;
        $('#answer-list').append(response);
        $('#answer-form').find("textarea").val("")
      });
    });

  // Comment button question
  $("#new-comment-button-question").on("click", function(e) {
    e.preventDefault();
    $(e.target).hide();
    $("#new-comment-form-question").show();
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
        $("#new-comment-button-question").show();
        $("#new-comment-form-question").hide();
        $('#new-comment-form-question').find("textarea").val("")
      });
  });

  // Comment button answers
  $("#answer-list").on("click", ".new-comment-button-answer", function(e) {
    e.preventDefault();
    // debugger;
    $(e.target).hide();
    $(e.target).siblings(".new-comment-form-answer").show();
  });

  //Comments for answers
  $('#answer-list').on('submit', '.new-comment-form-answer', function(e) {
    e.preventDefault();

    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url,
      data: data
    }).done(function(response){
      $(e.target).closest(".new-comment-form-answer-container").siblings(".answer-comment-list").append(response);
      $(".new-comment-button-answer").show();
      $(".new-comment-form-answer").hide();
      $('.new-comment-form-answer').find("textarea").val("");
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
    $('#answer-list').on('submit', '.upvote-button-form-answer', function(e){
    e.preventDefault();
    // debugger;
    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {
      // debugger;
      $(e.target).siblings(".answer-vote-count").text(response);
    });

  });

  $('#answer-list').on('submit', '.downvote-button-form-answer', function(e){
    e.preventDefault();

    var url = e.target.action;
    var type = e.target.method;

    $.ajax({
      type: type,
      url: url
    }).done(function(response) {
      $(e.target).siblings(".answer-vote-count").text(response);
    });
  });

  // Delete answer
  $('#answer-list').on('submit', '#answer-delete', function(e) {
    e.preventDefault();

    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = $(e.target).children("input").attr("value")

    $.ajax({
      type: type,
      url: url,
      data: data,
    }).done(function(response){
      $(e.target).siblings("#answer-body-"+response+"").remove();
      $(e.target).siblings("#answer-comments-container-"+response+"").remove();
      $(e.target).remove();
    });
  });

});
