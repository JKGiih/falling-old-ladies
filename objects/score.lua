score = {}

function score.initialize()
   local random = love.math.random
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   ladiesDodged = 0
   local numberBlocks = {
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
   local numberBlockColors = {
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
   scoreCanvases = {newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale), newCanvas(4 * canvasScale, 5 * canvasScale)}         
   for i = 1, 10 do
      setCanvas(scoreCanvases[i])
      scoreCanvases[i]:clear()
      for j = 1, 5 do
         for k = 1, getn(numberBlocks[i][j]) do
            setColor(colors[numberBlockColors[i][j][k]])
            rectangle('fill', (numberBlocks[i][j][k] - 1) * canvasScale, (j - 1) * canvasScale, canvasScale, canvasScale)
         end
      end
   end
   setCanvas()
end

function score.increment()
   ladiesDodged = ladiesDodged + 1
   if ladiesDodged >= 100000 then ladiesDodged = 0 end
end

function score.draw()
   local draw = love.graphics.draw
   local scale = scale
   local widescreenOffset = widescreenOffset
   local ladiesDodged = ladiesDodged
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   -- ones
   draw(scoreCanvases[ladiesDodged % 10 + 1], (widescreenOffset + 40) * canvasScale, 2 * canvasScale, 0, 1, 1)
   -- tens
   draw(scoreCanvases[(ladiesDodged - ladiesDodged % 10) / 10 % 10 + 1], (widescreenOffset + 35) * canvasScale, 2 * canvasScale, 0, 1, 1)
   -- hundreds
   draw(scoreCanvases[(ladiesDodged - ladiesDodged % 100) / 100 % 10 + 1], (widescreenOffset + 30) * canvasScale, 2 * canvasScale, 0, 1, 1)
   -- thousands
   draw(scoreCanvases[(ladiesDodged - ladiesDodged % 1000) / 1000 % 10 + 1], (widescreenOffset + 25) * canvasScale, 2 * canvasScale, 0, 1, 1)
   -- tens of thousands
   draw(scoreCanvases[(ladiesDodged - ladiesDodged % 10000) / 10000 % 10 + 1], (widescreenOffset + 20) * canvasScale, 2 * canvasScale, 0, 1, 1)
         
   love.graphics.pop()
end
