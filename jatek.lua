local composer = require( "composer" )
 
local scene = composer.newScene()
 
function scene:create( event )
 
    local sceneGroup = self.view
    
       

      



end 


 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
       
 
    elseif ( phase == "did" ) then
        
        system.activate("multitouch") 
        
        ----------------------------------------HANG-----------------------------------
    

      
        --------------------DESIGN---------------------------------------------------------
        local x = display.contentCenterX
        local y = display.contentCenterY
   
        

        

        
        



        local hatter = display.newImageRect("image/hatter.png",6000,2600)
        local kep32 = display.newImageRect("image/backgroundMountain.png",2500,1500)

        kep32.x = x  + 1500
        kep32.y = y 
        
        local kep3 = display.newImageRect("image/backgroundMountain.png",2500,1500)
--------------------------------------------------------------------------------------------------
    
        local dev = display.newText("Off",500,500)
        dev.x = display.contentCenterX + 1000
        dev.y = display.contentCenterY - 1000
        dev.size = 200   
        local devon  = 0

        local function feri()
            dev.text =  "On"
            devon = 1
        
        end

        dev:addEventListener( "tap",feri)

        local function loop5()
            if devon == 1 then

            end
        end
        timer.performWithDelay(1,loop5,0)
    
        --------------------------------------------------------------------------------------------------
        kep3.x= x - 1500
        kep3.y = y
        local kep = display.newImageRect("image/column1.png",700,1200)
        kep.x = x + 2000
        kep.y = y 
        local kep2 = display.newImageRect("image/column2.png",700,1200)
        kep2.x = x - 2000
        kep2.y = y
        
       
        local ground  = display.newImageRect("image/platformBase3.png",2400,700)
        local ground3  = display.newImageRect("image/platformBase3.png",2400,700)
        local ground4  = display.newImageRect("image/platformBase3.png",2400,700)
        local ground5 = display.newImageRect("image/platformBase3.png",2400,700)
        local ground6 = display.newImageRect("image/platformBase3.png",2400,700)
        local   ground2 = display.newImageRect("image/platformBase3.png",2400,700)
        
        local sheetData = {
            width=190,
            height=321,
            numFrames=5,
            sheetContentWidth=984,
            sheetContentHeight=321}

        local mySheet = graphics.newImageSheet("image/sprites.png",sheetData)

        local sequenceData = {
            {name = "normalrun",start=1,count=5,time=1000},
            {name = "stand",frames={1},time=250}
        }    

        local player = display.newSprite(mySheet,sequenceData)
       
       
        player.timeScale = 2.0
        player.xScale = 4
        player.yScale = 4
      

        



        
        local animation = 0






        local asize = 600
        local bsize= 500

        
        ground.x = x -1800
        ground.y = y+850
        ground5.x = ground.x + 4800
        ground5.y = ground.y
        ground6.x = ground.x + 4800
        ground6.y = ground.y + 450
        hatter.x =  x 
        hatter.y = y 

        local pont = 0
        local  ido = display.newText(pont,x,y-1000)
        local enemy2 = display.newImageRect("image/spike.png",400,300)
        
        local enemy = display.newImageRect("image/spike.png",400,300)
        
        local left = display.newImageRect("image/arrow.png",600,500)
        
        local right = display.newImageRect("image/arrow.png",600,500)
      
        local jump   = display.newImageRect("image/arrow2.png",asize,bsize)
        
        player.x = x  - 1200
        left.xScale = -1
        player.y = y
        jump.rotation =  -90
        
        
        
       



      
        left.x =x  -2000
        left.y =y  + 820
        
       
        left.rotation = 0
        
        right.x = x  - 1300
        right.y = y +820
        ground3.x = ground.x 
        ground3.y = y +1270
        ground2.x = ground.x + 2400
        ground2.y = ground.y 
        jump.x = x  + 1900
        jump.y = y +800
        ground4.x = ground2.x 
        ground4.y = y + 1280

      -----------------------------END------------------------------------
      ----------------------PHYSICS----------------------------------------
       

        local  physics = require( "physics" )

        physics.start()
        physics.addBody( ground, "static" )
        physics.addBody( ground5, "static" )
        physics.addBody( ground6, "static" )
        physics.addBody( player, "dynamic",
                { density=2.0, bounce=0.0 }, 
                { box={ halfWidth=195, halfHeight=150, x=0, y=50 }, isSensor=true }

        )
        physics.addBody(ground2,"static")    
        ground.objType = "ground"
        ground2.objType = "ground"
        ground5.objType = "ground"
        local cw, ch = display.actualContentWidth, display.actualContentHeight

        player.isFixedRotation = true
        player.sensorOverlaps = 0
        physics.setGravity( 0, 100 )  

        ---------------MOVEMENT-------------------------------------------


        

        
        local function jobra( event )
            if ( event.phase == "began" ) then
                    player:setLinearVelocity( 1260, 100 )
                                                                                 
                    
                    player.xScale = 4
                    player:setSequence("normalrun")
                    player:play()
                    right.xScale = 0.85
                    right.yScale = 0.85
                
            elseif ( event.phase == "ended" ) then
                
                    player:setLinearVelocity( 0, 0 )
                    player:setSequence("stand")
                    right.xScale = 1
                    right.yScale = 1
                
            end
            return true
        end
        right:addEventListener( "touch", jobra )
        
        local function balra( event )
            if ( event.phase == "began" ) then
            
                player:setLinearVelocity( -1260, 100 )

              
            
                player.xScale = -4
                left.xScale = -0.85
                left.yScale = 0.85
                player:setSequence("normalrun")
                player:play()
                 
            elseif ( event.phase == "ended" ) then
                player.x = player.x + 10
                player:setLinearVelocity( 0, 0 )
                player:setSequence("stand")
                left.xScale = -1
                left.yScale = 1
                z = 1
            end
            return true
        end
        left:addEventListener( "touch", balra )


        




      













        local function ugras( event )
           
            if ( event.phase == "began" and player.sensorOverlaps > 0 ) then
                
                local vx, vy = player:getLinearVelocity()
                player:setLinearVelocity( vx, 0 )
                player:applyLinearImpulse( nil, -10000, player.x, player.y )
                
                player:setSequence("stand")
                player:play()
                animation = 1
                jump.xScale = 0.85
                jump.yScale = 0.85
            elseif ( event.phase == "ended" ) then
                jump.xScale = 1
                jump.yScale = 1
                
                
            end
            
        end
        jump:addEventListener( "touch", ugras )
        
         

        local function sensorCollide( self, event )
 
            if ( event.selfElement == 2 and event.other.objType == "ground" ) then
         
                if ( event.phase == "began" ) then
                    self.sensorOverlaps = self.sensorOverlaps + 1
                   
                
                elseif ( event.phase == "ended" ) then
                    self.sensorOverlaps = self.sensorOverlaps - 1
                    
                end
            end
        end
        player.collision = sensorCollide
        player:addEventListener( "collision" )



          




      









        
       
        



        ---------------------------------END--------------------END-------------------------

        --------------------------------------MARIO----------------------------------------
        local  mario = display.newImageRect("enemy/mario.png",500,500)
        mario.x = -2560
        mario.y = display.contentCenterY - 900

        local rot = 0
        local  function super()
         if pont > 100 then 

            if rot == 0 then
                mario.x = mario.x + 12
                mario.xScale =1
                mario.y = mario.y + math.random(0,6)

            end   
          end   

          if mario.x >2600 then
            rot = 1
          end

          if mario.x < -1400 then 
            rot = 0
          end
          if rot == 1 then
            mario.x = mario.x - 12
            mario.xScale = -1
            mario.y = mario.y - math.random(0,6)
          end
        end
        timer.performWithDelay(1,super,0)
         


        


        

























        --------------------------ENEMY---------------------ENEMY---------------------------
        enemy2.x = -1780
        enemy.x = 4000
        enemy.y = y +600  --340
        enemy2.y  = enemy.y
        
        physics.addBody( enemy, "static",
                { density=1.0, bounce=0.0 }, 
                { box={ halfWidth=200, halfHeight=150, x=0, y=50 }, isSensor=true }
        )
        physics.addBody( enemy2, "static",
                 { density=1.0, bounce=0.0 },
                 { box={ halfWidth=200, halfHeight=150, x=0, y=50 }, isSensor=true }
        )
       
        physics.addBody( mario, "static",
                 { density=1.0, bounce=0.0 },
                 { box={ halfWidth=250, halfHeight=250, x=0, y=50 }, isSensor=true }
        )

        --------------------------------ENEMY---------------------------
       



        local sword = display.newImageRect("enemy/sword.png",300,800)
        physics.addBody( sword, "static",
                { density=1.0, bounce=0.0 },  -- Main body element
                { box={ halfWidth=200, halfHeight=400, x=0, y=50 }, isSensor=true }
        )
        sword.x = display.contentCenterX
        sword.y = display.contentCenterY + 1800
        

        local function attack2()
           if pont >30  then 
                sword.y = sword.y- 25
                if sword.y < -500 then
                        sword.x = math.random(-1000,3000)
                        sword.y = display.contentCenterY+ 1800
                end  
            end 
          
        end
        timer.performWithDelay(1,attack2,0)




        local sword2 = display.newImageRect("enemy/sword.png",300,800)
        sword2.x = display.contentCenterX
        sword2.y = display.contentCenterY  - 1800
        sword2.yScale = -1

        physics.addBody( sword2, "static",
    
                { density=1.0, bounce=0.0 },  -- Main body element
                { box={ halfWidth= 150, halfHeight=400, x=0, y=50 }, isSensor=true }

            )
        
            

        local function attack3()
            if pont  >60 then
                sword2.y = sword2.y +25
                if sword2.y > 3000 then 
                    sword2.x = math.random(-1000,3000)
                    sword2.y = display.contentCenterY  - 1800
                end
            end
        end
        timer.performWithDelay(1,attack3,0)        
        --------------------------------END------------------------------




        -------------ENEMY-----END---------------------------------------------------------------
        




        -----------------HP-------------------------------------


            local hp  = display.newImageRect("image/heart.png",400,400)
            hp.x = x  - 2000
            hp.y =y      - 1000



            local hp2  = display.newImageRect("image/heart.png",400,400)
            hp2.x = x  - 1700
            hp2.y  =y  - 1000



            local hp3    = display.newImageRect("image/heart.png",400,400)
            
            hp3.x = x - 1400
            hp3.y = y  - 1000
        



        local eletek = 3


        enemy.objType = "ground"

        local function elet(self,event)
            if ( event.phase == "began" ) then
              if devon == 0 then  
                eletek = eletek - 1
              end  

            elseif ( event.phase == "ended" ) then
            
                
            end
            


        end    

        local function elet2(self,event)
            if ( event.phase == "began" ) then
                if devon ==0 then
                    eletek = eletek - 1

                end      
            elseif ( event.phase == "ended" ) then
                
                
            end
            


        end    





        local function elet3(self,event)
            if ( event.phase == "began" ) then
             if devon == 0 then   
                eletek = eletek - 1
             end   

            elseif ( event.phase == "ended" ) then
            
                
            end
            


        end    



        local function elet4(self,event)
            if ( event.phase == "began" ) then
              if devon == 0 then
                eletek = eletek - 1
              end  

            elseif ( event.phase == "ended" ) then
            
                
            end
            


        end    


        local function elet5(self,event)
            if ( event.phase == "began" ) then
              if devon == 0 then 
                eletek = eletek - 1
              end  

            elseif ( event.phase == "ended" ) then
            
                
            end
            


        end    
        mario.collision = elet5
        mario:addEventListener("collision")
        sword2.collision = elet3
        enemy2.collision  = elet2
        enemy.collision  = elet
        sword.collision = elet3
        sword2:addEventListener("collision")
        sword:addEventListener("collision")
        enemy2:addEventListener("collision")

        enemy:addEventListener("collision")
        local function loop4()
            if player.x >display.contentCenterX +2500 then
             if devon == 0 then
                eletek = -10
             end
            end

            if player.x<display.contentCenterX - 2500 then
              if devon == 0 then  
                eletek  = -10
              end
            end    
        end
         
        timer.performWithDelay(1,loop4,0)
       
        local z = 1
        local function loop()
            if eletek <= 1 then 
                hp3.x = 999999999
             --   system.vibrate()

            end    

            if eletek <= -6 then
                hp2.x = hp3.x
               -- system.vibrate()

            end    

            if eletek <=  -10 then
                hp.x = hp3.x
               -- system.vibrate()

                z = 0
                
            
              
              timer.performWithDelay(3000,death2,0)
            end   
        end

        timer.performWithDelay(1,loop,0)


       










        ----------------------PONTSZAMLALO----------------------------
        
        ido.size = 400

        
        local function  idozito()
            pont = pont+z
            ido.text = pont
            
                
               
            
                
    
          
        end

        -----------------HALALAL----------------------------------------
        
       

        local text2 = display.newText("Restart",500,500)
        text2.x = 9999
        text2.y = 99999
        asd = 80
        asd2 = 10
        local function loop3()
            
            if eletek <=  -10 then
                mario.x = -2560
                mario.y = display.contentCenterY - 900
        
                player.y = player.y - 80
                player.x = player.x +  10
                enemy.x = 999999
                enemy2.x = 9099999
                left.x  = 9999
                right.x = 9999
                jump.x =99999
                text2.x = display.contentCenterX
                text2.y = display.contentCenterY+1000
                text2.size = 400
                sword.y = 999999999
                ido.x = display.contentCenterX
                ido.y = display.contentCenterY - 200

            end


        end
            
        timer.performWithDelay(1,loop3,0)


        local function click()
            sword.y = display.contentCenterY + 1800
            sword2.y = display.contentCenterY -1800
            eletek = 3
            pont = 0
            ido.x  = display.contentCenterX
            ido.y = display.contentCenterY - 1000
            z = 1
            
           
            hp2.x = display.contentCenterX - 1700
            hp2.y = display.contentCenterY -1000
            hp3.x =display.contentCenterX -1400
            hp3.y  = display.contentCenterY - 1000
            hp.x =  x  - 2000
           

            hp.y = display.contentCenterY - 1000
            player.x = x  - 1200
            player.y = y
            enemy2.x = -1780
            enemy.x = 4000
            enemy.y = y +600  --340
            enemy2.y  = enemy.y
            jump.x = x  + 1900
            jump.y = y +800
            right.x = x  - 1300
            right.y = y +820
            left.x =x  -2000
            left.y =y  + 820
            
            
            text2.x = 999999
        
        end

        text2:addEventListener("tap",click)





    
   
    
    

        


        
        ---------------------END------------------------------------
        timer.performWithDelay(1,loop2,0)
        timer.performWithDelay(500,idozito,0)
        ---------------------ENEMY----------------------------------
        enemy2.y  = enemy.y

        local function attack()
            
                enemy.x = enemy.x - 20
                enemy2.x = enemy2.x +20


        end



        timer.performWithDelay(1,attack,0)




        local function spawn()

            if enemy.x < -1780 then
                enemy.x  = 4000
                enemy2.x = -1780

            end    

            

        end


        timer.performWithDelay(1,spawn,0)

            -------------End



        ----------------------------ENEMY2-----------------------
        
    
        
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