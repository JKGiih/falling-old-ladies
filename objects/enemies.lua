enemies = {}

function enemies.initialize()
   ladies = {}
   enemies.width = 6
   enemies.height = 8
   spawnCounter = 1
   dropSpeed = 0
end

function enemies.move(dt)
   for i = 1, table.getn(ladies) do
      ladies[i][2] = ladies[i][2] + (dt + dropSpeed) * 10
      if ladies[i][2] > screenHeight - 10 and ladies[i][2] < screenHeight - 8 and soundAvailable and soundOn then
         audio.playEffect(ladies[i][7])
      end
   end
end

function enemies.spawn(dt)
   local random = love.math.random
   local ladyX = 4 + (random(6) - 1) * 10
   local ladyY = 7
   local ladyFinalLeftLegOffset = random(3)
   local ladyFinalRightLegOffset = random(3)
   local ladyFinalBodyOffset = random(3)
   local ladyFallSound = 0
   local ladySplatSound = 0
   if soundAvailable then
      ladyFallSound = fall:clone()
      ladySplatSound = splat:clone()
   end
   table.insert(ladies, {ladyX, ladyY, ladyFinalLeftLegOffset, ladyFinalRightLegOffset, ladyFinalBodyOffset, ladyFallSound, ladySplatSound})
   if soundAvailable and soundOn then audio.playEffect(ladies[table.getn(ladies)][6]) end
   spawnCounter = 1
   dropSpeed = dropSpeed + dt / 100
end

function enemies.clear()
   local getn = table.getn
   local insert = table.insert
   local remove = table.remove
   local ladiesToRemove = {}
   if next(ladies) then
      for i = 1, getn(ladies) do
         if ladies[i][2] >= screenHeight + 3 then
            insert(ladiesToRemove, i)
         end
      end
      for i = 1, getn(ladiesToRemove) do
         remove(ladies, ladiesToRemove[i])
         ladiesDodged = ladiesDodged + 1
      end
   end
end

function enemies.update(dt)
   enemies.move(dt)
   enemies.clear()
   if spawnCounter <= 0 then
      enemies.spawn(dt)
   else
      spawnCounter = spawnCounter - dt - dropSpeed
   end
end

function enemies.draw()
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local lockToGrid = graphics.lockToGridRoundUp
   local screenHeight = screenHeight
   local scale = scale
   local widescreenOffset = widescreenOffset
   setColor(colors[5])
   for i = 1, table.getn(ladies) do
      if ladies[i][2] < screenHeight - 40 then
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 8) * scale, 4 * scale, 1 * scale)
      elseif ladies[i][2] < screenHeight - 39 then
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 6) * scale, 4 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 7) * scale, 6 * scale, 1 * scale)
		   setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 7) * scale, 1 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 7) * scale, 1 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 38 then
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 4 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 6 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 1 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 1 * scale, 1 * scale)
		   setColor(colors[5])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 6) * scale, 6 * scale, 1 * scale)
		   setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 2 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 6) * scale, 2 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 37 then
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 4 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 36 then
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 4 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 35 then
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 4 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 34 then
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         setColor(colors[6])
	      rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 4 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 10 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 5) * scale, 4 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 9 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 4 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 4) * scale, 6 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 8 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] - 2 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 3) * scale, 10 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 7 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 6 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 4 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] - 3 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 2) * scale, 12 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 6 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] - 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 8 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 6 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 2 + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 2 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] - 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) + 1) * scale, 14 * scale, 1 * scale)
		   setColor(colors[5])
      elseif ladies[i][2] < screenHeight - 5 then
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] + 1 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 4 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] - 2 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 10 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] - 5 + widescreenOffset) * scale, (lockToGrid(ladies[i][2])) * scale, 16 * scale, 1 * scale)
		   setColor(colors[5])
      else
         setColor(colors[5])
		   rectangle('fill', (ladies[i][1] - 4 + ladies[i][5] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 10 * scale, 1 * scale)
         setColor(colors[6])
		   rectangle('fill', (ladies[i][1] - 1 + ladies[i][3] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] + 2 + ladies[i][4] + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 2) * scale, 1 * scale, 1 * scale)
         rectangle('fill', (ladies[i][1] - 5 + widescreenOffset) * scale, (lockToGrid(ladies[i][2]) - 1) * scale, 16 * scale, 1 * scale)
      end
   end
end
