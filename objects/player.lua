player = {}

function player.initialize()
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   playerWidth = 6
   playerHeight = 8
   playerX = screenWidth / 2 - playerWidth / 2
   playerY = screenHeight - 10
   playerCanvas = love.graphics.newCanvas(playerWidth * canvasScale, playerHeight * canvasScale)
   setCanvas(playerCanvas)
   playerCanvas:clear()
   setColor(colors[7])
   rectangle('fill', canvasScale, 0, 4 * canvasScale, canvasScale)
   rectangle('fill', 0, canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, canvasScale, canvasScale)
   rectangle('fill', 4 * canvasScale, 7 * canvasScale, canvasScale, canvasScale)
   setColor(colors[4])
   rectangle('fill', canvasScale, 3 * canvasScale, 4 * canvasScale, canvasScale)
   rectangle('fill', 0, 4 * canvasScale, 6 * canvasScale, 3 * canvasScale)
   setCanvas()
end

function player.update(dt)
   local isDown = love.keyboard.isDown
   local playerDirection = nil
   if table.getn(gamepads) >= 1 then
      for i = 1, table.getn(gamepads) do
         if gamepads[i]:isGamepadDown("dpleft") then
            playerDirection = "left"
         elseif gamepads[i]:isGamepadDown("dpright") then
            playerDirection = "right"
         end
      end
   end
   if isDown("left") or isDown("a") or playerDirection == "left" then
      playerX = playerX - dt * 30
   end
   if isDown("right") or isDown("d") or playerDirection == "right" then
      playerX = playerX + dt * 30
   end
   if playerX < 2 then playerX = 2 end
   if playerX > screenWidth - playerWidth - 2 then
      playerX = screenWidth - playerWidth - 2
   end
end

function player.draw()
   local canvasScale = canvasScale
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   love.graphics.draw(playerCanvas, (widescreenOffset + graphics.lockToGrid(playerX)) * canvasScale, playerY * canvasScale, 0, 1, 1)
   love.graphics.pop()
end
