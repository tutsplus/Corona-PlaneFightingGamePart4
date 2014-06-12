local storyboard = require( "storyboard" )
local scene = storyboard.newScene()local gameOverText
local newGameButtonfunction scene:createScene( event )
        local group = self.view
         local background = display.newRect( 0, 0, display.contentWidth, display.contentHeight)
		background:setFillColor( 0,.39,.75)
		group:insert(background)
		gameOverText = display.newText( "Game Over", display.contentWidth/2,400, native.systemFont, 16 )
        gameOverText:setFillColor( 1, 1, 0 )
        gameOverText.anchorX = .5
        gameOverText.anchorY = .5
 		group:insert(gameOverText)
 		newGameButton = display.newImage("newgamebutton.png",264,670)
 		group:insert(newGameButton)
 		newGameButton.isVisible = false
 endfunction scene:enterScene( event )
        local group = self.view
        storyboard.removeScene("gamelevel" )
        transition.scaleTo( gameOverText, { xScale=4.0, yScale=4.0, time=2000,onComplete=showButton} )
        newGameButton:addEventListener("tap", startNewGame)
end function showButton()
 	gameOverText.isVisible = false
 	newGameButton.isVisible= true
 end function scene:exitScene( event )
        local group = self.view
        newGameButton:removeEventListener("tap",startNewGame)
end

function startNewGame()
        	storyboard.gotoScene("gamelevel")
 end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )return scene