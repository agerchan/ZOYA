//
//  HelpController.swift
//  ZOYA
//
//  Created by Anna Gerchanovsky on 6/27/20.
//  Copyright © 2020 GAAG. All rights reserved.
//

import UIKit

class HelpController: UIViewController {
    
    var previouspage = "start"
    
    @IBOutlet weak var rules: UILabel!
    
    //which variables we may have to take from game
    var truthtable = [false]
    var filth = 1
    var irl = true
    var paranoiaMode = false
    var deck = [[String]]()
    //var paranoiaDeck = [[String]]()
    var currentcard = ["1", "no"]
    var exitbutton: UIButton!
    var backbutton: UIButton!
    var nextcardbutton: UIButton!
    
    @IBOutlet weak var gamesetupbutton: UIButton!
    @IBOutlet weak var gamesetuptriangle: UIImageView!
    @IBOutlet weak var gamerulesbutton: UIButton!
    @IBOutlet weak var gamerulestriangle: UIImageView!
    @IBOutlet weak var disclaimerbutton: UIButton!
    @IBOutlet weak var disclaimertriangle: UIImageView!
    @IBOutlet weak var memobutton: UIButton!
    @IBOutlet weak var memotriangle: UIImageView!
    
    
    func gameSetup () {
        rules.text = "Game Setup Stuff"
        gamesetuptriangle.isHidden = false
        gamerulestriangle.isHidden = true
        disclaimertriangle.isHidden = true
        memotriangle.isHidden = true
        //triangleY = NSLayoutConstraint(item: triangle!, attribute: .centerY, relatedBy: .equal, toItem: gamesetupbutton, attribute: .centerY, multiplier: 1, constant: 0)
        //gamesetupbutton.centerYAnchor.constraint(equalTo: triangle.centerYAnchor, constant: 0).isActive = true
        //triangle.centerYAnchor.constraint(equalTo: gamesetupbutton.centerYAnchor, constant: 0).isActive = true
    }
    func gameRules () {
        rules.text = "Game Rules Stuff"
        gamesetuptriangle.isHidden = true
        gamerulestriangle.isHidden = false
        disclaimertriangle.isHidden = true
        memotriangle.isHidden = true
    }
    func disclamir () {
        rules.text = "Disclaimer Stuff"
        gamesetuptriangle.isHidden = true
        gamerulestriangle.isHidden = true
        disclaimertriangle.isHidden = false
        memotriangle.isHidden = true
    }
    func memo () {
        rules.text = "Memo Stuff"
        gamesetuptriangle.isHidden = true
        gamerulestriangle.isHidden = true
        disclaimertriangle.isHidden = true
        memotriangle.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if previouspage == "start" || previouspage == "game" {
            gameRules()
        }
        else if previouspage == "extension" {
            gameSetup()
        }
        else {gameRules()}
        
//        rules.text = "abridged rules \n\n\n" + "extension screen: \n\n" + "filth meter indicates how dirty you want the questions to be. spray bottle is completely clean, the middle is normal, and the trash can is very dirty \n" + "select as many expansion packs and features as you'd like.\n" + "you can hold the buttons to view their labels\n" + "the graduation cap is the college themed expansion pack\n" + "the earth is the distance feature, removing any questions that must be played in real life\n" + "the skull is the brutal expansion pack, with questions that are sometimes just straight up mean\n" + "the virus is the coronavirus themed expansion pack\n\n" + "gameplay: \n\n" + "disclaimer! if you are not of age, play for points instead of for drinks! person with the most points at the end loses!\n" + "CENSUS: drink if it applies to you\n" + "WHO: the group votes on who a statement applies to most. that person drinks\n" + "MISC: cards are self explanatory\n" + "TOD: truth or dare or drink. either do what the card says, or take a drink\n" + "paranoia: minigame initated by one of the misc cards. one by one, press next card, but don't let the rest of the group see the phone. answer with the name of a person in the group, other than yourself. flip the coin. if it's heads, say the question. if it's tails, keep it secret"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameController {
            //returning info back to the game
            let game = segue.destination as! GameController
            game.truthtable = truthtable
            game.paranoiaMode = paranoiaMode
            game.deck = deck
            //game.paranoiaDeck = paranoiaDeck
            game.waspaused = true
            game.currentcard = currentcard
            game.exitbutton = exitbutton
            game.backbutton = backbutton
            game.nextcardbutton = nextcardbutton
        }
    }
    
    //figuring out where to return based on information that was passed in
    @IBAction func backpressed(_ sender: Any) {
        if previouspage == "start" {
            performSegue(withIdentifier: "helptostart", sender: self)
        }
        else if previouspage == "game" {
            performSegue(withIdentifier: "helptogame", sender: self)
        }
        else {
            performSegue(withIdentifier: "helptoextension", sender: self)
        }
    }
    
    @IBAction func gameSetupPressed(_ sender: Any) {
        gameSetup()
    }
    
    @IBAction func gameRulesPressed(_ sender: Any) {
        gameRules()
    }
    @IBAction func disclamirPressed(_ sender: Any) {
        disclamir()
    }
    
    @IBAction func memoPressed(_ sender: Any) {
        memo()
}

}
