

function onCreate()

    makeLuaText('Score', '0', 4000, 100, 150)
    scaleObject('Score', 2, 2)
    setTextAlignment('Score', 'left')
    setObjectCamera('Score', 'hud')
    addLuaText('Score')
    setTextBorder('Score', 0.5, 'FFFFFF')

    makeLuaText('Score', '0', 4000, 100, 150)
    scaleObject('Score', 2, 2)
    setTextAlignment('Score', 'left')
    setObjectCamera('Score', 'hud')
    addLuaText('Score')
    setTextBorder('Score', 0.5, 'FFFFFF')

    makeLuaText('Misses', '0', 4000, 100, 250)
    scaleObject('Misses', 2, 2)
    setTextAlignment('Misses', 'left')
    setObjectCamera('Misses', 'hud')
    addLuaText('Misses')
    setTextBorder('Misses', 0.5, 'FFFFFF')

    makeLuaText('Health', '0', 4000, 100, 200)
    scaleObject('Health', 2, 2)
    setTextAlignment('Health', 'left')
    setObjectCamera('Health', 'hud')
    addLuaText('Health')
    setTextBorder('Health', 0.5, 'FFFFFF')


    makeLuaText('Time', '0', 4000, 950, 500)
    scaleObject('Time', 3, 3)
    setTextAlignment('Time', 'left')
    setObjectCamera('Time', 'hud')
    addLuaText('Time')
    setTextBorder('Time', 0.5, 'FFFFFF')

    makeLuaText('Date', '0', 4000, 950, 600)
    scaleObject('Date', 3, 3)
    setTextAlignment('Date', 'left')
    setObjectCamera('Date', 'hud')
    addLuaText('Date')
    setTextBorder('Date', 0.5, 'FFFFFF')

    setProperty('timeTxt.x', getProperty('timeTxt.x')+100)
    setProperty('timeTxt.y', getProperty('timeTxt.y')-600)
    scaleObject('timeTxt', 3, 3)
    setTextBorder('timeTxt', 0.5, 'FFFFFF')

    disappearOld()
end

function disappearOld()
    setProperty('healthBarBG.visible', false)

    setProperty('healthBar.visible', false);
    setProperty('iconP1.visible', false);
    setProperty('iconP2.visible', false);
    setProperty('timeBar.visible', false)
    setProperty('timeBarBG.visible', false);
    setProperty('scoreTxt.visible', false)
end

function onUpdate()
    setTextString('Misses', 'Misses: '.. getProperty('songMisses'))
    setTextString('Score', 'Score: '.. score)

    setTextString('Health', 'Health: '.. getProperty('health')*50 .. '%')

    local time = os.date('%X')

    setTextString('Time', time)

    local date = os.date('%x')

    setTextString('Date', date)

end