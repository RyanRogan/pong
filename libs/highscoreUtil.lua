local bitser = require 'libs/bitser'

function highscore_load()
    -- Highscore with default value of 0
    highscores = {
        player1 = 0,
        player2 = 0
    }
    saveFilename = "highscore_data"

    -- Create Save File if it doesn't exist
    if love.filesystem.getInfo(saveFilename) == nil then
        love.filesystem.newFile(saveFilename)
    end
    
    -- Read Contents of Save File
    savefile_contents, size = love.filesystem.read(saveFilename)

    -- If savefile has data stored in it, set highscore to current highscore
    if savefile_contents ~= nil then
        highscores = bitser.loads(savefile_contents) -- Deserialize save data and assign it to the highscore table
    end
end

--[[function highscore_calculate(new_score)
    if new_score > highscore then
        highscore = new_score
    end
end]]

function highscore_increment(winner_id)
    if winner_id == 1 then
        highscores.player1 = highscores.player1 + 1
    else
        highscores.player2 = highscores.player2 + 1
    end
end

-- When we close the file, we want to write the latest highscores to it
function highscore_close()
    serializedDate = bitser.dumps(highscores)
    love.filesystem.write(saveFilename, serializedDate)
end
