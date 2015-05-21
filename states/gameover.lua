gameover = {}

function gameover.initialize()
   freezeCounter = 1
   background.initialize()
   credits.initialize()
   gamepad.initialize()
   if soundAvailable then
      audio.stopEffect(walk)
   end 
end

function gameover.update(dt)
   if freezeCounter <= 0 then
      credits.update(dt)
   else
      freezeCounter = freezeCounter - dt
   end
end

function gameover.draw()
   game.draw()
   if freezeCounter <= 0 then
      credits.draw()
   end
end

function gameover.gamepadpressed(joystick, button)
   if button == "a" or button == "start" or button == "back" then
      splash.initialize()
      state = "splash"
   end
end

function gameover.keypressed(key)
   if key == "return" or key == " " or key == "escape" then
      splash.initialize()
      state = "splash"
   elseif key == "f11" then
      graphics.toggleFullscreen()
   end
end
