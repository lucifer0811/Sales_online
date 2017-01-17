jQuery(document).on 'turbolinks:load', ->
  ZiggeoApi.Events.on "upload_progress", ( uploaded, total, data ) ->
    $('progress').removeClass('hidden-xs-up').attr 'value', (uploaded / total) * 100
ZiggeoApi.Events.on "submitted", ( data ) -> window.location.href = '/'
