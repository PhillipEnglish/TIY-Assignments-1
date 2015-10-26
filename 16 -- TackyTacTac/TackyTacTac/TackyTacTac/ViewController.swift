//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Jennifer Hamilton on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    // TODO: Add functionality to show the score of each player (how many games won) as well as how many games were a stalemate
    // TODO: Add functionality to allow the user to reset the board
    // TODO: Add functionality to allow the user to reset the scores (and by extension, the board as well)

    // TODO: Add functionality to randomly choose from several different colors for each player so each game shows different sets of game board colors
    
    var grid=[[0,0,0], /* Array at 0, [0,1,2] */
              [0,0,0], /* Array at 1, [0,1,2] */
              [0,0,0]] /* Array at 2, [0,1,2] */
    
    var isPlayer1Turn = true
    var buttonsUsed = 0
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0

    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    
    let titlesView = UIView(frame: CGRect(x: 0, y: 500, width: 320, height: 50))
    
    let player1ScoreTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stalemateScoreTitleLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
    let player2ScoreTitleLabel = UILabel(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
    
    let scoresView = UIView(frame: CGRect(x: 0, y: 525, width: 320, height: 50))
    
    let player1ScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stalemateScoreLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
    let player2ScoreLabel = UILabel(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
    
//    let buttonView = UIView(frame: CGRect(x: 80, y: 500, width: 300, height: 50))
//    
//    let clearGameButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//    let clearAllButton = UIButton(frame: CGRect(x: 200, y: 0, width: 100, height: 50))

    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        gameStatusLabel.text = "Player 1 Turn"
//        clearGameButton.setTitle("Clear Game", forState: .Normal)
//        clearAllButton.setTitle("Clear All Games", forState: .Normal)
        updateScoreBoard()
        
        gameStatusLabel.textAlignment = .Center
        
//        clearGameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
//        clearAllButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        
        player1ScoreTitleLabel.textAlignment = .Center
        stalemateScoreTitleLabel.textAlignment = .Center
        player2ScoreTitleLabel.textAlignment = .Center
        
        player1ScoreTitleLabel.textAlignment = .Center
        stalemateScoreTitleLabel.textAlignment = .Center
        player2ScoreTitleLabel.textAlignment = .Center
        
        player1ScoreLabel.textAlignment = .Center
        stalemateScoreLabel.textAlignment = .Center
        player2ScoreLabel.textAlignment = .Center
        
        
        // center in view
        gameStatusLabel.center.x = view.center.x
        titlesView.center.x = view.center.x
        scoresView.center.x = view.center.x
//        buttonView.center.x = view.center.x

        // add labels to views
        titlesView.addSubview(player1ScoreTitleLabel)
        titlesView.addSubview(stalemateScoreTitleLabel)
        titlesView.addSubview(player2ScoreTitleLabel)
        
        scoresView.addSubview(player1ScoreLabel)
        scoresView.addSubview(stalemateScoreLabel)
        scoresView.addSubview(player2ScoreLabel)
//        
//        buttonView.addSubview(clearGameButton)
//        buttonView.addSubview(clearAllButton)
        
        // must add to the view to be visible
        view.addSubview(gameStatusLabel)
//        view.addSubview(buttonView)
        view.addSubview(titlesView)
        view.addSubview(scoresView)
        
        // determine screen size(s), store as an int
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        // r = index in main array, row = index in sub-array
        for (r, row) in grid.enumerate()
        {
            for (c, _) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame:CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                // same as wiring IBAction. colon on action means func takes arguments.
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action Handlers

    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
//            if isPlayer1Turn
//            {
//                button.player = 1
//            }
//            else
//            {
//                button.player = 2
//            }
            button.player = isPlayer1Turn ? 1 : 2
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            isPlayer1Turn = !isPlayer1Turn
            buttonsUsed++
            checkForWinner()
            updateScoreBoard()
            
        }
    }
    
    func checkForWinner()
    {
        let possibilities = [
                            ((0,0),(0,1),(0,2)),
                            ((1,0),(1,1),(1,2)),
                            ((2,0),(2,1),(2,2)),
                            ((0,0),(1,0),(2,0)),
                            ((0,1),(1,1),(2,1)),
                            ((0,2),(1,2),(2,2)),
                            ((0,0),(1,1),(2,2)),
                            ((2,0),(1,1),(0,2))
                            ]
        for possibility in possibilities
        {
            // '.0' and '.1' are the index of the items in the tuple
            let (p1,p2,p3) = possibility
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3
            {
                if value1 != 0
                {
                    gameStatusLabel.text = ("Player \(value1) Wins!")
                   if value1 == 1
                    {
                        player1Score++
                        break
                    }
                    else if value1 == 2
                    {
                        player2Score++
                        break
                    }
                 break
                }
               
                else
                {
                    if isPlayer1Turn
                    {
                        gameStatusLabel.text = "Player 1 Turn"
                    }
                    else
                    {
                        gameStatusLabel.text = "Player 2 Turn"
                    }
                }
            }
            else
            {
                if buttonsUsed == 7
                {
                    gameStatusLabel.text = ("Stalemate!")
                    stalemateScore++
                    break
                }
            }
            
        }
    }
    
    func updateScoreBoard()
    {
        player1ScoreTitleLabel.text = "Player 1:"
        stalemateScoreTitleLabel.text = "Stalemates:"
        player2ScoreTitleLabel.text = "Player 2:"
        
        player1ScoreLabel.text = String(player1Score)
        stalemateScoreLabel.text = String(stalemateScore)
        player2ScoreLabel.text = String(player2Score)
    }

}

class TTTButton: UIButton
{
    var row = 0
    var col = 0
    
    var player = 0 {
        // when variable changes, the following code will run, similar to a listener
        didSet {
            switch player {
            case 1: backgroundColor = UIColor.magentaColor()
            case 2: backgroundColor = UIColor.yellowColor()
            default: backgroundColor = UIColor.cyanColor()
            }
        }
    }
}

class ClearGameButton: UIButton
{
    
}

class ClearAllButton: UIButton
{
    
}










