game = {}

function game.initialize()
   background.initialize()
   player.initialize()
   enemies.initialize()
   score.initialize()
   audio.randomizePitch(crash)
   paused = false
end

function game.checkCollisions()
   local playerX = graphics.lockToGrid(playerX)
   local playerY = playerY
   local playerWidth = playerWidth
   local screenHeight = screenHeight
   for i = 1, table.getn(ladies) do
      if ladies[i][2] + 7 > playerY and ladies[i][2] < screenHeight - 10 then
         if ladies[i][1] < playerX then
            if playerX - ladies[i][1] < playerWidth then
               if ladies[i][2] + playerHeight - 2 > playerY or playerX - ladies[i][1] < playerWidth - 2 then
                  if soundAvailable and soundOn then
                     audio.playEffect(crash)
                     gameover.initialize()
                     state = "gameover"
                  end
               end
            end
         elseif ladies[i][1] - playerX < playerWidth then
            if ladies[i][2] + playerHeight - 2 > playerY or ladies[i][1] - playerX < playerWidth - 2 then
               if soundAvailable and soundOn then
                  audio.playEffect(crash)
                  gameover.initialize()
                  state = "gameover"
               end
            end
         end
      end
   end
end

function game.update(dt)
   player.update(dt)
   enemies.update(dt)
   game.checkCollisions()
end

function game.draw()
   background.draw()
   player.draw()
   enemies.draw()
   score.draw()
end

function game.gamepadpressed(joystick, button)
   if button == "start" then
      paused = not paused
      if audioAvailable and audioOn then
         audio.randomizePitch(walk)
         if paused then audio.pauseEffect(walk) else audio.resumeEffect(walk) end
      end
   elseif button == "back" and not paused then
      splash.initialize()
      state = "splash"
   elseif (button == "dpleft" or button == "dpright") then
      gamepadDirectionDown = true
      if soundAvailable and soundOn then
         audio.randomizePitch(walk)
         audio.playEffect(walk)
      end
   end
end

function game.gamepadreleased(joystick, button)
   local isDown = love.keyboard.isDown
   if button == "dpleft" or button == "dpright" then
      if not (joystick:isGamepadDown("dpleft") or joystick:isGamepadDown("dpright")) then
         gamepadDirectionDown = false
         if not (isDown("left") or isDown("right") or isDown("a") or isDown("d")) and soundAvailable and soundOn then
            audio.stopEffect(walk)
         end
      end
   end
end

function game.keypressed(key)
   if key == "f11" then
      graphics.toggleFullscreen()
   elseif key == " " then
      paused = not paused
      if audioAvailable and audioOn then
         if paused then audio.pauseEffect(walk) else audio.resumeEffect(walk) end
      end
   elseif key == "escape" and not paused then
      splash.initialize()
      state = "splash"
   elseif (key == "left" or key == "right" or key == "a" or key == "d") and soundAvailable and soundOn then
      audio.randomizePitch(walk)
      audio.playEffect(walk)
   end
end

function game.keyreleased(key)
   local isDown = love.keyboard.isDown
   if (key == "left" or key == "right" or key == "a" or key == "d") and soundAvailable then
      if not (isDown("left") or isDown("right") or isDown("a") or isDown("d") or gamepadDirectionDown) and soundAvailable and soundOn then
         audio.stopEffect(walk)
      end
   end 
end

function game.focus(f)
   if not f then paused = true else paused = false end
end
