function mainMenu_load()
    mainMenu = {
        timer = 0,
        maxTime = 4,
        areTogglesDrawn = false,
        dt = 0,
    }
    main_btn_w = 300
    cnt_btn_x = gameWidth/2 - main_btn_w/2
    btn1_y = 150
    multiplayer = false
    -- map_options = rabioBtn:init( {"Beach", "Classic"} , normalText, 325, 320, 5)
    -- player_options = rabioBtn:init( {"Single Player", "Multiplayer"} , normalText, 280, 420, 5)
    player_options = rabioBtn:init( {"Single Player", "Multiplayer"} , normalText, 280, 340, 5)
    -- mainMenu.radios = {map_options, player_options}
    mainMenu.radios = {player_options}
end

function mainMenu_draw()
    --[[ if (not areTogglesDrawn) then
        createToggleCentreX("Mutiplayer", normalText, 60, function() multiplayer=not multiplayer end)

        areTogglesDrawn = true
    end ]]
    printCentreTextOnX(logo.text, hugeText, 10)

    -- createButtonWithFixedWidth("Play "..rabioBtn:getToggled(map_options), bigText, cnt_btn_x, btn1_y, main_btn_w, function() startGame(rabioBtn:getToggled(map_options)) end)
    createButtonWithFixedWidth("Play Game", bigText, cnt_btn_x, btn1_y, main_btn_w, function() startGame("Classic") end)
    createButtonWithFixedWidth("Exit", bigText, cnt_btn_x, btn1_y+60, main_btn_w, function() transitionToMenu("exit") end)
    
    -- printCentreTextOnX("Select Map", bigText, 280)
    -- printCentreTextOnX("Select Mode", bigText, 380)
    printCentreTextOnX("Select Mode", bigText, 300)

    -- Draw the toggles
    drawAndProcessToggles(mainMenu.dt)
    -- Draw Radio Buttons
    rabioBtn:drawAll(mainMenu.radios)
    multiplayer = (rabioBtn:getToggled(player_options) == "Multiplayer")
end

function mainMenu_update(dt)
    mainMenu.dt = dt
    
    rabioBtn:updateAll(mainMenu.radios, dt)
end

function mainMenu_keypressed(key)
end