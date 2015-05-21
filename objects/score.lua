score = {}

function score.initialize()
   local random = love.math.random
   local getn = table.getn
   ladiesDodged = 0
   numberBlocks = {
      {
         {2, 3},
         {1, 4},
         {1, 4},
         {1, 4},
         {2, 3}
      },
      {
         {3},
         {3},
         {3},
         {3},
         {3}
      },
      {
         {1, 2, 3},
         {4},
         {2, 3},
         {1},
         {1, 2, 3, 4}
      },
      {
         {2, 3},
         {1, 4},
         {3},
         {1, 4},
         {2, 3}
      },
      {
         {1, 4},
         {1, 4},
         {1, 2, 3, 4},
         {4},
         {4}
      },
      {
         {1, 2, 3, 4},
         {1},
         {1, 2, 3},
         {4},
         {1, 2, 3}
      },
      {
         {2, 3, 4},
         {1},
         {1, 2, 3},
         {1, 4},
         {2, 3}
      },
      {
         {1, 2, 3, 4},
         {4},
         {3},
         {2},
         {1}
      },
      {
         {2, 3},
         {1, 4},
         {2, 3},
         {1, 4},
         {2, 3}
      },
      {
         {2, 3},
         {1, 4},
         {2, 3, 4},
         {4},
         {2, 3}
      }
   }
   numberBlockColors = {
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
   for i = 1, getn(numberBlocks) do
      for j = 1, getn(numberBlocks[i]) do
         for k = 1, getn(numberBlocks[i][j]) do
            numberBlockColors[i][j][k] = random(4)
         end
      end
   end
end

function score.increment()
   ladiesDodged = ladiesDodged + 1
   if ladiesDodged >= 100000 then ladiesDodged = 0 end
end

function score.draw()
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local scale = scale
   local halfScale = halfScale
   local widescreenOffset = widescreenOffset
   local screenWidth = screenWidth
   local ladiesDodged = ladiesDodged
   -- print ones
   for i = 1, 5 do
      for j = 1, getn(numberBlocks[ladiesDodged % 10 + 1][i]) do
         setColor(colors[numberBlockColors[ladiesDodged % 10 + 1][i][j]])
         rectangle('fill', (numberBlocks[ladiesDodged % 10 + 1][i][j] + screenWidth + 7) * halfScale + widescreenOffset * scale, i * halfScale + scale * 2, halfScale, halfScale)
      end
   end
   -- print tens
   for i = 1, 5 do
      for j = 1, getn(numberBlocks[(ladiesDodged - ladiesDodged % 10) / 10 % 10 + 1][i]) do
         setColor(colors[numberBlockColors[(ladiesDodged - ladiesDodged % 10) / 10 % 10 + 1][i][j]])
         rectangle('fill', (numberBlocks[(ladiesDodged - ladiesDodged % 10) / 10 % 10 + 1][i][j] + screenWidth + 2) * halfScale + widescreenOffset * scale, i * halfScale + scale * 2, halfScale, halfScale)
      end
   end
   -- print hundreds
   for i = 1, 5 do
      for j = 1, getn(numberBlocks[(ladiesDodged - ladiesDodged % 100) / 100 % 10 + 1][i]) do
         setColor(colors[numberBlockColors[(ladiesDodged - ladiesDodged % 100) / 100 % 10 + 1][i][j]])
         rectangle('fill', (numberBlocks[(ladiesDodged - ladiesDodged % 100) / 100 % 10 + 1][i][j] + screenWidth - 3) * halfScale + widescreenOffset * scale, i * halfScale + scale * 2, halfScale, halfScale)
      end
   end
   -- print thousands
   for i = 1, 5 do
      for j = 1, getn(numberBlocks[(ladiesDodged - ladiesDodged % 1000) / 1000 % 10 + 1][i]) do
         setColor(colors[numberBlockColors[(ladiesDodged - ladiesDodged % 1000) / 1000 % 10 + 1][i][j]])
         rectangle('fill', (numberBlocks[(ladiesDodged - ladiesDodged % 1000) / 1000 % 10 + 1][i][j] + screenWidth - 8) * halfScale + widescreenOffset * scale, i * halfScale + scale * 2, halfScale, halfScale)
      end
   end
   -- print tens of thousands
   for i = 1, 5 do
      for j = 1, getn(numberBlocks[(ladiesDodged - ladiesDodged % 10000) / 10000 % 10 + 1][i]) do
         setColor(colors[numberBlockColors[(ladiesDodged - ladiesDodged % 10000) / 10000 % 10 + 1][i][j]])
         rectangle('fill', (numberBlocks[(ladiesDodged - ladiesDodged % 10000) / 10000 % 10 + 1][i][j] + screenWidth - 13) * halfScale + widescreenOffset * scale, i * halfScale + scale * 2, halfScale, halfScale)
      end
   end
end
