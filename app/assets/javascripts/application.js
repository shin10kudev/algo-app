// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .
//= require ace/ace
//= require ace/worker-html
//= require ace/theme-monokai
//= require ace/mode-javascript

// Fade-out-remove animation for alerts
$(document).ready(function() {
	setTimeout(function() {
		$('.alert-box').slideUp('slow', function() {
			$(this).remove();
		})
	}, 2000);
});

// Data confirm modal interactions
$(document).on('ready', function () {
  var $confirmationModal = $("[data-confirm-modal]");

  if($confirmationModal.length) {
    $confirmationModal.on('click', function() {
      var postId = $(this).attr('data-id');
      var title = $(this).attr('data-title');

      $('#destroy-button').attr("href", "/posts/" + postId);
      $('.modal-title').html("Delete Algorithm");
    });
  }
});
