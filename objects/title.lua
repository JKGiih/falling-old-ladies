title = {}

function title.initialize()
   local random = love.math.random
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   local titleBlocks = {
      {
         {1, 2, 3, 4, 7, 8, 9, 11, 16, 21, 23, 27, 30, 31},
         {1, 6, 9, 11, 16, 21, 23, 24, 27, 29},
         {1, 2, 3, 4, 6, 7, 8, 9, 11, 16, 21, 23, 25, 27, 29, 31, 32},
         {1, 6, 9, 11, 16, 21, 23, 26, 27, 29, 32},
         {1, 6, 9, 11, 12, 13, 14, 16, 17, 18, 19, 21, 23, 27, 30, 31}
      },
      {
         {2, 3, 4, 7, 12, 13, 14},
         {1, 5, 7, 12, 15},
         {1, 5, 7, 12, 15},
         {1, 5, 7, 12, 15},
         {2, 3, 4, 7, 8, 9, 10, 12, 13, 14}
      },
      {
         {1, 7, 8, 9, 11, 12, 13, 16, 18, 19, 20, 21, 24, 25, 26},
         {1, 6, 9, 11, 14, 16, 18, 23},
         {1, 6, 7, 8, 9, 11, 14, 16, 18, 19, 20, 21, 24, 25},
         {1, 6, 9, 11, 14, 16, 18, 26},
         {1, 2, 3, 4, 6, 9, 11, 12, 13, 16, 18, 19, 20, 21, 23, 24, 25}
      }
   }
   local titleBlockColors = {
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
   for i = 1, getn(titleBlocks) do
      for j = 1, getn(titleBlocks[i]) do
         for k = 1, getn(titleBlocks[i][j]) do
            titleBlockColors[i][j][k] = random(3) + 3 - i
         end
      end
   end
   titleCanvases = {newCanvas(32 * canvasScale, 5 * canvasScale), newCanvas(15 * canvasScale, 5 * canvasScale), newCanvas(26 * canvasScale, 5 * canvasScale)}
   for i = 1, 3 do
      setCanvas(titleCanvases[i])
      titleCanvases[i]:clear()
      for j = 1, 5 do
         for k = 1, getn(titleBlocks[i][j]) do
            setColor(colors[titleBlockColors[i][j][k]])
            rectangle('fill', (titleBlocks[i][j][k] - 1) * canvasScale, (j - 1) * canvasScale, canvasScale, canvasScale)
         end
      end
   end
   setCanvas()
   titleOffsets = {0, -14, -20}
end

function title.update(dt)
   if titleOffsets[1] < screenHeight - 20 then
      titleOffsets[1] = titleOffsets[1] + dt * 20
   elseif titleOffsets[2] < screenHeight - 14 then
      titleOffsets[2] = titleOffsets[2] + dt * 23
   elseif titleOffsets[3] < screenHeight - 8 then
      titleOffsets[3] = titleOffsets[3] + dt * 28
   end
end

function title.draw()
   local lockToGrid = graphics.lockToGridRoundUp
   local draw = love.graphics.draw
   local canvasScale = canvasScale
   local widescreenOffset = widescreenOffset
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   for i = 1, 3 do
      draw(titleCanvases[i], (widescreenOffset + 7 + (i % 2) * 15) * canvasScale, lockToGrid(titleOffsets[i]) * canvasScale, 0, 1, 1)
   end
   love.graphics.pop()
end
