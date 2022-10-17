-- Creates a button with predefined text, font, x position, y position, width, and height. We can pass a function to the action 
-- argument to give the button functionality when clicked. The text will always be in the middle of the button
btn_colors = {
    normal = {r=255, g=255, b=255},
    hover = {r=200, g=200, b=200},
    click = {r=220, g=220, b=220},
    txt = {r=0, g=0, b=0},
}

function createButton(text, font, btn_x, btn_y, btn_w, btn_h, action)
    local txt_obj = { 
        x = btn_x+btn_w/2-font:getWidth(text)/2 , 
        y = btn_y+btn_h/2 - font:getHeight(text)/2,
        w = font:getWidth(text), 
        h = font:getHeight(text) 
    }
    
    local btn_obj = { x = btn_x, y = btn_y, w = btn_w, h = btn_h }
    local mouse_obj = { x = love.mouse.getX(), y = love.mouse.getY(), w = 1, h = 1 }
    local mouseClick = false
    local round_corner = 10 -- Round corners on buttons
    
    -- Detect mouse hover/click and change colour to reflect this
    if collisonDetected(btn_obj, mouse_obj) then
        if love.mouse.isDown(1) then
            mouseClick = true
            -- btn color during click
            set_color(btn_colors.click.r, btn_colors.click.g, btn_colors.click.b)
        else
            mouseClick = false
            -- hover btn color
            set_color(btn_colors.hover.r, btn_colors.hover.g, btn_colors.hover.b)
        end
    else
        -- default btn color
        set_color(btn_colors.normal.r, btn_colors.normal.g, btn_colors.normal.b)
    end
    -- draw the button and text
    love.graphics.rectangle("fill", btn_obj.x, btn_obj.y, btn_obj.w, btn_obj.h, round_corner, round_corner)
    set_color(btn_colors.txt.r, btn_colors.txt.g, btn_colors.txt.b)
    love.graphics.print(text, font, txt_obj.x, txt_obj.y)
    set_color(255,255,255)
    
    -- Perform action after mouse is released
    if mouseClick then
        action()
        mouseClick = false
    end
end
-- Creates a button with defined text, font, x pos, y pos, action but with auto generated width and height
function createButtonAutoWidthHeight(text, font, btn_x, btn_y, action)
    local btn_w = font:getWidth(text) + 20  -- Set padding on x axis to 20. 10 to the left of the text and 10 to the right
    local btn_h = font:getHeight(text) + 20 -- Set padding on y axis to 20. 10 above the text and 10 below
    createButton(text, font, btn_x, btn_y, btn_w, btn_h, action)
end

-- Creates the button in the middle of the window on ax axis
function createButtonCentreOnX(text, font, btn_y, action)
    local btn_w = font:getWidth(text) + 20 -- doesn't get passed on. just used for btn_x calculation
    local btn_x = gameWidth/2 - btn_w - 2
    
    createButtonAutoWidthHeight(text, font, btn_x, btn_y, action)
end
-- Calculates the height of the button
function createButtonWithFixedWidth(text, font, btn_x, btn_y, btn_w, action)
    local btn_h = font:getHeight(text) + 20 -- Add 20 padding on y axis
    
    -- createButton(text, font, btn_x, btn_y, action)
    createButton(text, font, btn_x, btn_y, btn_w, btn_h, action)
end

function setBtnColor(r, g, b)
    btn_colors.default.r = r
    btn_colors.default.g = g
    btn_colors.default.b = b
    
    btn_colors.hover.r = r - r/4
    btn_colors.hover.g = g - g/4
    btn_colors.hover.b = b - b/4
    
    btn_colors.default.r = r/2
    btn_colors.default.g = g/2
    btn_colors.default.b = b/2
end

function setBtnTxtColor(r,g,b)
    btn_colors.txt.r = r
    btn_colors.txt.g = g
    btn_colors.txt.b = b
end