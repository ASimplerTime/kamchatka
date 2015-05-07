setLanguage = () ->
  

$(document).ready ->
  $("a[href^=#]").on "click", (e) ->
    e.preventDefault()
    $("html, body").animate scrollTop: $($(this).attr 'href').offset().top , 1000
  # Replace all elements with the data-lang-prop tag with the language.
  langJSON = {};  # Will contain the JSON w/ the strings that will be used.
  # Retrieve language transfer file first.
  $.getJSON "res/lang/lang_s.json", (data_s) ->
    $.getJSON "res/lang/"+data_s["englishUS"], (data_en) ->
      $.each data_en, (index, str) ->
        langJSON[index] = str
      if localStorage.getItem("lang") == null or localStorage.getItem("lang") == undefined
        localStorage.setItem("lang", "englishUS")
      $.getJSON "res/lang/"+data_s[localStorage.getItem("lang")], (data_lang) ->
        $.each data_lang, (index, str) ->
          langJSON[index] = str
      # Get language names in their language
      $.getJSON "res/lang/lang_t.json", (data_t) ->
        $.each data_t, (index, str) ->
          langJSON["LANG"+index] = str
        $("*").each (i) ->
          # Paste the text from the langJSON.
          if $(this).data("lang-name") != undefined
            $(this).text(langJSON[$(this).data("lang-name")] + " (" + langJSON[("LANG"+$(this).data("lang-name"))] + ")")
          else if $(this).data("lang-prop") != undefined
            $(this).html(langJSON[$(this).data("lang-prop")])
  $("#lang-selector").on "change", (e) ->
    lang = $(this).val()
    localStorage.setItem "lang", lang # Store the items
    window.location.reload();   # Reload page.
    
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