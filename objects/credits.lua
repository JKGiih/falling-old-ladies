credits = {}

function credits.initialize()
   local random = love.math.random
   local getn = table.getn
   creditsFor = {
      {1, 2, 3, 4, 7, 8, 9, 12, 13, 14},
      {1, 6, 10, 12, 15},
      {1, 2, 3, 4, 6, 10, 12, 13, 14},
      {1, 6, 10, 12, 15},
      {1, 7, 8, 9, 12, 15}
   }
   creditsForColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(creditsFor) do
      for j = 1, getn(creditsFor[i]) do
         creditsForColors[i][j] = random(3) + 2
      end
   end
   creditsDaniil = {
      {1, 2, 3, 7, 8, 9, 11, 15, 17, 19, 21},
      {1, 4, 6, 9, 11, 12, 15, 17, 19, 21},
      {1, 4, 6, 7, 8, 9, 11, 13, 15, 17, 19, 21},
      {1, 4, 6, 9, 11, 14, 15, 17, 19, 21},
      {1, 2, 3, 6, 9, 11, 15, 17, 19, 21, 22, 23, 24}
   }
   creditsDaniilColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(creditsDaniil) do
      for j = 1, getn(creditsDaniil[i]) do
         creditsDaniilColors[i][j] = random(3) + 1
      end
   end
   creditsKharms = {
      {1, 4, 6, 9, 12, 13, 14, 16, 17, 18, 21, 25, 28, 29, 30},
      {1, 3, 6, 9, 11, 14, 16, 19, 21, 22, 24, 25, 27},
      {1, 2, 6, 7, 8, 9, 11, 12, 13, 14, 16, 17, 18, 21, 23, 25, 28, 29},
      {1, 3, 6, 9, 11, 14, 16, 19, 21, 25, 30},
      {1, 4, 6, 9, 11, 14, 16, 19, 21, 25, 27, 28, 29}
   }
   creditsKharmsColors = {
      {},
      {},
      {},
      {},
      {}
   }
   for i = 1, getn(creditsKharms) do
      for j = 1, getn(creditsKharms[i]) do
         creditsKharmsColors[i][j] = random(3)
      end
   end
   creditsForOffset = 0
   creditsDaniilOffset = -14
   creditsKharmsOffset = -20
end

function credits.update(dt)
   if creditsForOffset < screenHeight - 18 then
      creditsForOffset = creditsForOffset + dt * 18
   elseif creditsDaniilOffset < screenHeight - 30 then
      creditsDaniilOffset = creditsDaniilOffset + dt * 23
   elseif creditsKharmsOffset < screenHeight - 24 then
      creditsKharmsOffset = creditsKharmsOffset + dt * 28
   end
end

function credits.draw()
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local lockToGrid = graphics.lockToGridRoundUp
   local scale = scale
   local halfScale = halfScale
   local widescreenOffset = widescreenOffset
   local creditsForOffset = lockToGrid(creditsForOffset)
   local creditsDaniilOffset = lockToGrid(creditsDaniilOffset)
   local creditsKharmsOffset = lockToGrid(creditsKharmsOffset)
   for i = 1, getn(creditsFor) do
      for j = 1, getn(creditsFor[i]) do
         setColor(colors[creditsForColors[i][j]])
         rectangle("fill", (creditsFor[i][j] + 60) * halfScale + widescreenOffset * scale, (creditsForOffset + i) * halfScale, halfScale, halfScale)
      end
   end
   for i = 1, getn(creditsDaniil) do
      for j = 1, getn(creditsDaniil[i]) do
         setColor(colors[creditsDaniilColors[i][j]])
         rectangle("fill", (creditsDaniil[i][j] + 37 + widescreenOffset) * scale, (creditsDaniilOffset + i) * scale, scale, scale)
      end
   end
   for i = 1, getn(creditsKharms) do
      for j = 1, getn(creditsKharms[i]) do
         setColor(colors[creditsKharmsColors[i][j]])
         rectangle("fill", (creditsKharms[i][j] + 6 + widescreenOffset) * scale, (creditsKharmsOffset + i) * scale, scale, scale)
      end
   end
end
