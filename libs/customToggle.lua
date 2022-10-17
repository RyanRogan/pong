toggles = {}
function createToggleCentreX(t_text, t_font,t_y, t_action)
    local t_x = love.graphics.getWidth()/2 - (t_font:getWidth(t_text)/2)
    createToggle(t_text, t_font, t_x, t_y, t_action)
end
function createToggle(t_text, t_font, t_x, t_y, t_action)
    local txt_obj_t = {
        text = t_text,
        font = t_font,
        x = t_x,
        y = t_y,
        action = t_action,
        w = t_font:getWidth(t_text),
        h = t_font:getHeight(t_text)
    }
    local toggle_obj_t = {
        toggled = false,
        w = txt_obj_t.h,
        h = txt_obj_t.h,
        x = t_x,
        y = t_y,
        dot_size = 3,
    }
    txt_obj_t.x = toggle_obj_t.x + toggle_obj_t.w + 5
    toggle_obj_t.dot_size = toggle_obj_t.w / toggle_obj_t.dot_size

    table.insert(toggles, {txt_obj = txt_obj_t, toggle_obj = toggle_obj_t, click=false, cooldown = 0})
end

-- Draw each toggle and add some functionality
function drawAndProcessToggles(dt)
    local mouse_obj = { x = love.mouse.getX(), y = love.mouse.getY(), w = 1, h = 1 }

    for i,v in ipairs(toggles) do
        if v.cooldown > 0 then
            v.cooldown = v.cooldown - dt
        end
        if collisonDetected(v.toggle_obj, mouse_obj) then
            if love.mouse.isDown(1) and v.click == false and v.cooldown <= 0 then
                v.click = true
            else
                if v.click then
                    v.txt_obj.action()
                    v.click = false
                    v.toggle_obj.toggled = not v.toggle_obj.toggled
                    v.cooldown = 0.2
                end
            end
            set_color(230,230,230)
        else
            set_color(255,255,255)
        end
        love.graphics.rectangle("fill",v.toggle_obj.x, v.toggle_obj.y, v.toggle_obj.w, v.toggle_obj.h)
        if (v.toggle_obj.toggled) then
            set_color(0,0,0)
            local scale = 0.1*v.toggle_obj.w
            love.graphics.circle("fill",v.toggle_obj.x + v.toggle_obj.w/2 , v.toggle_obj.y + v.toggle_obj.w/2, v.toggle_obj.dot_size)
            -- love.graphics.rectangle("fill",v.toggle_obj.x+scale , v.toggle_obj.y+scale, v.toggle_obj.w-(scale*2), v.toggle_obj.h-(scale*2))
        end
        set_color(255,255,255)
        printTextFree(v.txt_obj.text, v.txt_obj.font, v.txt_obj.x, v.txt_obj.y)
        
    end
end