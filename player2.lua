-- Code for player2 2 which can either be a player2 or an AI enemy depending on the setting
function player2_load()
    player2 = {        
        x = gameWidth - 50,
        y = gameHeight/2,
        w = 15,
        h = 100,
        speed = 200,
        playable = multiplayer,
        dirY = 1, -- 1=down, -1=up, 0=stop
    }
end

function player2_draw()
    love.graphics.rectangle("fill", player2.x, player2.y, player2.w, player2.h)
end

function player2_update(dt)
    if player2.playable then -- Playable logic
        playable_logic(dt)
    else -- AI Logic
        AI_Logic(dt)
    end
end

function player2_keypressed(key)

end

function playable_logic(dt)
    -- Controllable Movement
    if love.keyboard.isDown("down") then
        player2.y = player2.y + player2.speed * dt -- Move Down
    elseif love.keyboard.isDown("up") then
        player2.y = player2.y - player2.speed * dt -- Move Up
    end
    -- Check Boundaries
    if player2.y <= 0 then
        player2.y = player2.y + player2.speed * dt
    elseif player2.y + player2.h >= gameHeight then
        player2.y = player2.y - player2.speed * dt
    end
end
function AI_Logic(dt)
    -- AI Movement
    player2.y = player2.y + ((player2.speed*dt)*player2.dirY)
    -- Check Boundaries
    if player2.y <= 0 then
        player2.dirY = 1
    elseif player2.y + player2.h >= gameHeight then
        player2.dirY = -1
    end
    -- Try to hit the ball
    centrePosPaddle = player2.y + player2.w/2 -- Get the y pos of the middle of the paddle
    if ball.x <= player2.x - 100 and ball.x >= player2.x - 120 then
        player2.dirY = ball.dirY
    end
end