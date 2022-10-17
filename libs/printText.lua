-- Middle of Screen
function printCentreTextScreen(text, font)
    x = gameWidth/2 - font:getWidth(text)/2
    y = gameHeight/2 - font:getHeight(text)/2

    love.graphics.print(text, font, x, y)
end

-- Centre on the X axis but with free movement on Y
function printCentreTextOnX(text, font, y) 
    x = gameWidth/2 - font:getWidth(text)/2
    love.graphics.print(text, font, x, y)
    return x
end

-- Centre on the Y axis but with free movement on X
function printCentreTextOnY(text, font, x)
    y = gameHeight/2 - font:getHeight(text)/2
    love.graphics.print(text, font, x, y)
    return y
end

-- Centre on the X axis but with free movement on Y
function printCentreTextOnXWithBounds(text, font, y, boundsX) 
    x = boundsX/2 - font:getWidth(text)/2
    love.graphics.print(text, font, x, y)
    return x
end

-- Centre on the Y axis but with free movement on X
function printCentreTextOnYWithBounds(text, font, x, boundsY)
    y = boundsY/2 - font:getHeight(text)/2
    love.graphics.print(text, font, x, y)
    return y
end

-- Print text to a defined position
function printTextFree(text, font, x, y)
    love.graphics.print(text, font, x, y)
end

-- Return the position of text
-- Middle of Screen
function getPosCentreTextScreen(text, font)
    x = gameWidth/2 - font:getWidth(text)/2
    y = gameHeight/2 - font:getHeight(text)/2

    return x, y
end

-- Get the Centre Position on the X axis but with free movement on Y
function getPosCentreTextOnX(text, font, y) 
    return gameWidth/2 - font:getWidth(text)/2 -- Return the x pos
end

-- Get the Centre Position on the Y axis but with free movement on X
function getPosCentreTextOnY(text, font, x)
    return gameHeight/2 - font:getHeight(text)/2 -- Return the y pos
end