# BandClock

> Lightweight plugin to render simple, retina optimized dynamic clock

## Freature
![](https://raw.githubusercontent.com/zaniitiin/bandClock/master/example/demo.png)


* Highly customizable
* Very easy to you
* Works in all modern browsers

#### Framework support

* jQuery plugin (~921 bytes)

## Get Started

To use the band clock plugin you need to load the current version of jQuery (> 1.6.4)

##Install with Bower
You can also install and manage BandClock using Bower:
```html
$ bower install bandClock
```

```html
<div class="clock"></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="/path/to/bandClock.js"></script>
<script>
  $(function () {
    $(.clock).bandClock({
      // your options goes here
    });
  })
</script>
```
## Options
You can pass these options to set a custom look and feel for the plugin.
<table>
  <tr>
    <th>Property</th>
    <th>Default</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><strong>size</strong></td>
    <td>300</td>
    <td>Size of the clock in px. It will always be in a .</td>
  </tr>
  <tr>
    <td><strong>color</strong></td>
    <td>#18FFFF</td>
    <td>The color of circular band of clock. You can either pass a valid css color string.</td>
  </tr>
  <tr>
    <td><strong>bgColor</strong></td>
    <td>#212121</td>
    <td>The background color for disable rendering.</td>
  </tr>
  <tr>
    <td><strong>lineWidth</strong></td>
    <td>10</td>
    <td>Thickness of circular band line in px.</td>
  </tr>
  <tr>
    <td><strong>lineCap</strong></td>
    <td>butt</td>
    <td>defines how the edge of the band line looks like,. posible values are : <code>butt</code>, <code>round</code> and <code>square</code> </td>
  </tr>
  <tr>
    <td><strong>gap</strong></td>
    <td>5</td>
    <td>Distance between band line of hours, minutes, seconds in px.</td>
  </tr>
  <tr>
    <td><strong>fontStyle</strong></td>
    <td>20 Verdana</td>
    <td>Defines font-size and font-family of the center time display</td>
  </tr>
</table>

## Test
To run the test just use the karma adapter of grunt: `grunt test`

## Browser Support
Native support

* Chrome
* Safari
* FireFox
* Opera
* Internet Explorer 9+

## Copyright
Copyright (c) 2015 Nitin Jha, contributors. Released under the MIT, GPL licenses.
