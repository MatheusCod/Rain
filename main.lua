function love.load()
  -- Window
  love.window.setTitle("Rain")
  windowWidth = 800
  windowHeight = 600
  love.window.setMode(windowWidth, windowHeight)

  sound = {}
  sound[0] = love.audio.newSource("rain.ogg", "stream")
  sound[1] = love.audio.newSource("rain.ogg", "stream")
  sound[0]:setLooping(true)
  sound[0]:play()
  sound_time = 0

  deltaX = 3
  deltaY = 10

  rain = {}
  drops = {}
  numberRain = 1000

  for i=1,numberRain do
    rain[i] = {}
    drops[i] = {}
    var = love.math.random(1, 5)
    rain[i].deltaX = deltaX * var
    rain[i].deltaY = deltaY * var
    rain[i].x1 = love.math.random(-500, windowWidth)
    rain[i].y1 = love.math.random(-500, -50)
    rain[i].x2 = rain[i].x1 + rain[i].deltaX
    rain[i].y2 = rain[i].y1 + rain[i].deltaY
    rain[i].speed = love.math.random(500, 1000)
    rain[i].lenght = ((rain[i].x2 - rain[i].x1)^2 + (rain[i].y2 - rain[i].y1)^2)^0.5
    rain[i].sin = (rain[i].y2 - rain[i].y1)/rain[i].lenght
    rain[i].cos = (rain[i].x2 - rain[i].x1)/rain[i].lenght
    rain[i].color = love.math.random(1,10)/10
    rain[i].limit = windowHeight - windowHeight/(love.math.random(4, 20))

    drops[i].radius = 1
  end

  font = love.graphics.newFont(40)
  string = ""

end

function love.update(dt)

  sound_time = sound_time + dt
  if sound_time >= 20 then
    sound[1]:setVolume(0.8)
    sound[1]:play()
    sound_time = 0
  end

  for i=1,numberRain do
    rain[i].x1 = rain[i].x1 + rain[i].cos * rain[i].speed * dt
    rain[i].y1 = rain[i].y1 + rain[i].sin * rain[i].speed * dt
    rain[i].x2 = rain[i].x2 + rain[i].cos * rain[i].speed * dt
    rain[i].y2 = rain[i].y2 + rain[i].sin * rain[i].speed * dt

    if (rain[i].y1 >= rain[i].limit) then
      rain[i].x2 = rain[i].x2 - rain[i].cos * rain[i].speed * dt
      rain[i].y2 = rain[i].y2 - rain[i].sin * rain[i].speed * dt

      if rain[i].y2 <= rain[i].y1 then
        drops[i].x = rain[i].x2
        drops[i].y = rain[i].y2
        drops[i].thing = true
        drops[i].radius = 1
        rain[i].x1 = love.math.random(-500, windowWidth)
        rain[i].y1 = love.math.random(-500, -50)
        rain[i].x2 = rain[i].x1 + rain[i].deltaX
        rain[i].y2 = rain[i].y1 + rain[i].deltaY
      end
    end

    if drops[i].thing then
      drops[i].radius = drops[i].radius + 0.5
      if drops[i].radius >= 10 then
        drops[i].thing = false
      end
    end

  end

  --string = tostring(1/dt)
  --string = tostring(sound_time)

end

function love.draw()

  for i=1,numberRain do
    love.graphics.setColor(rain[i].color, rain[i].color, rain[i].color)
    love.graphics.line(rain[i].x1, rain[i].y1, rain[i].x2, rain[i].y2)

    if drops[i].thing then
      love.graphics.setColor(0.3, 0.3, 0.3)
      love.graphics.ellipse("line", drops[i].x, drops[i].y, drops[i].radius, drops[i].radius/2)
    end
  end

  love.graphics.setColor(1, 1, 1)
  love.graphics.setFont(font)
  --love.graphics.print(string, 100, 100)

end
