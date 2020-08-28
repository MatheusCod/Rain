Rain = require 'rain'

function love.load()
  -- Window
  love.window.setTitle("rain")
  windowWidth = 800
  windowHeight = 600
  love.window.setMode(windowWidth, windowHeight)

  --[[
    Rain variables
      deltaX: distance in pixels from the x1 value of a rain line to the x2
      deltaY: distance in pixels from the y1 value of a rain line to the y2
      rainAmount: amount of rain drops
  ]]--
  deltaX = 3
  deltaY = 10
  rainAmount = 1000

  --Rain sound
  sound = {}
  sound[0] = love.audio.newSource("rain.ogg", "stream")
  sound[1] = love.audio.newSource("rain.ogg", "stream")
  sound[0]:setLooping(true)
  sound[0]:play()
  sound_time = 0

  -- Instantiate rain
  rain = Rain:new (nil, windowWidth, windowHeight, deltaX, deltaY, rainAmount)

end

function love.update(dt)

  -- Rain soud
  sound_time = sound_time + dt
  if sound_time >= 20 then
    sound[1]:setVolume(0.8)
    sound[1]:play()
    sound_time = 0
  end

  -- Rain update
  rain:update(dt)

end

function love.draw()
  -- Rain draw
  rain:draw()
end
