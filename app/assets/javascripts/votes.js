$(document).ready(function() {
  $('.upvote').on("click", function() {
    // 1. Use JS to find out whether we're in a question, answer, or comment
    // 2. send "Question", "Answer", or "Comment" to votes#create controller, to
    // use as votable_type in Vote creation.
    // 3. send the id of the question/answer/comment that is being voted upon, to
    // votes#create controller, to use as votable_id in Vote creation.
    // 4. send up: true to votes#create
  })

  $('.downvote').on("click", function() {
    // 1. use JS to find out whether we're in a question, answer, or comment
    // 2. send "Question", "Answer", or "Comment" to votes#create controller, to
    // use as votable_type in Vote creation.
    // 3. send the id of the question/answer/comment that is being voted upon, to
    // votes#create controller, to use as votable_id in Vote creation.
    // 4. send up: false to votes#create
  })

})
