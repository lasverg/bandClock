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
  #Main Funciton

  $.bandClock = (el, options) ->
    # body...
    _this = this
    #*** GETTING CLOCK ON DISPLAY ***//

    degToRed = (degree) ->
      factor = Math.PI / 180
      degree * factor

    renderTime = ->
      _this.ctx.fillStyle = _this.options.bgColor
      _this.ctx.fillRect -_x, -_x, _this.options.size, _this.options.size
      _this.ctx.strokeStyle = _this.options.color
      _this.ctx.lineWidth = _this.options.bandWidth
      _this.ctx.lineCap = _this.options.lineCap
      # _this.ctx.shadowBlur = 2;
      # _this.ctx.shadowColor = _this.options.color;
      now = new Date
      hours = now.getHours()
      minutes = now.getMinutes()
      seconds = now.getSeconds()
      milliseconds = now.getMilliseconds()
      newSeconds = seconds + milliseconds / 1000
      time = now.toLocaleTimeString()
      #HOURS
      _this.ctx.beginPath()
      _this.ctx.arc 0, 0, _r, degToRed(270), degToRed(hours * 30 - 90)
      _this.ctx.stroke()
      #Minutes
      _this.ctx.beginPath()
      _this.ctx.arc 0, 0, _r1, degToRed(270), degToRed(minutes * 6 - 90)
      _this.ctx.stroke()
      #Seconds
      _this.ctx.beginPath()
      _this.ctx.arc 0, 0, _r2, degToRed(270), degToRed(newSeconds * 6 - 90)
      _this.ctx.stroke()
      #Time
      _this.ctx.font = _this.options.fontStyle
      _this.ctx.fillStyle = _this.options.color
      _this.ctx.textAlign = 'center'
      _this.ctx.fillText time, 0, 0
      return

    @el = el
    @$el = $(el)
    @$el.data 'bandclock', this

    @init = ->
      percent = undefined
      scaleBy = undefined
      _this.options = $.extend({}, $.bandClock.defaultOptions, options)
      #create canvas element and set the origin to center
      _this.canvas = $('<canvas width=\'' + _this.options.size + '\' height=\'' + _this.options.size + '\'></canvas>').get(0)
      _this.$el.append _this.canvas
      _this.ctx = _this.canvas.getContext('2d')
      if window.devicePixelRatio > 1
        scaleBy = window.devicePixelRatio
        $(_this.canvas).css
          width: _this.options.size
          height: _this.options.size
        _this.canvas.width *= scaleBy
        _this.canvas.height *= scaleBy
        _this.ctx.scale scaleBy, scaleBy
      _this.$el.addClass 'bandClock'
      _this.$el.css
        width: _this.options.size
        height: _this.options.size
        lineHeight: '' + _this.options.size + 'px'
      _x = _this.options.size / 2
      _this.ctx.translate _x, _x
      _this.ctx.shadowBlur = 2
      _this.ctx.shadowColor = _this.options.color
      _g = _this.options.bandspacing
      _r = _x - (0 + _this.options.bandWidth)
      _r1 = _r - (_g + _this.options.bandWidth)
      _r2 = _r1 - (_g + _this.options.bandWidth)
      _this

    setInterval renderTime, 40
    @init()

  #Default Values
  $.bandClock.defaultOptions =
    size: 300
    bgColor: '#212121'
    color: '#18FFFF'
    bandWidth: 10
    lineCap: 'butt'
    bandspacing: 7
    fontStyle: '20px Verdana'
  #Calling Main Funciton to Plugin Funciton

  $.fn.bandClock = (options) ->
    $.each this, (i, el) ->
      $el = undefined
      instanceOptions = undefined
      $el = $(el)
      if !$el.data('bandClock')
        instanceOptions = $.extend({}, options, $el.data())
        return $el.data('bandClock', new ($.bandClock)(el, instanceOptions))
      return

  undefined
) jQuery
