player = {}

function player.initialize()
   playerWidth = 6
   playerHeight = 8
   playerX = screenWidth / 2 - playerWidth / 2
   playerY = screenHeight - 10
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
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local playerX = graphics.lockToGrid(playerX)
   local playerY = playerY
   local scale = scale
   local widescreenOffset = widescreenOffset
   setColor(colors[7])
   rectangle('fill', (playerX + 1 + widescreenOffset) * scale, (playerY - playerY % 1 + 5) * scale, 1 * scale, 1 * scale)
   rectangle('fill', (playerX + 4 + widescreenOffset) * scale, (playerY - playerY % 1 + 5) * scale, 1 * scale, 1 * scale)
   setColor(colors[4])
   rectangle('fill', (playerX + widescreenOffset) * scale, (playerY - playerY % 1 + 4) * scale, 6 * scale, 1 * scale)
   rectangle('fill', (playerX + widescreenOffset) * scale, (playerY - playerY % 1 + 3) * scale, 6 * scale, 1 * scale)
   rectangle('fill', (playerX + widescreenOffset) * scale, (playerY - playerY % 1 + 2) * scale, 6 * scale, 1 * scale)
   rectangle('fill', (playerX + 1 + widescreenOffset) * scale, (playerY - playerY % 1 + 1) * scale, 4 * scale, 1 * scale)
   setColor(colors[7])
   rectangle('fill', (playerX + widescreenOffset) * scale, (playerY - playerY % 1) * scale, 6 * scale, 1 * scale)
   rectangle('fill', (playerX + widescreenOffset) * scale, (playerY - playerY % 1 - 1) * scale, 6 * scale, 1 * scale)
   rectangle('fill', (playerX + 1 + widescreenOffset) * scale, (playerY - playerY % 1 - 2) * scale, 4 * scale, 1 * scale)
end
