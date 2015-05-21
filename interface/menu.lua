menu = {}

function menu.initialize()
   local random = love.math.random
   local getn = table.getn
   menuStart = {
      {2, 3, 4, 6, 7, 8, 9, 12, 13, 14, 16, 17, 18, 21, 22, 23, 24},
      {1, 8, 11, 14, 16, 19, 23},
	   {2, 3, 8, 11, 12, 13, 14, 16, 17, 18, 23},
	   {4, 8, 11, 14, 16, 19, 23},
	   {1, 2, 3, 8, 11, 14, 16, 19, 23}
   }
   menuStartColors = {
      {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true}
   }
   for i = 1, getn(menuStart) do
      for j = 1, getn(menuStart[i]) do
         menuStartColors[i][j] = random(3)
      end
   end
   menuSound = {
      {2, 3, 4, 7, 8, 9, 12, 15, 17, 21, 23, 24, 25},
	   {1, 6, 10, 12, 15, 17, 18, 21, 23, 26},
	   {2, 3, 6, 10, 12, 15, 17, 19, 21, 23, 26},
	   {4, 6, 10, 12, 15, 17, 20, 21, 23, 26},
	   {1, 2, 3, 7, 8, 9, 13, 14, 17, 21, 23, 24, 25}
   }
   menuSoundColors = {
      {true, true, true, true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true, true, true, true}
   }
   for i = 1, getn(menuSound) do
      for j = 1, getn(menuSound[i]) do
         menuSoundColors[i][j] = random(3)
      end
   end
   menuMusic = {
      {1, 5, 7, 10, 13, 14, 15, 17, 20, 21, 22},
	   {1, 2, 4, 5, 7, 10, 12, 17, 19},
	   {1, 3, 5, 7, 10, 13, 14, 17, 19},
	   {1, 5, 7, 10, 15, 17, 19},
	   {1, 5, 8, 9, 12, 13, 14, 17, 20, 21, 22}
   }
   menuMusicColors = {
      {true, true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true},
      {true, true, true, true, true, true, true, true, true, true, true}
   }
   for i = 1, getn(menuMusic) do
      for j = 1, getn(menuMusic[i]) do
         menuMusicColors[i][j] = random(3)
      end
   end
   menuQuit = {
      {2, 3, 4, 7, 10, 12, 14, 15, 16, 17},
	   {1, 5, 7, 10, 12, 16},
	   {1, 3, 5, 7, 10, 12, 16},
	   {1, 4, 7, 10, 12, 16},
	   {2, 3, 5, 8, 9, 12, 16}
   }
   menuQuitColors = {
      {true, true, true, true, true, true, true, true, true, true},
      {true, true, true, true, true, true},
      {true, true, true, true, true, true, true},
      {true, true, true, true, true, true},
      {true, true, true, true, true, true, true}
   }
   for i = 1, getn(menuQuit) do
      for j = 1, getn(menuQuit[i]) do
         menuQuitColors[i][j] = random(3) + 2
      end
   end
   menuFrame = {
      {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31},
	   {},
	   {1, 31},
	   {},
	   {1, 31},
	   {},
	   {1, 31},
	   {},
	   {1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31}
   }
   menuFrameColors = {
      {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true},
      {},
      {true, true},
      {},
      {true, true},
      {},
      {true, true},
      {},
      {true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true}
   }
   for i = 1, getn(menuFrame) do
      for j = 1, getn(menuFrame[i]) do
         menuFrameColors[i][j] = random(3) + 3
      end
   end
   menuStartOffset = 4
   menuSoundOffset = 12
   menuMusicOffset = 20
   menuQuitOffset = 28
   menuFrameOffset = 2
end

function menu.getColorOffset(volume, on)
   if on then return 12 - volume * 12 else return 12 end
end

function menu.gamepadpressed(joystick, button)
   if button == "dpdown" then
      menuFrameOffset = menuFrameOffset + 8
      if menuFrameOffset > 26 then menuFrameOffset = 26 end
   elseif button == "dpup" then
      menuFrameOffset = menuFrameOffset - 8
      if menuFrameOffset < 2 then menuFrameOffset = 2 end
   elseif button == "dpleft" then
      if menuFrameOffset == 10 then
         audio.lowerSoundVolume()
      elseif menuFrameOffset == 18 then
         audio.lowerMusicVolume()
      end
   elseif button == "dpright" then
      if menuFrameOffset == 10 then
         audio.raiseSoundVolume()
      elseif menuFrameOffset == 18 then
         audio.raiseMusicVolume()
      end
   elseif (button == "a" or button == "start") then
      if menuFrameOffset == 2 then
         game.initialize()
         state = "game"
      elseif menuFrameOffset == 10 then
         audio.toggleSound()
      elseif menuFrameOffset == 18 then
         audio.toggleMusic()
      elseif menuFrameOffset == 26 then
         love.event.quit()
      end
   elseif button == "back" then
      love.event.quit()
   end
end

function menu.keypressed(key)
   if key == "down" or key == "s" then
      menuFrameOffset = menuFrameOffset + 8
      if menuFrameOffset > 26 then menuFrameOffset = 26 end
   elseif key == "up" or key == "w" then
      menuFrameOffset = menuFrameOffset - 8
      if menuFrameOffset < 2 then menuFrameOffset = 2 end
   elseif key == "left" or key == "a" then
      if menuFrameOffset == 10 then
         audio.lowerSoundVolume()
      elseif menuFrameOffset == 18 then
         audio.lowerMusicVolume()
      end
   elseif key == "right" or key =="d" then
      if menuFrameOffset == 10 then
         audio.raiseSoundVolume()
      elseif menuFrameOffset == 18 then
         audio.raiseMusicVolume()
      end
   elseif key == "return" or key == " " then
	   if menuFrameOffset == 2 then
         game.initialize()
         state = "game"
      elseif menuFrameOffset == 10 then
         audio.toggleSound()
      elseif menuFrameOffset == 18 then
         audio.toggleMusic()
      elseif menuFrameOffset == 26 then
         love.event.quit()
      end
   elseif key == "escape" then
      love.event.quit()
   elseif key == "f11" then
      graphics.toggleFullscreen()
   end
end

function menu.draw()
   local getn = table.getn
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local scale = scale
   local halfScale = halfScale
   local widescreenOffset = widescreenOffset
   local menuStartOffset = menuStartOffset
   local menuSoundOffset = menuSoundOffset
   local menuMusicOffset = menuMusicOffset
   local menuQuitOffset = menuQuitOffset
   local menuFrameOffset = menuFrameOffset
   local soundColorOffset = menu.getColorOffset(soundVolume, soundOn)
   local musicColorOffset = menu.getColorOffset(musicVolume, musicOn)
   for i = 1, getn(menuStart) do
      for j = 1, getn(menuStart[i]) do
         setColor(colors[menuStartColors[i][j]])
         rectangle("fill", (menuStart[i][j] + 91) * halfScale + widescreenOffset * scale, (menuStartOffset + i) * halfScale, halfScale, halfScale)
      end
   end
   for i = 1, getn(menuSound) do
      for j = 1, getn(menuSound[i]) do
         setColor(colors[menuSoundColors[i][j] + soundColorOffset])
         rectangle("fill", (menuSound[i][j] + 90) * halfScale + widescreenOffset * scale, (menuSoundOffset + i) * halfScale, halfScale, halfScale)
      end
   end
   for i = 1, getn(menuMusic) do
      for j = 1, getn(menuMusic[i]) do
         setColor(colors[menuMusicColors[i][j] + musicColorOffset])
         rectangle("fill", (menuMusic[i][j] + 92) * halfScale + widescreenOffset * scale, (menuMusicOffset + i) * halfScale, halfScale, halfScale)
      end
   end
   for i = 1, getn(menuQuit) do
      for j = 1, getn(menuQuit[i]) do
         setColor(colors[menuQuitColors[i][j]])
         rectangle("fill", (menuQuit[i][j] + 94) * halfScale + widescreenOffset * scale, (menuQuitOffset + i) * halfScale, halfScale, halfScale)
      end
   end
   for i = 1, getn(menuFrame) do
      for j = 1, getn(menuFrame[i]) do
         setColor(colors[menuFrameColors[i][j]])
         rectangle("fill", (menuFrame[i][j] + 87) * halfScale + widescreenOffset * scale, (menuFrameOffset + i) * halfScale, halfScale, halfScale)
      end
   end
end
