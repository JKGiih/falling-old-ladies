title = {}

function title.initialize()
   local random = love.math.random
   local getn = table.getn
   titleFalling = {
      {5, 6, 7, 8, 11, 12, 13, 15, 20, 25, 27, 31, 34, 35},
      {5, 10, 13, 15, 20, 25, 27, 28, 31, 33},
      {5, 6, 7, 8, 10, 11, 12, 13, 15, 20, 25, 27, 29, 31, 33, 35, 36},
      {5, 10, 13, 15, 20, 25, 27, 30, 31, 33, 36},
      {5, 10, 13, 15, 16, 17, 18, 20, 21, 22, 23, 25, 27, 31, 34, 35}
   }
   titleFallingColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(titleFalling) do
      for j = 1, getn(titleFalling[i]) do
         titleFallingColors[i][j] = random(3) + 2
      end
   end
   titleOld = {
      {39, 40, 41, 44, 49, 50, 51},
      {38, 42, 44, 49, 52},
      {38, 42, 44, 49, 52},
      {38, 42, 44, 49, 52},
      {39, 40, 41, 44, 45, 46, 47, 49, 50, 51}
   }
   titleOldColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(titleOld) do
      for j = 1, getn(titleOld[i]) do
         titleOldColors[i][j] = random(3) + 1
      end
   end
   titleLadies = {
      {11, 17, 18, 19, 21, 22, 23, 26, 28, 29, 30, 31, 34, 35, 36},
      {11, 16, 19, 21, 24, 26, 28, 33},
      {11, 16, 17, 18, 19, 21, 24, 26, 28, 29, 30, 31, 34, 35},
      {11, 16, 19, 21, 24, 26, 28, 36},
      {11, 12, 13, 14, 16, 19, 21, 22, 23, 26, 28, 29, 30, 31, 33, 34, 35}
   }
   titleLadiesColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(titleLadies) do
      for j = 1, getn(titleLadies[i]) do
         titleLadiesColors[i][j] = random(3)
      end
   end
   titleFallingOffset = 0
   titleOldOffset = -14
   titleLadiesOffset = -20
end

function title.update(dt)
   if titleFallingOffset < screenHeight - 20 then
      titleFallingOffset = titleFallingOffset + dt * 20
   elseif titleOldOffset < screenHeight - 14 then
      titleOldOffset = titleOldOffset + dt * 23
   elseif titleLadiesOffset < screenHeight - 9 then
      titleLadiesOffset = titleLadiesOffset + dt * 28
   end
end

function title.draw()
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local lockToGrid = graphics.lockToGridRoundUp
   local titleFallingOffset = lockToGrid(titleFallingOffset)
   local titleOldOffset = lockToGrid(titleOldOffset)
   local titleLadiesOffset = lockToGrid(titleLadiesOffset)
   local scale = scale
   local widescreenOffset = widescreenOffset
   for i = 1, getn(titleFalling) do
      for j = 1, getn(titleFalling[i]) do
         setColor(colors[titleFallingColors[i][j]])
         rectangle("fill", (titleFalling[i][j] + widescreenOffset) * scale, (titleFallingOffset + i) * scale, scale, scale)
      end
   end
   for i = 1, getn(titleOld) do
      for j = 1, getn(titleOld[i]) do
         setColor(colors[titleOldColors[i][j]])
         rectangle("fill", (titleOld[i][j] + widescreenOffset) * scale, (titleOldOffset + i) * scale, scale, scale)
      end
   end
   for i = 1, getn(titleLadies) do
      for j = 1, getn(titleLadies[i]) do
         setColor(colors[titleLadiesColors[i][j]])
         rectangle("fill", (titleLadies[i][j] + widescreenOffset) * scale, (titleLadiesOffset + i) * scale, scale, scale)
      end
   end
end
