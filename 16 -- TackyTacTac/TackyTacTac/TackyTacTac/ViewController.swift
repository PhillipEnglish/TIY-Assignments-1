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

    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 40, width: 200, height: 50))
    
    let titlesView = UIView(frame: CGRect(x: 0, y: 500, width: 320, height: 50))
    
    let player1ScoreTitleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stalemateScoreTitleLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
    let player2ScoreTitleLabel = UILabel(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
    
    let scoresView = UIView(frame: CGRect(x: 0, y: 525, width: 320, height: 50))
    
    let player1ScoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    let stalemateScoreLabel = UILabel(frame: CGRect(x: 110, y: 0, width: 100, height: 50))
    let player2ScoreLabel = UILabel(frame: CGRect(x: 220, y: 0, width: 100, height: 50))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        gameStatusLabel.text = "Player 1 Turn"
        setUpLabels()
        createResetGameButton()
        createResetAllButton()
        createGrid()
        updateScoreBoard()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Setup View
    
    func setUpLabels()
    {
        gameStatusLabel.textAlignment = .Center
        
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
        
        // add labels to views
        titlesView.addSubview(player1ScoreTitleLabel)
        titlesView.addSubview(stalemateScoreTitleLabel)
        titlesView.addSubview(player2ScoreTitleLabel)
        
        scoresView.addSubview(player1ScoreLabel)
        scoresView.addSubview(stalemateScoreLabel)
        scoresView.addSubview(player2ScoreLabel)
        
        // must add to the view to be visible
        view.addSubview(gameStatusLabel)
        view.addSubview(titlesView)
        view.addSubview(scoresView)
    }
    
    
    func createResetGameButton()
    {
        let resetGameButton = UIButton()
        resetGameButton.setTitle("Clear Game", forState: .Normal)
        resetGameButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        resetGameButton.titleLabel!.font = UIFont(name: "Helvetica", size: 14)
        resetGameButton.frame = CGRectMake(0, 80, 100, 50) // X, Y, width, height
        resetGameButton.center.x = view.center.x
        resetGameButton.addTarget(self, action: "resetGameButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(resetGameButton)
    }
    
    func createResetAllButton()
    {
        let resetAllButton = UIButton()
        resetAllButton.setTitle("Clear All", forState: .Normal)
        resetAllButton.setTitleColor(UIColor.grayColor(), forState: .Normal)
        resetAllButton.titleLabel!.font = UIFont(name: "Helvetica", size: 14)
        resetAllButton.frame = CGRectMake(0, 110, 100, 50) // X, Y, width, height
        resetAllButton.center.x = view.center.x
        resetAllButton.addTarget(self, action: "resetAllButtonPressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(resetAllButton)
    }
    
    func createGrid()
    {
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
                
                let tileButton = TTTButton(frame:CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                tileButton.backgroundColor = UIColor.cyanColor()
                
                tileButton.row = r
                tileButton.col = c
                
                // same as wiring IBAction. colon on action means func takes arguments.
                tileButton.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(tileButton)
            }
        }
    }
    

    
    // MARK: - Action Handlers
    
    func spacePressed(button: TTTButton)
    {
        if button.player == 0
        {
            button.player = isPlayer1Turn ? 1 : 2
            grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
            isPlayer1Turn = !isPlayer1Turn
            buttonsUsed++
            checkForWinner()
            updateScoreBoard()
        }
    }
    
    func resetGameButtonPressed()
    {

        startNewGame()

    }
    
    func resetAllButtonPressed()
    {
        startNewGame()
        clearScoreBoard()
    }

        // MARK: - Private Functions
    
    private func checkForWinner()
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
                        startNewGame()
                        break
                    }
                    else if value1 == 2
                    {
                        player2Score++
                        startNewGame()
                        break
                    }
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
            else if buttonsUsed == 9
            {
                gameStatusLabel.text = ("Stalemate!")
                stalemateScore++
                startNewGame()
                break
            }
            else
            {
                print("does not win")
            }
        }
    }
    
    func startNewGame()
    {
        grid = [[0,0,0],[0,0,0],[0,0,0]]
        createGrid()
        isPlayer1Turn = true
        buttonsUsed = 0
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
    
    func clearScoreBoard()
    {
        player1Score = 0
        stalemateScore = 0
        player2Score = 0
        
        player1ScoreLabel.text = ""
        stalemateScoreLabel.text = ""
        player2ScoreLabel.text = ""
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


