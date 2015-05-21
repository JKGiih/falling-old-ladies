splash = {}

function splash.initialize()
   background.initialize()
   title.initialize()
end

function splash.update(dt)
   title.update(dt)
end

function splash.draw()
   background.draw()
   title.draw()
   menu.draw()
end

function splash.gamepadpressed(joystick, button)
   menu.gamepadpressed(joystick, button)
end

function splash.keypressed(key)
   menu.keypressed(key)
end
