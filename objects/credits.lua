credits = {}

function credits.initialize()
   local random = love.math.random
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   local creditsBlocks = {
      {
         {1, 2, 3, 4, 7, 8, 9, 12, 13, 14},
         {1, 6, 10, 12, 15},
         {1, 2, 3, 4, 6, 10, 12, 13, 14},
         {1, 6, 10, 12, 15},
         {1, 7, 8, 9, 12, 15}
      },
      {
         {1, 2, 3, 7, 8, 9, 11, 15, 17, 19, 21},
         {1, 4, 6, 9, 11, 12, 15, 17, 19, 21},
         {1, 4, 6, 7, 8, 9, 11, 13, 15, 17, 19, 21},
         {1, 4, 6, 9, 11, 14, 15, 17, 19, 21},
         {1, 2, 3, 6, 9, 11, 15, 17, 19, 21, 22, 23, 24}
      },
      {
         {1, 4, 6, 9, 12, 13, 14, 16, 17, 18, 21, 25, 28, 29, 30},
         {1, 3, 6, 9, 11, 14, 16, 19, 21, 22, 24, 25, 27},
         {1, 2, 6, 7, 8, 9, 11, 12, 13, 14, 16, 17, 18, 21, 23, 25, 28, 29},
         {1, 3, 6, 9, 11, 14, 16, 19, 21, 25, 30},
         {1, 4, 6, 9, 11, 14, 16, 19, 21, 25, 27, 28, 29}
      }
   }
   local creditsBlockColors = {
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
   }
   for i = 1, getn(creditsBlocks) do
      for j = 1, getn(creditsBlocks[i]) do
         for k = 1, getn(creditsBlocks[i][j]) do
            creditsBlockColors[i][j][k] = random(3) + 3 - i
         end
      end
   end
   creditsCanvases = {newCanvas(15 * canvasScale, 5 * canvasScale), newCanvas(24 * canvasScale, 5 * canvasScale), newCanvas(30 * canvasScale, 5 * canvasScale)}
   for i = 1, 3 do
      setCanvas(creditsCanvases[i])
      creditsCanvases[i]:clear()
      for j = 1, 5 do
         for k = 1, getn(creditsBlocks[i][j]) do
            setColor(colors[creditsBlockColors[i][j][k]])
            rectangle('fill', (creditsBlocks[i][j][k] - 1) * canvasScale, (j - 1) * canvasScale, canvasScale, canvasScale)
         end
      end
   end
   setCanvas()
   creditsOffsets = {0, -14, -20}
end

function credits.update(dt)
   if creditsOffsets[1] < screenHeight - 30 then
      creditsOffsets[1] = creditsOffsets[1] + dt * 18
   elseif creditsOffsets[2] < screenHeight - 24 then
      creditsOffsets[2] = creditsOffsets[2] + dt * 23
   elseif creditsOffsets[3] < screenHeight - 18 then
      creditsOffsets[3] = creditsOffsets[3] + dt * 28
   end
end

function credits.draw()
   local lockToGrid = graphics.lockToGridRoundUp
   local draw = love.graphics.draw
   local scale = scale
   local widescreenOffset = widescreenOffset
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   for i = 1, 3 do
      draw(creditsCanvases[i], (widescreenOffset + 7 + (i % 2) * 24) * canvasScale, lockToGrid(creditsOffsets[i]) * canvasScale, 0, 1, 1)
   end
   love.graphics.pop() 
end
