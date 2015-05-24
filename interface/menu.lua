menu = {}

function menu.initialize()
   local random = love.math.random
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   local menuBlocks = {
      {
         {2, 3, 4, 6, 7, 8, 9, 12, 13, 14, 16, 17, 18, 21, 22, 23, 24},
         {1, 8, 11, 14, 16, 19, 23},
	      {2, 3, 8, 11, 12, 13, 14, 16, 17, 18, 23},
	      {4, 8, 11, 14, 16, 19, 23},
	      {1, 2, 3, 8, 11, 14, 16, 19, 23}
      },
      {
         {2, 3, 4, 7, 8, 9, 12, 15, 17, 21, 23, 24, 25},
	      {1, 6, 10, 12, 15, 17, 18, 21, 23, 26},
	      {2, 3, 6, 10, 12, 15, 17, 19, 21, 23, 26},
	      {4, 6, 10, 12, 15, 17, 20, 21, 23, 26},
	      {1, 2, 3, 7, 8, 9, 13, 14, 17, 21, 23, 24, 25}
      },
      {
         {1, 5, 7, 10, 13, 14, 15, 17, 20, 21, 22},
	      {1, 2, 4, 5, 7, 10, 12, 17, 19},
	      {1, 3, 5, 7, 10, 13, 14, 17, 19},
	      {1, 5, 7, 10, 15, 17, 19},
	      {1, 5, 8, 9, 12, 13, 14, 17, 20, 21, 22}
      }, 
      {
         {2, 3, 4, 7, 10, 12, 14, 15, 16, 17},
	      {1, 5, 7, 10, 12, 16},
	      {1, 3, 5, 7, 10, 12, 16},
	      {1, 4, 7, 10, 12, 16},
	      {2, 3, 5, 8, 9, 12, 16}
      },
      {
         {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31},
	      {},
	      {1, 31},
	      {},
	      {1, 31},
	      {},
	      {1, 31},
	      {},
	      {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31}
      },
      {
         {2, 3, 4, 7, 8, 9, 12, 15, 17, 21, 23, 24, 25},
	      {1, 6, 10, 12, 15, 17, 18, 21, 23, 26},
	      {2, 3, 6, 10, 12, 15, 17, 19, 21, 23, 26},
	      {4, 6, 10, 12, 15, 17, 20, 21, 23, 26},
	      {1, 2, 3, 7, 8, 9, 13, 14, 17, 21, 23, 24, 25}
      },
      {
         {1, 5, 7, 10, 13, 14, 15, 17, 20, 21, 22},
	      {1, 2, 4, 5, 7, 10, 12, 17, 19},
	      {1, 3, 5, 7, 10, 13, 14, 17, 19},
	      {1, 5, 7, 10, 15, 17, 19},
	      {1, 5, 8, 9, 12, 13, 14, 17, 20, 21, 22}
      } 
   }
   local menuBlockColors = {
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}},
      {{}, {}, {}, {}, {}}
   }
   for i = 1, getn(menuBlocks) - 2 do
      for j = 1, getn(menuBlocks[i]) do
         for k = 1, getn(menuBlocks[i][j]) do
            menuBlockColors[i][j][k] = random(3) + 1
         end
      end
   end
   for i = getn(menuBlocks) - 1, getn(menuBlocks) do
      for j = 1, getn(menuBlocks[i]) do
         for k = 1, getn(menuBlocks[i][j]) do
            menuBlockColors[i][j][k] = 16
         end
      end
   end
   menuCanvases = {newCanvas(24 * canvasScale, 5 * canvasScale), newCanvas(26 * canvasScale, 5 * canvasScale), newCanvas(22 * canvasScale, 5 * canvasScale), newCanvas(17 * canvasScale, 5 * canvasScale), newCanvas(31 * canvasScale, 9 * canvasScale), newCanvas(26 * canvasScale, 5 * canvasScale), newCanvas(22 * canvasScale, 5 * canvasScale)}
   for i = 1, getn(menuBlocks) do
      setCanvas(menuCanvases[i])
      menuCanvases[i]:clear()
      for j = 1, getn(menuBlocks[i]) do
         for k = 1, getn(menuBlocks[i][j]) do
            setColor(colors[menuBlockColors[i][j][k]])
            rectangle('fill', (menuBlocks[i][j][k] - 1) * canvasScale, (j - 1) * canvasScale, canvasScale, canvasScale)
         end
      end
   end
   setCanvas()
   menuOffset = 8
   menuFrameOffset = 6
end

function menu.getColorOffset(volume, on)
   if on then return 12 - volume * 12 else return 12 end
end

function menu.gamepadpressed(joystick, button)
   local menuOffset = menuOffset
   if button == "dpdown" then
      menuFrameOffset = menuFrameOffset + menuOffset
      if menuFrameOffset > 4 * menuOffset - 2 then menuFrameOffset = 4 * menuOffset - 2 end
   elseif button == "dpup" then
      menuFrameOffset = menuFrameOffset - menuOffset
      if menuFrameOffset < menuOffset - 2 then menuFrameOffset = menuOffset - 2 end
   elseif button == "dpleft" then
      if menuFrameOffset == 2 * menuOffset - 2 and soundAvailable then
         audio.lowerSoundVolume()
      elseif menuFrameOffset == 3 * menuOffset - 2 and musicAvailable then
         audio.lowerMusicVolume()
      end
   elseif button == "dpright" then
      if menuFrameOffset == 2 * menuOffset - 2 and soundAvailable then
         audio.raiseSoundVolume()
      elseif menuFrameOffset == 3 * menuOffset - 2 and musicAvailable then
         audio.raiseMusicVolume()
      end
   elseif (button == "a" or button == "start") then
      if menuFrameOffset == menuOffset - 2 then
         game.initialize()
         state = "game"
      elseif menuFrameOffset == 2 * menuOffset - 2 and soundAvailable then
         audio.toggleSound()
      elseif menuFrameOffset == 3 * menuOffset - 2 and musicAvailable then
         audio.toggleMusic()
      elseif menuFrameOffset == 4 * menuOffset - 2 then
         love.event.quit()
      end
   elseif button == "back" then
      love.event.quit()
   end
end

function menu.keypressed(key)
   local menuOffset = menuOffset
   if key == "down" or key == "s" then
      menuFrameOffset = menuFrameOffset + menuOffset
      if menuFrameOffset > 4 * menuOffset - 2 then menuFrameOffset = 4 * menuOffset - 2 end
   elseif key == "up" or key == "w" then
      menuFrameOffset = menuFrameOffset - 8
      if menuFrameOffset < menuOffset - 2 then menuFrameOffset = menuOffset - 2 end
   elseif key == "left" or key == "a" then
      if menuFrameOffset == menuOffset * 2 - 2 and soundAvailable then
         audio.lowerSoundVolume()
      elseif menuFrameOffset == menuOffset * 3 - 2 and musicAvailable then
         audio.lowerMusicVolume()
      end
   elseif key == "right" or key =="d" then
      if menuFrameOffset == menuOffset * 2 - 2 and soundAvailable then
         audio.raiseSoundVolume()
      elseif menuFrameOffset == menuOffset * 3 - 2 and musicAvailable then
         audio.raiseMusicVolume()
      end
   elseif key == "return" or key == " " then
	   if menuFrameOffset == menuOffset - 2 then
         game.initialize()
         state = "game"
      elseif menuFrameOffset == menuOffset * 2 - 2 and soundAvailable then
         audio.toggleSound()
      elseif menuFrameOffset == menuOffset * 3 - 2 and musicAvailable then
         audio.toggleMusic()
      elseif menuFrameOffset == menuOffset * 4 - 2 then
         love.event.quit()
      end
   elseif key == "escape" then
      love.event.quit()
   elseif key == "f11" then
      graphics.toggleFullscreen()
   end
end

function menu.draw()
   local draw = love.graphics.draw
   local canvasScale = canvasScale
   local widescreenOffset = widescreenOffset
   local colorOffset
   love.graphics.push()
   love.graphics.scale(halfScale / canvasScale)
   for i = 1, 4 do
      draw(menuCanvases[i], (widescreenOffset * 2 + 7) * canvasScale, (menuOffset * i - 4) * canvasScale, 0, 1, 1)
   end
   if soundOn then colorOffset = (soundVolume * 100 / 25 - 4) * (-1) else colorOffset = 4 end
   for i = 1, colorOffset do
      draw(menuCanvases[6], (widescreenOffset * 2 + 7) * canvasScale, (menuOffset * 2 - 4) * canvasScale, 0, 1, 1)
   end
   if musicOn then colorOffset = (musicVolume * 100 / 25 - 4) * (-1) else colorOffset = 4 end
   for i = 1, colorOffset do
      draw(menuCanvases[7], (widescreenOffset * 2 + 7) * canvasScale, (menuOffset * 3 - 4) * canvasScale, 0, 1, 1)
   end
   draw(menuCanvases[5], (widescreenOffset * 2 + 5) * canvasScale, (menuFrameOffset - 4) * canvasScale, 0, 1, 1)
   love.graphics.pop()
end
