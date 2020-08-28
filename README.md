# Rain
Rain simulation build using Lua programming language and LÖVE 11.3 framework.

## Screenshot
<img src="https://github.com/MatheusCod/Rain/blob/master/screenshot.png" width="350" height="350">

## How to run the program
Instructions on how to run the program can be found at: https://love2d.org/wiki/Getting_Started#Running_Games

## How to use the rain.lua file as a library
1. Put the rain.lua file in the same directory as your main.lua file.
2. In the main.lua:

```
Rain = require 'rain'

function love.load()
  -- Window
  windowWidth = 800
  windowHeight = 600
  love.window.setMode(windowWidth, windowHeight)

  -- Rain variables
  -- deltaX: distance in pixels from the x1 value of a rain line to the x2 value.
  -- deltaY: distance in pixels from the y1 value of a rain line to the y2 value.
  -- rainAmount: amount of rain drops.
  deltaX = 3
  deltaY = 10
  rainAmount = 1000

  -- Instantiate rain
  rain = Rain:new (nil, windowWidth, windowHeight, deltaX, deltaY, rainAmount)

end

function love.update(dt)
  rain:update(dt)
end

function love.draw()
  rain:draw()
end
```

## OBS:
Rain sound is not included within the rain.lua file, it must be used as is in the main.lua file.<br>
You can change the sound file or remove it if you want to.
