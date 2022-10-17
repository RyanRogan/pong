function ball_load()
    ball = {        
        x = gameWidth/2,
        y = gameHeight/2,
        w = 20,
        h = 20,
        speed = 200,
        dirX = -1, -- 1=right, -1=left, 0=don't move on X axis
        dirY = -1, -- 1=down, -1=up, 0=don't move on Y axis
    }
end

function ball_draw()
    love.graphics.rectangle("fill", ball.x, ball.y, ball.w, ball.h)
end

function ball_update(dt)
    -- Movement
    --ball.y = ball.dirY * (ball.y + ball.speed*dt)
    ball.x = ball.x + ((ball.speed*dt)* ball.dirX)
    ball.y = ball.y + ((ball.speed*dt)* ball.dirY)

    -- Check Boundaries
    if ball.y <= 0 then
        ball.dirY = 1
    elseif ball.y + ball.h >= gameHeight then
        ball.dirY = -1
    end

    if ball.x <= 0 then
        ball.dirX = 1
        score.player2 = score.player2 + 1
    end
    if ball.x + ball.w >= gameWidth then
        ball.dirX = -1
        score.player1 = score.player1 + 1
    end
end

function ball_keypressed(key)

end
