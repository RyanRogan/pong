require "player"
require "player2"
require "ball"
function game_load()
    pause = false
    gameover = false

    game = {
        timer = 0,
        flashcount = 0,
        maxflash = 3,
        increment_score = false;
    }
    maxScore = 5

    score = {
        player1 = 0,
        player2 = 0
    }

    player_load()
    player2_load()
    ball_load()
end

function game_draw()
    mapDraw() -- Draw the map depending on mode

    -- Indicate when game is paused or over
    if pause then
        if game.timer <= 0.75  or game.flashcount >= game.maxflash then
            printCentreTextOnX( tern(gameover, "Game Over!!!", "Pause") , hugeText, gameHeight/3)
        elseif game.timer >= 1.15 then
            game.timer = 0
            game.flashcount = game.flashcount + 1
        end

        if gameover then
            printCentreTextOnXWithBounds(determineWinOrLose(score.player1), hugeText, 100, gameWidth/2)
            printCentreTextOnXWithBounds(determineWinOrLose(score.player2), hugeText, 100, gameWidth*1.5)

            printCentreTextOnX("Press <Enter> to Play Again", bigText, gameHeight/3 + 75)
            printCentreTextOnX("Press <backspace> to go back to the main menu", bigText, gameHeight/3 + 115)
        end
    end

    -- Print score in centre of each half
    printCentreTextOnXWithBounds(score.player1, hugeText, 20, gameWidth/2)  -- Centre of left side
    printCentreTextOnXWithBounds(score.player2, hugeText, 20, gameWidth*1.5) -- Centre of right side


    player_draw()
    player2_draw()
    ball_draw()
    
    set_color(255,255,255)
end

function game_update(dt)
    -- Check if game should be stopped
    if gameover and not pause then
        pause = true
    elseif gameover then -- When the game is over and we've stopped it
        if not increment_score then
            increment_score = true -- Stop any further score increments for this round
            local winner = determineWhoWon(score.player1, score.player2)
            highscore_increment(winner)
        end
    end

    -- If game is paused, run pause code and use return to stop playable code from running
    if pause then
        game.timer = game.timer + dt
        return
    end

    -- Playable code
    player_update(dt)
    player2_update(dt)
    ball_update(dt)

    if score.player1 >= maxScore or score.player2 >= maxScore then
        gameover = true
    end
    
    -- Collision logic
    if collisonDetected(ball, player) then
        ball.dirX = 1
    elseif collisonDetected(ball, player2) then
        ball.dirX = -1
    end
end

function game_keypressed(key)
    player_keypressed(key)
    if key == "p" and gameover == false then
        pause = not pause
        game.flashcount = 0 -- reset game.flashcount when game is initially paused
    end
    if key == "g" then
        gameover = true
    end
    if gameover then
        if key == "return" then
            game_load()
        elseif key == "backspace" then
            game_load()
            transitionToMenu("main")
        end
    end
end

function mapDraw()
    -- create divider in centre of map
    love.graphics.rectangle("fill", (gameWidth/2)-1, 0, 2, gameHeight)

    if mode == "classic" then
        set_backgroundColor(0, 0, 0) -- Set to black
        set_color(240,240,240)
    elseif mode == "beach" then
        set_backgroundColor(255, 203, 23) -- Set to an orange sandy colour
        love.graphics.rectangle("line", 10, 10 , gameWidth - 20, gameHeight - 20) -- draw court
        set_color(10,10,10)
    end
end

function determineWinOrLose(score)
    if score >= maxScore then
        return "Winner"
    else
        return "Loser"
    end
end

function determineWhoWon(player1_score, player2_score)
    if player1_score > player2_score then
        return 1
    else
        return 2
    end
end
