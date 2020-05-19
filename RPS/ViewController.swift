//
//  ViewController.swift
//  RPS
//
//  Created by Alessandro Spisso on 18/05/2020.
//  Copyright © 2020 Alessandro Spisso. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var ComputerSign: UILabel!
    @IBOutlet weak var GameResult: UILabel!
    @IBOutlet weak var RockButton: UIButton!
    @IBOutlet weak var PaperButton: UIButton!
    @IBOutlet weak var ScissorsButton: UIButton!
    @IBOutlet weak var PlayButton: UIButton!
    
    var CurrentState: GameState = GameState.Start
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        ResetView()
    }
    
    func Play(_ PlayerSign : Sign)
    {
        //Hide all the buttons except the clicked one
        switch PlayerSign
        {
        case .Rock:
            PaperButton.isHidden = true
            ScissorsButton.isHidden = true
        case .Paper:
            RockButton.isHidden = true
            ScissorsButton.isHidden = true
        case .Scissors:
            RockButton.isHidden = true
            PaperButton.isHidden = true
        }
        
        //Also disables them
        RockButton.isEnabled = false
        PaperButton.isEnabled = false
        ScissorsButton.isEnabled = false
        //Opponent chooses his sign
        let GeneratedComputerSign = RandomSign()
        ComputerSign.text = GeneratedComputerSign.EmojiSign
        
        //Calculate what happened
        CurrentState = PlayerSign.GetState(OpponentSign: GeneratedComputerSign)
        
        switch CurrentState
        {
        case .Start:
           GameResult.text = "Rock, Paper, Scissors?"
        case .Win:
            GameResult.text = "You win, human."
        case .Lose:
            GameResult.text = "You lost, human."
        case .Draw:
            GameResult.text = "It's a draw"
        }
        
        PlayButton.isHidden = false
    }
    
    func ResetView()
    {
        ComputerSign.text = "👾"
        GameResult.text = "Rock, Paper, Scissors?"
        RockButton.isHidden = false
        PaperButton.isHidden = false
        ScissorsButton.isHidden = false
        RockButton.isEnabled = true
        PaperButton.isEnabled = true
        ScissorsButton.isEnabled = true
        PlayButton.isHidden = true
    }

    @IBAction func RockClick(_ sender: Any)
    {
        Play(Sign.Rock)
    }
    
    @IBAction func PaperClick(_ sender: Any)
    {
        Play(Sign.Paper)
    }
    
    @IBAction func ScissorsClick(_ sender: Any)
    {
        Play(Sign.Scissors)
    }
    
    @IBAction func PlayAgainClick(_ sender: Any)
    {
        ResetView()
    }
}

