jQuery('document').ready ($) ->
  $card = $('#player-card')
  $overlay = $('<div id="overlay-bg"></div>').hide().prependTo($ 'body')

  transition_time = 500

  hide_form = ->
    $card.removeClass('back-side').addClass('front-side')
    $overlay.fadeOut(500)
    console.log('hid')

  show_form = ->
    $card.removeClass('front-side').addClass('back-side')
    $overlay.fadeIn(500)
    console.log('show')

  # bind handlers
  $overlay.click(hide_form)
  $('.show-signup-form').click(show_form)

