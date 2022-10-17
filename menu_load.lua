function loadMenu_load()
    loadMenu = {
        timer = 0,
        maxTime = 4
    }

end

function loadMenu_draw()
    printCentreTextScreen(logo.text, hugeText)
    printCentreTextOnX("By Ryan Rogan", normalText, gameHeight/2 + 25)
end

function loadMenu_update(dt)
    if loadMenu.timer <= loadMenu.maxTime then
        loadMenu.timer = loadMenu.timer + dt
    else
        transitionToMenu("main")
    end
end

function loadMenu_keypressed(key)
end
