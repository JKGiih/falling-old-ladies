enemies = {}

function enemies.initialize()
   local setColor = love.graphics.setColor
   local rectangle = love.graphics.rectangle
   local newCanvas = love.graphics.newCanvas
   local setCanvas = love.graphics.setCanvas
   local canvasScale = canvasScale
   ladies = {}
   enemyWidth = 6
   enemyHeight = 8
   spawnCounter = 1
   dropSpeed = 0
   ladiesCanvases = {newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(6 * canvasScale, 11 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale), newCanvas(16 * canvasScale, 7 * canvasScale)}
   setCanvas(ladiesCanvases[1])
   ladiesCanvases[1]:clear()
   setColor(colors[5])
   rectangle('fill', canvasScale, 10 * canvasScale, 4 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[2])
   ladiesCanvases[2]:clear()
   rectangle('fill', canvasScale, 8 * canvasScale, 4 * canvasScale, canvasScale)
   rectangle('fill', 0, 9 * canvasScale, 6 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', canvasScale, 9 * canvasScale, canvasScale, canvasScale)
   rectangle('fill', 4 * canvasScale, 9 * canvasScale, canvasScale, canvasScale)
   setCanvas(ladiesCanvases[3])
   ladiesCanvases[3]:clear()
   setColor(colors[5])
   rectangle('fill', canvasScale, 6 * canvasScale, 4 * canvasScale, canvasScale)
   rectangle('fill', 0, 7 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   setColor(colors[6])
   rectangle('fill', canvasScale, 7 * canvasScale, canvasScale, canvasScale)
   rectangle('fill', 4 * canvasScale, 7 * canvasScale, canvasScale, canvasScale)
   setCanvas(ladiesCanvases[4])
   ladiesCanvases[4]:clear()
   setColor(colors[5])
   rectangle('fill', canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, 4 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[5])
   ladiesCanvases[5]:clear()
   setColor(colors[5])
   rectangle('fill', 0, 3 * canvasScale, 6 * canvasScale, canvasScale)
   rectangle('fill', canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, 4 * canvasScale, canvasScale) 
   setCanvas(ladiesCanvases[6])
   ladiesCanvases[6]:clear()
   setColor(colors[5])
   rectangle('fill', 0, 2 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, 4 * canvasScale, canvasScale) 
   setCanvas(ladiesCanvases[7])
   ladiesCanvases[7]:clear()
   setColor(colors[5])
   rectangle('fill', 0, canvasScale, 6 * canvasScale, 3 * canvasScale)
   rectangle('fill', canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, 4 * canvasScale, canvasScale) 
   setCanvas(ladiesCanvases[8])
   ladiesCanvases[8]:clear()
   rectangle('fill', canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 4 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 0, canvasScale, 6 * canvasScale, 3 * canvasScale)
   rectangle('fill', canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   rectangle('fill', canvasScale, 7 * canvasScale, 4 * canvasScale, canvasScale) 
   -- hitting the ground
   setCanvas(ladiesCanvases[9])
   ladiesCanvases[9]:clear()
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 5 * canvasScale, canvasScale, 6 * canvasScale, 3 * canvasScale)
   setColor(colors[6])
   rectangle('fill', 6 * canvasScale, 4 * canvasScale, 4 * canvasScale, canvasScale)
   rectangle('fill', 5 * canvasScale, 5 * canvasScale, 6 * canvasScale, 2 * canvasScale)
   setCanvas(ladiesCanvases[10])
   ladiesCanvases[10]:clear()
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 5 * canvasScale, canvasScale, 6 * canvasScale, 3 * canvasScale)
   setColor(colors[6])
   rectangle('fill', 5 * canvasScale, 4 * canvasScale, 6 * canvasScale, canvasScale)
   rectangle('fill', 3 * canvasScale, 5 * canvasScale, 10 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[11])
   ladiesCanvases[11]:clear()
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 5 * canvasScale, canvasScale, 6 * canvasScale, 3 * canvasScale)
   setColor(colors[6])
   rectangle('fill', 6 * canvasScale, 3 * canvasScale, 4 * canvasScale, canvasScale)
   rectangle('fill', 2 * canvasScale, 4 * canvasScale, 12 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[12])
   ladiesCanvases[12]:clear()
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 4 * canvasScale, canvasScale, 8 * canvasScale, 2 * canvasScale)
   setColor(colors[6])
   rectangle('fill', 7 * canvasScale, 2 * canvasScale, 2 * canvasScale, canvasScale)
   rectangle('fill', 2 * canvasScale, 3 * canvasScale, 12 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[13])
   ladiesCanvases[13]:clear()
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setColor(colors[5])
   rectangle('fill', 3 * canvasScale, canvasScale, 10 * canvasScale, canvasScale)
   setColor(colors[6])
   rectangle('fill', 0, 2 * canvasScale, 16 * canvasScale, canvasScale)
   -- three canvases for final stage to support random leg positions
   setCanvas(ladiesCanvases[14])
   ladiesCanvases[14]:clear()
   setColor(colors[6])
   rectangle('fill', 0, canvasScale, 16 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[15])
   ladiesCanvases[15]:clear()
   setColor(colors[5])
   rectangle('fill', 3 * canvasScale, 0, 10 * canvasScale, canvasScale)
   setCanvas(ladiesCanvases[16])
   ladiesCanvases[16]:clear()
   setColor(colors[6])
   rectangle('fill', 6 * canvasScale, 0, canvasScale, canvasScale)
   setCanvas(ladiesCanvases[17])
   ladiesCanvases[17]:clear()
   rectangle('fill', 9 * canvasScale, 0, canvasScale, canvasScale)
   setCanvas()
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
   local ladyY = 5
   local ladyFinalLeftLegOffset = random(3)
   local ladyFinalRightLegOffset = random(3)
   local ladyFinalBodyOffset = random(3)
   local ladyFallSound = 0
   local ladySplatSound = 0
   if soundAvailable then
      ladyFallSound = fall:clone()
      audio.randomizePitch(ladyFallSound)
      ladySplatSound = splat:clone()
      audio.randomizePitch(ladySplatSound)
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
         if ladies[i][2] >= screenHeight + 5 then
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
   local lockToGrid = graphics.lockToGridRoundUp
   local screenHeight = screenHeight
   local canvasScale = canvasScale
   local widescreenOffset = widescreenOffset
   love.graphics.push()
   love.graphics.scale(scale / canvasScale)
   for i = 1, table.getn(ladies) do
      if ladies[i][2] < screenHeight - 36 then
         love.graphics.draw(ladiesCanvases[(lockToGrid(ladies[i][2])+6)%10], (widescreenOffset + ladies[i][1]) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1)
      elseif ladies[i][2] < screenHeight - 9 then
         love.graphics.draw(ladiesCanvases[8], (widescreenOffset + ladies[i][1]) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1)
      elseif ladies[i][2] < screenHeight - 4 then
         love.graphics.draw(ladiesCanvases[lockToGrid(ladies[i][2])%30], (widescreenOffset + ladies[i][1]- 5) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1)
      else   
         love.graphics.draw(ladiesCanvases[14], (widescreenOffset + ladies[i][1]- 5 ) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1)
         love.graphics.draw(ladiesCanvases[15], (widescreenOffset + ladies[i][1]- 7 + ladies[i][5]) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1) 
         love.graphics.draw(ladiesCanvases[16], (widescreenOffset + ladies[i][1]- 7 + ladies[i][3]) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1)
         love.graphics.draw(ladiesCanvases[17], (widescreenOffset + ladies[i][1]- 7 + ladies[i][4]) * canvasScale, lockToGrid(ladies[i][2]) * canvasScale, 0, 1, 1) 
      end
   end
   love.graphics.pop()   
end
