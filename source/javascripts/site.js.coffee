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

    # $('.login-menu').hover ->
    #   $menu.show()

  $menu.click(dont_bubble)


  # Label-based placeholders
  # jquery function to convert HTML5 placeholder text into labels for older browsers

  # actions on context of the field
  update_label_visibility = ->
    if $(this).val() == ''
      $(this).siblings('label').show()
    else
      $(this).siblings('label').hide()

  hide_label = ->
    $(this).siblings('label').hide()

  # find placeholder fields and replace them with this structure
  $('input').filter(-> $(this).attr('placeholder')).each ->
    $field = $(this)
    template = """
              <div class="label-placeholder">
                <label for="#{$field.attr('id')}">
                  #{$field.attr('placeholder')}
                </label>
              </div>
              """
    # replace bare field with field inside grouping
    $group = $(template)
    $field.after($group)
    $group.append($field)
    # and remove native placeholder text
    $field.attr('placeholder', '')

    $field.focus(update_label_visibility)
    $field.blur(update_label_visibility)
    $field.bind("propertychange keyup input paste", update_label_visibility)





