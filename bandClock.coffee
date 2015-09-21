###
Band Clock is a jquery plugin to display a dynamic band clock.

Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.

Built on top of the jQuery library (http://jquery.com)

@source: http://github.com/zaniitiin/band-clock/
@autor: Nitin Jha
@version: 1.0
###
(($) ->
  $.bandClock = (el, options) ->

    @el = el
    @$el = $ el
    @$el.data 'bandClock', @

    @init = =>
      @options = $.extend {}, $.bandClock.defaultOptions, options

      #creating canvas element
      @canvas = $("<canvas width='#{@options.size}' height='#{@options.size}'
      ></canvas>").get(0)
      @$el.append @canvas
      @ctx = @canvas.getContext('2d')

      if window.devicePixelRatio > 1
        scaleBy = window.devicePixelRatio
        $(@canvas).css({
          width: @options.size
          height: @options.size
          })
        @canvas.width *= scaleBy
        @canvas.height *= scaleBy
        @ctx.scale scaleBy, scaleBy

      @$el.addClass 'bandClock'
      @$el.css({
        width: @options.size
        height: @options.size
        lineHeight: "#{@options.size}px"
        })
      @ctx.fillStyle = @options.backgroundColor
      @ctx.fillRect 0, 0, @options.size, @options.size

      @
    @init()

  $.bandClock.defaultOptions =
      size: 300
      backgroundColor: 'rgba(0,0,0, 0.2)'



  $.fn.bandClock = (options) ->
      $.each @, (i, el) ->
        $el = ($ el)

        unless $el.data 'bandClock'
          instanceOptions = $.extend {}, options , $el.data()
          $el.data 'bandClock', new $.bandClock el, instanceOptions

    undefined
)(jQuery)
