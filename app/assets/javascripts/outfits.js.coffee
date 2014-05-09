# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#new_outfit').submit (event) ->
    event.preventDefault
    image = $('canvas')[0].toDataURL()
    console.log image
    $('#image_data').attr 'value', image

  navigator.getUserMedia = navigator.getUserMedia ||
                            navigator.webkitGetUserMedia ||
                            navigator.mozGetUserMedia ||
                            navigator.msGetUserMedia

  navigator.getUserMedia(
    video: true,
    (stream) ->
      video = $('#feed')[0]
      video.src = window.URL.createObjectURL(stream)
      video.play()
      true
    , (err) ->
      console.log err
  )

  $('#take-photo').click ->
    console.log 'clicked...'
    video = $('#feed')[0]
    canvas = $('#canvas-pic')[0]
    canvas.width = video.videoWidth
    console.log video.videoWidth
    canvas.height = video.videoHeight
    console.log video.videoHeight

    canvas.getContext('2d').drawImage(video, 0, 0)
    true
