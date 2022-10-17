function player_load()
    player = {        
        x = 50,
        y = gameHeight/2,
        w = 15,
        h = 100,
        speed = 200,
    }
end

function player_draw()
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end

function player_update(dt)
    if love.keyboard.isDown("s") then
        player.y = player.y + player.speed * dt -- Move Down
    elseif love.keyboard.isDown("w") then
        player.y = player.y - player.speed * dt -- Move Up
    end

    -- Check Boundaries
    if player.y <= 0 then
        player.y = player.y + player.speed * dt
    elseif player.y + player.h >= gameHeight then
        player.y = player.y - player.speed * dt
    end
end

function player_keypressed(key)

end
