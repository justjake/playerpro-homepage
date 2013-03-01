jQuery('document').ready ($) ->
  $card = $('#player-card')
  $overlay = $('<div id="overlay-bg"></div>').hide().prependTo($ 'body')
  $menu = $ '.login-menu form'

  dont_bubble = (e) -> e.stopPropagation()

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
  # there's an inisible area around the card that should still close the overlay
  $('.app-preview .container').click(hide_form)
  # dont hide the form when you click in it though!
  $('.app-preview #player-card').click(dont_bubble)

  $('.show-signup-form').click(show_form)

  $('body').click ->
    $menu.hide()

  $('.login-menu').click (e) ->
    $menu.toggle()
    dont_bubble(e)

  $menu.click(dont_bubble)


