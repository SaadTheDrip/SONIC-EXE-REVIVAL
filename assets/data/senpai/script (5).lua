local camera = 'other'
local windows = {}
local winCounter = 0

function onCreate()
    -- triggered when the lua file is started
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', true);
end

function onDestroy()
    -- triggered when the lua file is ended (Song fade out finished)
    setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
end

function createWindow(title, body, button, icon, callback, sound, x, y, w, h)
    winCounter = winCounter + 1
    local index = '95win' .. winCounter

    local window = {callback = callback, hasIcon = icon ~= nil}

    playSound(sound or 'windows95/chord')

    createQuickBox(index .. 'window', 0, 0, 256, 96, 'FFFFFF', 1)
    setProperty(index .. 'window.color', getColorFromHex('C0C0C0'))
    if x == nil then
        screenCenter(index .. 'window', 'x')
    else
        setProperty(index .. 'window.x', x)
    end

    if y == nil then
        screenCenter(index .. 'window', 'y')
    else
        setProperty(index .. 'window.x', y)
    end

    createBorder(index .. 'borderwin1', getProperty(index .. 'window.x') + 1,
                 getProperty(index .. 'window.y') + 1,
                 getProperty(index .. 'window.width') - (1 * 2),
                 getProperty(index .. 'window.height') - (1 * 2), 1, 1,
                 'FFFFFF', '808080')
    createBorder(index .. 'borderwin2', getProperty(index .. 'window.x'),
                 getProperty(index .. 'window.y'),
                 getProperty(index .. 'window.width'),
                 getProperty(index .. 'window.height'), 1, 1, 'DFDFDF', '0A0A0A')

    createQuickBox(index .. 'titlebar', getProperty(index .. 'window.x') + 3,
                   getProperty(index .. 'window.y') + 3,
                   getProperty(index .. 'window.width') - (3 * 2), 20, 'FFFFFF',
                   1)

    createQuickBox(index .. 'closebutton',
                   (getProperty(index .. 'titlebar.x') +
                       getProperty(index .. 'titlebar.width') - 16 - 2),
                   (getProperty(index .. 'titlebar.y') +
                       getProperty(index .. 'titlebar.height') - 14 - 3), 16,
                   14, 'FFFFFF', 1)
    setProperty(index .. 'closebutton.color', getColorFromHex('C0C0C0'))
    createBorder(index .. 'borderclosebutton1',
                 getProperty(index .. 'closebutton.x') + 1,
                 getProperty(index .. 'closebutton.y') + 1,
                 getProperty(index .. 'closebutton.width') - (1 * 2),
                 getProperty(index .. 'closebutton.height') - (1 * 2), 1, 1,
                 'FFFFFF', '808080')
    createBorder(index .. 'borderclosebutton2',
                 getProperty(index .. 'closebutton.x'),
                 getProperty(index .. 'closebutton.y'),
                 getProperty(index .. 'closebutton.width'),
                 getProperty(index .. 'closebutton.height'), 1, 1, 'DFDFDF',
                 '0A0A0A')

    createQuickBox(index .. 'okbutton',
                   (getProperty(index .. 'window.x') +
                       getProperty(index .. 'window.width') - 75 - 11),
                   (getProperty(index .. 'window.y') +
                       getProperty(index .. 'window.height') - 23 - 11), 75, 23,
                   'FFFFFF', 1)
    setProperty(index .. 'okbutton.color', getColorFromHex('C0C0C0'))
    createBorder(index .. 'borderokbutton1',
                 getProperty(index .. 'okbutton.x') + 1,
                 getProperty(index .. 'okbutton.y') + 1,
                 getProperty(index .. 'okbutton.width') - (1 * 2),
                 getProperty(index .. 'okbutton.height') - (1 * 2), 1, 1,
                 'FFFFFF', '808080')
    createBorder(index .. 'borderokbutton2', getProperty(index .. 'okbutton.x'),
                 getProperty(index .. 'okbutton.y'),
                 getProperty(index .. 'okbutton.width'),
                 getProperty(index .. 'okbutton.height'), 1, 1, 'DFDFDF',
                 '0A0A0A')

    createTextQuick(index .. 'title', title, getProperty(index .. 'titlebar.x'),
                    getProperty(index .. 'titlebar.y') + 2, 0, 'left', 11, 0, 1,
                    '0x00000000')
    setTextFont(index .. 'title', 'windows95/bold/MS Sans Serif Bold.ttf')
    addLuaText(index .. 'title')

    if window.hasIcon then
        makeLuaSprite(index .. 'windowicon', icon,
                      getProperty(index .. 'window.x') + 14,
                      getProperty(index .. 'window.y') + 33);
        setObjectCamera(index .. 'windowicon', camera)
        setProperty(index .. 'windowicon.antialiasing', false)
        addLuaSprite(index .. 'windowicon', true)
    end

    createTextQuick(index .. 'body', body, getProperty(index .. 'window.x') + 9,
                    getProperty(index .. 'window.y') + 34, 0, 'left', 11, 0, 1,
                    '0x00000000')
    setTextColor(index .. 'body', '000000')
    setTextFont(index .. 'body', 'windows95/norm/MS Sans Serif.ttf')
    addLuaText(index .. 'body')

    if not window.hasIcon then
        setProperty(index .. 'body.x', getProperty(index .. 'window.x') + 9)
        setProperty(index .. 'body.y', getProperty(index .. 'window.y') + 34)
    else
        setProperty(index .. 'body.x',
                    getProperty(index .. 'windowicon.x') +
                        getProperty(index .. 'windowicon.width') + 8)
        setProperty(index .. 'body.y', getProperty(index .. 'window.y') + 34)
    end

    createTextQuick(index .. 'buttonText', button,
                    getProperty(index .. 'okbutton.x') +
                        (getProperty(index .. 'okbutton.width') / 2),
                    getProperty(index .. 'okbutton.y') + 3, 0, 'left', 11, 0, 1,
                    '0x00000000')
    setTextColor(index .. 'buttonText', '000000')
    setTextFont(index .. 'buttonText', 'windows95/norm/MS Sans Serif.ttf')
    setProperty(index .. 'buttonText.x', getProperty(index .. 'okbutton.x') +
                    (getProperty(index .. 'okbutton.width') / 2) -
                    (getProperty(index .. 'buttonText.width') / 2))
    addLuaText(index .. 'buttonText')

    makeLuaSprite(index .. 'closeicon', 'windows95/SEX',
                  (getProperty(index .. 'closebutton.x') + 4),
                  (getProperty(index .. 'closebutton.y') + 3));
    setObjectCamera(index .. 'closeicon', camera)
    setProperty(index .. 'closeicon.antialiasing', false)
    addLuaSprite(index .. 'closeicon', true)

    setProperty(index .. 'titlebar.color', getColorFromHex('000080'))

    windows[index] = window

end

function onSongStart()
    -- default assets are located in the windows95 folder
    createWindow('Sample title', 'Sample body', 'OK', 'windows95/error',
                 function(how) debugPrint('Clicked ' .. how) end, nil, nil, nil)
end

function onUpdatePost(elapsed)
    for index, iiii in pairs(windows) do
        interSectMAW = pointIntersect(getMouseX(camera), getMouseY(camera),
                                      getProperty(index .. 'titlebar.x'),
                                      getProperty(index .. 'titlebar.y'),
                                      getProperty(index .. 'titlebar.width'),
                                      getProperty(index .. 'titlebar.height'))

        interSectMAB = pointIntersect(getMouseX(camera), getMouseY(camera),
                                      getProperty(index .. 'closebutton.x'),
                                      getProperty(index .. 'closebutton.y'),
                                      getProperty(index .. 'closebutton.width'),
                                      getProperty(index .. 'closebutton.height'))

        interSectMAOKB = pointIntersect(getMouseX(camera), getMouseY(camera),
                                        getProperty(index .. 'okbutton.x'),
                                        getProperty(index .. 'okbutton.y'),
                                        getProperty(index .. 'okbutton.width'),
                                        getProperty(index .. 'okbutton.height'))

        if interSectMAW and not interSectMAB then
            if mousePressed('left') then updateWindow(index) end
        end

        if interSectMAOKB then
            if mousePressed('left') then
                okButtonPress(index)
            elseif mouseReleased('left') then
                okButtonRelease(index)
                removeWindow(index, 'okButton')
            end
        else
            okButtonRelease(index)
        end

        if interSectMAB then
            if mousePressed('left') then
                closeButtonPress(index)
            elseif mouseReleased('left') then
                closeButtonRelease(index)
                removeWindow(index, 'closeButton')
            end
        else
            closeButtonRelease(index)
        end
    end

    mouseHudX = getMouseX(camera);
    mouseHudY = getMouseY(camera);
end

function okButtonPress(index)
    setProperty(index .. 'buttonText.x', getProperty(index .. 'okbutton.x') +
                    (getProperty(index .. 'okbutton.width') / 2) -
                    (getProperty(index .. 'buttonText.width') / 2) + 1)
    setProperty(index .. 'buttonText.y',
                (getProperty(index .. 'okbutton.y') + 3 + 1))

    setProperty(index .. 'borderokbutton11.color', getColorFromHex('808080'))
    setProperty(index .. 'borderokbutton12.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderokbutton13.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderokbutton14.color', getColorFromHex('808080'))

    setProperty(index .. 'borderokbutton21.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderokbutton22.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderokbutton23.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderokbutton24.color', getColorFromHex('0A0A0A'))
end

function okButtonRelease(index)
    setProperty(index .. 'buttonText.x', getProperty(index .. 'okbutton.x') +
                    (getProperty(index .. 'okbutton.width') / 2) -
                    (getProperty(index .. 'buttonText.width') / 2))
    setProperty(index .. 'buttonText.y',
                (getProperty(index .. 'okbutton.y') + 3))

    setProperty(index .. 'borderokbutton11.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderokbutton12.color', getColorFromHex('808080'))
    setProperty(index .. 'borderokbutton13.color', getColorFromHex('808080'))
    setProperty(index .. 'borderokbutton14.color', getColorFromHex('FFFFFF'))

    setProperty(index .. 'borderokbutton21.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderokbutton22.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderokbutton23.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderokbutton24.color', getColorFromHex('DFDFDF'))
end

function closeButtonPress(index)
    setProperty(index .. 'borderclosebutton11.color', getColorFromHex('808080'))
    setProperty(index .. 'borderclosebutton12.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderclosebutton13.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderclosebutton14.color', getColorFromHex('808080'))

    setProperty(index .. 'borderclosebutton21.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderclosebutton22.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderclosebutton23.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderclosebutton24.color', getColorFromHex('0A0A0A'))
end

function closeButtonRelease(index)
    setProperty(index .. 'borderclosebutton11.color', getColorFromHex('FFFFFF'))
    setProperty(index .. 'borderclosebutton12.color', getColorFromHex('808080'))
    setProperty(index .. 'borderclosebutton13.color', getColorFromHex('808080'))
    setProperty(index .. 'borderclosebutton14.color', getColorFromHex('FFFFFF'))

    setProperty(index .. 'borderclosebutton21.color', getColorFromHex('DFDFDF'))
    setProperty(index .. 'borderclosebutton22.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderclosebutton23.color', getColorFromHex('0A0A0A'))
    setProperty(index .. 'borderclosebutton24.color', getColorFromHex('DFDFDF'))
end

function removeWindow(index, how)
    if windows[index].callback ~= nil then windows[index].callback(how) end
    removeLuaSprite(index .. 'window', true)
    removeLuaSprite(index .. 'titlebar', true)
    removeLuaSprite(index .. 'closebutton', true)
    removeLuaSprite(index .. 'okbutton', true)
    removeLuaSprite(index .. 'closeicon', true)
    removeLuaSprite(index .. 'windowicon', true)
    removeLuaText(index .. 'title', true)
    removeLuaText(index .. 'body', true)
    removeLuaText(index .. 'buttonText', true)
    for n = 1, 4 do
        removeLuaSprite(index .. 'borderwin1' .. n, true)
        removeLuaSprite(index .. 'borderwin2' .. n, true)
        removeLuaSprite(index .. 'borderclosebutton1' .. n, true)
        removeLuaSprite(index .. 'borderclosebutton2' .. n, true)
        removeLuaSprite(index .. 'borderokbutton1' .. n, true)
        removeLuaSprite(index .. 'borderokbutton2' .. n, true)
    end
    winCounter = winCounter - 1
    windows[index] = nil
end

function updateWindow(index)
    setProperty(index .. 'window.x', getProperty(index .. 'window.x') +
                    getMouseX(camera) - mouseHudX)
    setProperty(index .. 'window.y', getProperty(index .. 'window.y') +
                    getMouseY(camera) - mouseHudY)

    setProperty(index .. 'titlebar.x', getProperty(index .. 'window.x') + 3)
    setProperty(index .. 'titlebar.y', getProperty(index .. 'window.y') + 3)

    updateBORDERS(index .. 'borderwin1', getProperty(index .. 'window.x') + 1,
                  getProperty(index .. 'window.y') + 1)
    updateBORDERS(index .. 'borderwin2', getProperty(index .. 'window.x'),
                  getProperty(index .. 'window.y'))

    setProperty(index .. 'closebutton.x',
                (getProperty(index .. 'titlebar.x') +
                    getProperty(index .. 'titlebar.width') - 16 - 2))
    setProperty(index .. 'closebutton.y',
                (getProperty(index .. 'titlebar.y') +
                    getProperty(index .. 'titlebar.height') - 14 - 3))

    setProperty(index .. 'title.x', getProperty(index .. 'titlebar.x'))
    setProperty(index .. 'title.y', getProperty(index .. 'titlebar.y') + 2)

    updateBORDERS(index .. 'borderclosebutton1',
                  getProperty(index .. 'closebutton.x') + 1,
                  getProperty(index .. 'closebutton.y') + 1)
    updateBORDERS(index .. 'borderclosebutton2',
                  getProperty(index .. 'closebutton.x'),
                  getProperty(index .. 'closebutton.y'))

    setProperty(index .. 'okbutton.x',
                (getProperty(index .. 'window.x') +
                    getProperty(index .. 'window.width') - 75 - 11))
    setProperty(index .. 'okbutton.y',
                (getProperty(index .. 'window.y') +
                    getProperty(index .. 'window.height') - 23 - 11))

    setProperty(index .. 'closeicon.x',
                (getProperty(index .. 'closebutton.x') + 4))
    setProperty(index .. 'closeicon.y',
                (getProperty(index .. 'closebutton.y') + 3))

    if not windows[index].hasIcon then
        setProperty(index .. 'body.x', getProperty(index .. 'window.x') + 9)
        setProperty(index .. 'body.y', getProperty(index .. 'window.y') + 34)
    else
        setProperty(index .. 'windowicon.x',
                    getProperty(index .. 'window.x') + 14)
        setProperty(index .. 'windowicon.y',
                    getProperty(index .. 'window.y') + 33)
        setProperty(index .. 'body.x',
                    getProperty(index .. 'windowicon.x') +
                        getProperty(index .. 'windowicon.width') + 8)
        setProperty(index .. 'body.y', getProperty(index .. 'window.y') + 34)
    end

    setProperty(index .. 'buttonText.x', getProperty(index .. 'okbutton.x') +
                    (getProperty(index .. 'okbutton.width') / 2) -
                    (getProperty(index .. 'buttonText.width') / 2))
    setProperty(index .. 'buttonText.y',
                (getProperty(index .. 'okbutton.y') + 3))

    updateBORDERS(index .. 'borderokbutton1',
                  getProperty(index .. 'okbutton.x') + 1,
                  getProperty(index .. 'okbutton.y') + 1)
    updateBORDERS(index .. 'borderokbutton2',
                  getProperty(index .. 'okbutton.x'),
                  getProperty(index .. 'okbutton.y'))

    updateBORDERS(index .. 'borderwin1', getProperty(index .. 'window.x') + 1,
                  getProperty(index .. 'window.y') + 1)
    updateBORDERS(index .. 'borderwin2', getProperty(index .. 'window.x'),
                  getProperty(index .. 'window.y'))
end

function updateBORDERS(tag, objectembedx, objectembedy)
    setProperty(tag .. '1.x', objectembedx)
    setProperty(tag .. '1.y', objectembedy)

    setProperty(tag .. '2.x', objectembedx + getProperty(tag .. '1.width'))
    setProperty(tag .. '2.y', objectembedy)

    setProperty(tag .. '3.x', objectembedx)
    setProperty(tag .. '3.y', objectembedy + getProperty(tag .. '2.height'))

    setProperty(tag .. '4.x', objectembedx)
    setProperty(tag .. '4.y', objectembedy + 1)
end

function createTextQuick(tag, text, x, y, width, alignment, size, bsize, bq,
                         bcolor)
    makeLuaText(tag, text, width, x, y)
    setTextSize(tag, size)

    setTextAlignment(tag, alignment);
    updateHitbox(tag)
    setProperty(tag .. '.borderSize', bsize)
    setProperty(tag .. '.borderQuality', bq)
    setProperty(tag .. '.borderColor', getColorFromHex(bcolor));
    setObjectCamera(tag, camera)
end

function createBorder(tag, x, y, width, height, thicc, alpha, color1, color2)
    createQuickBox(tag .. '1', x, y, width - thicc, thicc, 'FFFFFF', alpha)
    createQuickBox(tag .. '2', x + width - thicc, y, thicc, height - thicc,
                   'FFFFFF', alpha)
    createQuickBox(tag .. '3', x, y + height - thicc, width, thicc, 'FFFFFF',
                   alpha)
    createQuickBox(tag .. '4', x, y + thicc, thicc, height - (thicc * 2),
                   'FFFFFF', alpha)
    setProperty(tag .. '1.color', getColorFromHex(color1))
    setProperty(tag .. '2.color', getColorFromHex(color2))
    setProperty(tag .. '3.color', getColorFromHex(color2))
    setProperty(tag .. '4.color', getColorFromHex(color1))
end

function createQuickBox(tag, x, y, width, height, color, alpha)
    makeLuaSprite(tag, '', x, y)
    makeGraphic(tag, width, height, color)
    setProperty(tag .. '.alpha', alpha)
    setObjectCamera(tag, camera)
    addLuaSprite(tag, true)
end

function rangeIntersect(min0, max0, min1, max1)
    return
        math.max(min0, max0) >= math.min(min1, max1) and math.min(min0, max0) <=
            math.max(min1, max1);
end

function pointIntersect(x0, y0, x1, y1, width1, height1)
    return rangeIntersect(x0, x0, x1, x1 + width1) and
               rangeIntersect(y0, y0, y1, y1 + height1)
end

function createTextQuick(tag, text, x, y, width, alignment, size, bsize, bq,
                         bcolor)
    makeLuaText(tag, text, width, x, y)
    setTextSize(tag, size)

    setTextAlignment(tag, alignment);
    updateHitbox(tag)
    setProperty(tag .. '.borderSize', bsize)
    setProperty(tag .. '.borderQuality', bq)
    setProperty(tag .. '.borderColor', getColorFromHex(bcolor));
    setObjectCamera(tag, camera)
end
