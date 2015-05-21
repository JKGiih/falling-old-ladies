background = {}

function background.initialize()
   local random = love.math.random
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   love.graphics.setBackgroundColor(colors[5])
   canvas1 = newCanvas(32 * canvasScale, 32 * canvasScale)
   canvas2 = newCanvas(32 * canvasScale, 32 * canvasScale)
   canvas3 = newCanvas(16 * canvasScale, 16 * canvasScale)
   setCanvas(canvas1)
      canvas1:clear()
      -- building wall
      for i = 1, 32 do
         for j = 1, 32 do
            setColor(colors[random(3) + 7])
            rectangle('fill', (i - 1) * canvasScale, (j - 1) * canvasScale, 1 * canvasScale, 1 * canvasScale)
         end
      end
      -- windowpanes
      setColor(colors[15])
      rectangle('fill', 3 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 13 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 23 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 3 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      rectangle('fill', 13 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      rectangle('fill', 23 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      -- windows
      setColor(colors[14])
      rectangle('fill', 4 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 14 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 24 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 4 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)
      rectangle('fill', 14 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)
      rectangle('fill', 24 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)

   setCanvas(canvas2)
      canvas2:clear()
      -- building wall
      for i = 1, 32 do
         for j = 1, 32 do
            setColor(colors[random(3) + 7])
            rectangle('fill', (i - 1) * canvasScale, (j - 1) * canvasScale, 1 * canvasScale, 1 * canvasScale)
         end
      end
      -- windowpanes
      setColor(colors[15])
      rectangle('fill', 1 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 11 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 21 * canvasScale, 1 * canvasScale, 8 * canvasScale, 16 * canvasScale)
      rectangle('fill', 1 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      rectangle('fill', 11 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      rectangle('fill', 21 * canvasScale, 20 * canvasScale, 8 * canvasScale, 12 * canvasScale)
      -- windows
      setColor(colors[14])
      rectangle('fill', 2 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 12 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 22 * canvasScale, 2 * canvasScale, 6 * canvasScale, 14 * canvasScale)
      rectangle('fill', 2 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)
      rectangle('fill', 12 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)
      rectangle('fill', 22 * canvasScale, 21 * canvasScale, 6 * canvasScale, 10 * canvasScale)

   setCanvas(canvas3)
      canvas3:clear()
      -- building wall
      for i = 1, 16 do
         for j = 1, 3 do
            setColor(colors[random(3) + 7])
            rectangle('fill', (i - 1) * canvasScale, (j - 1) * canvasScale, 1 * canvasScale, 1 * canvasScale)
         end
      end
	   for i = 1, 16 do
         for j = 4, 16 do
            setColor(colors[random(3) + 10])
            rectangle('fill', (i - 1) * canvasScale, (j - 1) * canvasScale, 1 * canvasScale, 1 * canvasScale)
         end
      end
   setCanvas()
end

function background.draw()
   local draw = love.graphics.draw
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   draw(canvas1, widescreenOffset * canvasScale, 0, 0, 1, 1)
   draw(canvas2, (widescreenOffset + 32) * canvasScale, 0, 0, 1, 1)
   draw(canvas3, widescreenOffset * canvasScale, 32 * canvasScale, 0, 1, 1)
   draw(canvas3, (widescreenOffset + 16) * canvasScale, 32 * canvasScale, 0, 1, 1)
   draw(canvas3, (widescreenOffset + 32) * canvasScale, 32 * canvasScale, 0, 1, 1)
   draw(canvas3, (widescreenOffset + 48) * canvasScale, 32 * canvasScale, 0, 1, 1)
   love.graphics.pop()
end
