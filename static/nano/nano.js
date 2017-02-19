var loadJSONP = (function loadJSONP_outer( window, document, undefined ) { var uuid, head, main_script
  uuid = 0
  head = document.head || document.getElementsByTagName( 'head' )[0]
  main_script = document.createElement( 'script' )
  main_script.type = 'text/javascript'

  return function loadJSONP_inner( url, callback, context ) { var name, script
    // INIT
    name = '__jsonp_' + uuid++
    if ( url.match(/\?/) )
      url += '&callback=' + name
    else
      url += '?callback=' + name

    // Create script
    script = main_script.cloneNode()
    script.src = url

    // Setup handler
    window[name] = function( data ) {
      callback.call( ( context || window ), data )
      head.removeChild( script )
      script = null
      delete window[name]
    }

    // Load JSON
    head.appendChild( script )
  }
})( window, document );
