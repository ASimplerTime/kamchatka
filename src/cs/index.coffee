$(document).ready ->
  $("#background").animate 'opacity': 0.6, 6000
  $("a[href^=#]").on "click", (e) ->
    e.preventDefault()
    $("html, body").animate scrollTop: $($(this).attr 'href').offset().top , 1000

$(window).scroll ->
  ratio = ($(document).scrollTop()/window.innerHeight)
  if (8-(6*ratio)) > 2
    $(".start-cover").css
      'background-color': "rgba(0, 0, 0, 0)",
      'padding': "#{2*ratio}em 0",
      'text-align': 'center'
    $(".start-cover *").css
      'text-align': 'center'
    $(".start-cover .start-menu").css
      'display': 'block',
      'margin-top': "#{0-(16*ratio)}%",
      'opacity': "#{1-(2*ratio)}"
    $(".start-cover a").css
      'display': 'inline',
      'margin': '0'
    $(".start-cover .button-start").css
      'display': 'inline-block',
      'margin': '0',
      'margin-bottom': '1em'
    $(".start-cover br").css
      'display': 'inline'
    $(".start-cover h1").css
      'display': 'inline-block',
      'font-size': "#{8-(4*ratio)}em",
      'margin-left': '0',
      'margin-right': '0',
      'margin-top': "#{25-(25*ratio)}vh"
  else
    $(".start-cover").css
      'background-color': 'rgba(0, 0, 0, 0.6)',
      'padding': '2em 0',
      'text-align': 'left'
    $(".start-cover .start-menu").css
      'display': 'inline-block',
      'margin-top': "0",
      'opacity': '1'
    $(".start-cover a").css
      'display': 'inline',
      'margin': '0 2em'
    $(".start-cover .button-start").css
      'display': 'inline',
      'margin': '0 1em'
    $(".start-cover br").css
      'display': 'none'
    $(".start-cover h1").css
      'display': 'inline',
      'font-size': '2em',
      'margin-left': '1em',
      'margin-right': '1em',
      'margin-top': "0",
      'text-align': 'left'