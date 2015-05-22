audio = {}

function audio.initialize()
   local exists = love.filesystem.exists
   local newSource = love.audio.newSource
   musicVolume = 0.50
   soundVolume = 0.50
   if love.filesystem.exists("assets/bgm.mp3") then 
      music = love.audio.newSource("assets/bgm.mp3")
      music:setLooping(true)
      musicAvailable = true
      audio.setMusicVolume()
      musicOn = true
      music:play()
   else
      musicAvailable = false
      musicOn = false
   end
   if exists("assets/walk.wav") and exists("assets/fall.wav") and exists("assets/splat.wav") and exists("assets/crash.wav") then
      walk = newSource("assets/walk.wav", static)
      walk:setLooping(true)
      fall = newSource("assets/fall.wav", static)
      fall:setLooping(false)
      splat = newSource("assets/splat.wav", static)
      splat:setLooping(false)
      crash = newSource("assets/crash.wav", static)
      crash:setLooping(false)
      soundAvailable = true
      audio.setSoundVolume()
      soundOn = true
   else
      soundAvailable = false
      soundOn = false
   end
end

function audio.randomizePitch(effect)
   local newPitch = (effect:getPitch() + 1.5^(love.math.random(2) * 2 - 3)) / 2
   if newPitch < 0.8 then newPitch = 0.8 end
   if newPitch > 1.2 then newPitch = 1.2 end
   effect:setPitch(newPitch)
end

function audio.playEffect(effect)
   effect:play()
end

function audio.stopEffect(effect)
   effect:stop()
end

function audio.pauseEffect(effect)
   effect:pause()
end

function audio.resumeEffect(effect)
   effect:resume()
end

function audio.toggleSound()
   soundOn = not soundOn
end

function audio.toggleMusic()
   musicOn = not musicOn
   if musicAvailable then
      if musicOn then
         love.audio.resume(music)
      else
         love.audio.pause(music)
      end
   end
end

function audio.setSoundVolume()
   if soundAvailable then
      walk:setVolume(soundVolume)
      fall:setVolume(soundVolume)
      splat:setVolume(soundVolume)
      crash:setVolume(soundVolume)
   end 
end

function audio.setMusicVolume()
   if musicAvailable then music:setVolume(musicVolume) end
end

function audio.lowerSoundVolume()
   soundVolume = soundVolume - 0.25
   if soundVolume < 0 then soundVolume = 0 end
   audio.setSoundVolume()
end

function audio.raiseSoundVolume()
   soundVolume = soundVolume + 0.25
   if soundVolume > 1 then soundVolume = 1 end
   audio.setSoundVolume()
end

function audio.lowerMusicVolume()
   musicVolume = musicVolume - 0.25
   if musicVolume < 0 then musicVolume = 0 end
   audio.setMusicVolume()
end

function audio.raiseMusicVolume()
   musicVolume = musicVolume + 0.25
   if musicVolume > 1 then musicVolume = 1 end
   audio.setMusicVolume()
end
