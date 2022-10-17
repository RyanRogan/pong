rabioBtn = {}

function rabioBtn:init(t_text_obj, t_font, t_x, t_y, t_padding)
    local temp_radio = {
        x = t_x,
        y = t_y,
        padding = t_padding,
        txt_obj = t_text_obj,
        font = t_font,
        toggled = t_text_obj[1],
    }
    temp_radio.btn_obj = self:createRadioButton(temp_radio)

    return temp_radio
end

function rabioBtn:draw(this)
    local temp_x = this.x
    local round_factor = 5

    for i,v in ipairs(this.txt_obj) do
        local rb = this.btn_obj[i]
        if rb.hover then -- On hover, set darker colour
            set_color(200,200,200)
        else -- If the mouse is not hovering over object, set colour to default
            set_color(255,255,255)
        end
        love.graphics.rectangle("fill", rb.x, rb.y, rb.w, rb.h, round_factor, round_factor) -- Draw outer box

        temp_x = temp_x + this.padding + this.font:getHeight(v) 
        love.graphics.print(v, this.font, temp_x, this.y)
        temp_x = temp_x + this.font:getWidth(v) + (this.padding*3)
        
        if this.toggled == v then
            set_color(0,0,0)
            love.graphics.rectangle("fill", rb.x+(rb.w/4), rb.y+(rb.h/4), rb.w/2, rb.h/2)
        end
        set_color(255,255,255)
    end

end

function rabioBtn:update(this, dt)
    local mouse_obj = { x = love.mouse.getX(), y = love.mouse.getY(), w = 1, h = 1 }

    for i,v in ipairs(this.btn_obj) do
        local tmp_btn = {x = v.x, y = v.y, h = v.h, w = v.w}
        tmp_btn.w = tmp_btn.w + this.padding + this.font:getWidth(this.txt_obj[i])
        if collisonDetected(tmp_btn, mouse_obj) then
            v.hover = true
            if love.mouse.isDown(1) then
                this.toggled = this.txt_obj[i]
            end
        else
            v.hover = false
        end
    end

end

function rabioBtn:createRadioButton(radioBtnObj)
    local temp_x = radioBtnObj.x
    t_btn_obj = {}
    
    for i,v in ipairs(radioBtnObj.txt_obj) do
        table.insert(t_btn_obj, {
            x = temp_x,
            y = radioBtnObj.y,
            w = radioBtnObj.font:getHeight(v),
            h = radioBtnObj.font:getHeight(v),
            hover = false
        })
        temp_x = temp_x + radioBtnObj.font:getWidth(v) + (radioBtnObj.padding*4) + radioBtnObj.font:getHeight(v)
    end
    return t_btn_obj
end

function rabioBtn:drawAll(radioObjs)    
    for i,v in ipairs(radioObjs) do
        self:draw(v)
    end
end

function rabioBtn:updateAll(radioObjs, dt)
    for i,v in ipairs(radioObjs) do
        self:update(v, dt)
    end
end
function rabioBtn:getToggled(this)
    return this.toggled
end