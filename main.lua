require "menu_load"
require "menu_main"
require "game"

-- Get Libraries
require "libs/printText"
require "libs/customButtons"
require "libs/customToggle"
require "libs/radioButtons"
require "libs/highscoreUtil"
require "common"

menu = "main"
mode = "classic" -- options are "classic" and "default"
function love.load()
    highscore_load()
    common_load() -- Load Common Assets and Members
    
    -- Load Menus
    loadMenu_load()
    mainMenu_load()
    game_load()
end

function love.draw()
    if menu == "load" then
        loadMenu_draw()
    elseif menu == "main" then
        mainMenu_draw()
    elseif menu == "game" then
        game_draw()
    end
end

function love.update(dt)    
    if menu == "load" then
        loadMenu_update(dt)
    elseif menu == "main" then
        mainMenu_update(dt)
    elseif menu == "game" then
        game_update(dt)
    end
end

function love.keypressed(key)
    -- Global Actions (Actions that are the same across the entire program)
    if key == "escape" then
        transitionToMenu("exit")
    end

    -- Menu Specific Code
    if menu == "load" then
        loadMenu_keypressed(key)
    elseif menu == "main" then
        mainMenu_keypressed(key)
    elseif menu == "game" then
        game_keypressed(key)
    end
end
function love.quit()
    highscore_close()
end