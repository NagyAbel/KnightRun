local composer = require( "composer" )
 
local scene = composer.newScene()


-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )


    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
  
    
    

      
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
       
        x = display.contentCenterX
        y = display.contentCenterY
        local hatter = display.newImageRect("image/earthWall2.png",5500,5500)
        hatter.x = x 
        hatter.y =y 
        local hegy = display.newImageRect("image/backgroundSet.png",5500,3000)
        hegy.x= x 
        hegy.y =y-220
        local click = audio.loadSound("sound/click.wav")

        local sheetData = {
            width=400,
            height=167,
            numFrames=2,
            sheetContentWidth=800,
            sheetContentHeight=167}


        local mySheet = graphics.newImageSheet("image/szoveg.png",sheetData)    
        local sequenceData = {
            {name = "1",frames={1,2},time=1000},
            
        }    

        local szoveg = display.newSprite(mySheet,sequenceData)
        szoveg.x = x
        szoveg.y = y   - 650
        szoveg:scale(5.5, 5.5)
        szoveg:setSequence("1")
        szoveg:play()
        local start = display.newImageRect("image/buttonStart.png",1250,500)
        start.x= x 
        start.y =y  +1020

        
        local function tap(event)
           
             if ( event.phase == "began" ) then
                audio.play( click )

                start.xScale = 0.85
                start.yScale = 0.85

             elseif ( event.phase == "ended" ) then
                 composer.gotoScene("jatek")
                 start.xScale = 1 
                 start.yScale = 1
             end
             
 
 
         end    

        start:addEventListener("touch",tap)
        sceneGroup:insert(hatter)

       
        sceneGroup:insert(hegy)
      

        sceneGroup:insert(start)
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene