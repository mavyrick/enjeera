$(document).ready(function() {
  $('#application_questions').sortable({
    update: function() {
      var ids = $(this).sortable('serialize');
      $.post('/application_questions/sort', ids);
    }
  });
});
