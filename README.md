# Rain
Rain simulation build using Lua programming language and LÖVE 11.3 framework.

## Screenshot
<img src="https://github.com/MatheusCod/Rain/blob/master/screenshot.png" width="400" height="400">

## How to run the program
Instructions on how to run the program can be found at: https://love2d.org/wiki/Getting_Started#Running_Games

## How to use the rain.lua file as a library
1. Put the rain.lua file in the same directory as your main.lua file
2. In the main.lua:
<code>
Rain = require 'rain'<br>
<br>
function love.load()<br>
  -- Window<br>
  windowWidth = 800<br>
  windowHeight = 600<br>
  love.window.setMode(windowWidth, windowHeight)<br>
  <br>
  -- Rain variables<br>
  -- deltaX: distance in pixels from the x1 value of a rain line to the x2<br>
  -- deltaY: distance in pixels from the y1 value of a rain line to the y2<br>
  -- rainAmount: amount of rain drops<br>
  deltaX = 3<br>
  deltaY = 10<br>
  rainAmount = 1000<br>
  <br>
  -- Instantiate rain<br>
  rain = Rain:new (nil, windowWidth, windowHeight, deltaX, deltaY, rainAmount)<br>
  <br>
end<br>
<br>
function love.update(dt)<br>
  rain:update(dt)<br>
end<br>
<br>
function love.draw()<br>
  rain:draw()<br>
end<br>
</code>

## OBS:
Rain sound is not included within the rain.lua file, it must be used as is in the main.lua file.<br>
You can change the sound file or remove it if you want to.
