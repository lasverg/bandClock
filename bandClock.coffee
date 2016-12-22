###
Band Clock is a jquery plugin to display a dynamic band clock.

Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.

Built on top of the jQuery library (http://jquery.com)

@source: http://github.com/zaniitiin/band-clock/
@autor: Nitin Jha
@version: 1.0
###

'use strict'

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
            _x = @options.size/2
            @ctx.translate _x, _x
            @ctx.shadowBlur = 2;
            @ctx.shadowColor = @options.color
            @

        degToRed = (degree)->
            factor = Math.PI / 180
            degree * factor

        renderTime = =>
            _x = @options.size/2
            _g = @options.gap
            _r = _x - (@options.lineWidth + 2)
            _r1 = _r - (_g + @options.lineWidth)
            _r2 = _r1 - (_g + @options.lineWidth)
            @ctx.fillStyle = @options.bgColor
            @ctx.fillRect -_x, -_x, @options.size, @options.size
            @ctx.strokeStyle = @options.color
            @ctx.lineWidth = @options.lineWidth
            @ctx.lineCap = @options.lineCap

            now = new Date()
            hours = now.getHours();
            minutes = now.getMinutes();
            seconds = now.getSeconds();
            milliseconds = now.getMilliseconds();
            newSeconds = seconds + (milliseconds / 1000);
            time = now.toLocaleTimeString();

            #Hours
            @ctx.beginPath()
            @ctx.arc(0, 0, _r, degToRed(270), degToRed((hours * 30) - 90))
            @ctx.stroke()
            #Minutes
            @ctx.beginPath()
            @ctx.arc(0, 0, _r1, degToRed(270), degToRed((minutes * 6) - 90))
            @ctx.stroke()
            #Seconds
            @ctx.beginPath()
            @ctx.arc(0, 0, _r2, degToRed(270), degToRed((newSeconds * 6) - 90))
            @ctx.stroke()

            #Time
            @ctx.font = _this.options.fontStyle
            @ctx.fillStyle = _this.options.color
            @ctx.textAlign = "center"
            @ctx.fillText(time, 0, 0)
            @

        setInterval renderTime, 40
        @init()

    $.bandClock.defaultOptions =
        size : 300
        color: '#18FFFF'
        bgColor: '#212121'
        lineWidth: 10
        lineCap: 'butt'
        gap: 5
        fontStyle: '20px Verdana'




    $.fn.bandClock = (options) ->
        $.each @, (i, el) ->
            $el = ($ el)

            unless $el.data 'bandClock'
                instanceOptions = $.extend {}, options , $el.data()
                $el.data 'bandClock', new $.bandClock el, instanceOptions

        undefined
)(jQuery)
