-- common values
function common_load()
    timer = 0
    gameWidth = love.graphics.getWidth() -- Width of the window
    gameHeight = love.graphics.getHeight() -- Height of the window

    -- Fonts
    smallText = love.graphics.newFont('assets/PlaymegamesReguler-2OOee.ttf', 12)
    normalText = love.graphics.newFont('assets/PlaymegamesReguler-2OOee.ttf', 18)
    bigText = love.graphics.newFont('assets/PlaymegamesReguler-2OOee.ttf', 30)
    hugeText = love.graphics.newFont('assets/PlaymegamesReguler-2OOee.ttf', 50)

    logo = {
        text = "BEACH PONG",
        x = gameWidth/2,
        y = gameHeight/2,
    }
end

-- Function to provide ternary operator functionality since lua doesn't have the ternary operator
function tern(condition, true_val, false_val)
    if condition then
        return true_val
    else
        return false_val
    end
end

-- Converting 0-255 range to the new 0-1 range
function set_backgroundColor(red, green, blue)
    love.graphics.setBackgroundColor(red/255, green/255, blue/255)
end
function set_backgroundColorA(red, green, blue, alpha)
    love.graphics.setBackgroundColor(red/255, green/255, blue/255, alpha/100)
end
function set_color(red, green, blue)
    love.graphics.setColor(red/255, green/255, blue/255)
end

-- Check for collisions
function collisonDetected(obj1, obj2)
    if obj1.x < obj2.x + obj2.w and obj1.x + obj1.w > obj2.x and obj1.y < obj2.y + obj2.h and obj1.h + obj1.y > obj2.y then
        return true
    end
    return false
end

-- Function to safely transition to different menus
function transitionToMenu(newMenu)
    if newMenu == "load" then
        loadMenu_load()
    elseif newMenu == "main" then
        mainMenu_load()
    elseif newMenu == "game" then
        game_load()
    elseif newMenu == "exit" then
        love.event.quit()
    end
    menu = newMenu
end
-- Select the game mode and transition to the game
function startGame(setMode)
    setMode = string.lower(setMode)
    transitionToMenu("game")
    mode = tern((setMode == "beach"), "beach", "classic")
end