# Generic tabs controller
# pass it a div cointaining sections and they will be tab-ified,
# and the div will have a tabbar prepended to it
class Tabs
    $ = jQuery
    nav = $("""<nav class="tabs"><ul></ul></nav>""")
    active = 'active'

    slugify = (title) ->
        title.toLowerCase().replace(/\s+/g, '-').replace(/[^\w-]+/g, '')

    constructor: (el) ->
        @sections = []

        @outer_nav = nav.clone()
        @nav = @outer_nav.children('ul')
        @focused = -1

        # route mouse events to controller
        @nav.on 'click', 'a', (e) => @tab_clicked(e)

        # store tab contents and create nav link
        for section in $(el).children()
            section = $(section)
            title = section.attr('title')
            @sections.push(section)
            @nav.append(@tab(title, @sections.length - 1))

        console.log(@sections)

        # focus the first tab
        @set_focus(0)

        # add the tab bar
        $(el).prepend(@outer_nav)


    tab_clicked: (event) ->
        console.log(event)
        event.preventDefault()
        idx = $(event.target).parent('li').data('tabbed.idx')

        @set_focus(idx)

    set_focus: (idx) ->

        console.log('set focus', idx)

        # negative indexes referece back of array
        if idx < 0
            idx += @sections.length

        @focused = idx

        @nav.find('a').removeClass(active)
        $(@nav.find('a')[idx]).addClass(active)

        for s in @sections
            s.hide()

        @sections[idx].show()

    tab: (title, idx) ->
        id = slugify(title)
        res = $("""<li><a href="##{id}">#{title}</a></li>""")
        res.data('tabbed.idx', idx)
        res
    



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

  if not Modernizr.input.placeholder
      # implement placeholder text as field values
      $('input[placeholder]').each ->
          field = $(this)
          placeholder = -> field.attr('placeholder')
          field.focus ->
              if field.val() == placeholder()
                  field.val('')
                  field.removeClass('placeholder')
          field.blur ->
              if field.val() == placeholder() or field.val() == ''
                  field.addClass('placeholder')
                  field.val placeholder()
          field.blur()
      # don't submit placeholder values
      $('input[placeholder]').parents('form').submit ->
          $(this).find('[placeholder]').each ->
              field = $(this)
              if field.val() == field.attr('placeholder')
                  field.val('')



  window.body_tabs  = []
  $('.tabbed').each ->
      body_tabs.push(new Tabs($(this)))



