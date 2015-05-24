graphics = {}

function graphics.initialize()
   screenWidth, screenHeight = 64, 48
   defaultWidth, defaultHeight = love.window.getDimensions()
   graphics.calculateScale()
   canvasScale = 16
   love.graphics.setBlendMode("alpha")
   colors = {
      {240, 240, 230},
      {238, 223, 204},
      {226, 209, 194},
      {205, 192, 176},
      {205, 175, 149},
      {202, 102, 29},
      {139, 131, 120},
      {139, 119, 101},
      {139, 69, 19},
      {107, 66, 38},
      {92, 64, 51},
      {92, 51, 23},
      {48, 32, 19},
      {41, 36, 33},
      {24, 16, 9},
      {0, 0, 0, 80}
   }
end

function graphics.toggleFullscreen()
   love.window.setFullscreen(not love.window.getFullscreen(), "desktop")
   graphics.calculateScale()
end

function graphics.calculateScale()
   if love.window.getFullscreen() then
      scale = love.window.getHeight() / screenHeight
      widescreenOffset = (love.window.getWidth() / scale - screenWidth) / 2
   else
      scale = defaultHeight / screenHeight
      widescreenOffset = 0
   end
   halfScale = scale / 2
end

function graphics.lockToGrid(coordinate)
   local correction = coordinate % 1
   if correction < 0.5 then
      return coordinate - correction
   else
      return coordinate - correction + 1
   end 
end

function graphics.lockToGridRoundUp(coordinate)
   return coordinate - coordinate % 1
end
