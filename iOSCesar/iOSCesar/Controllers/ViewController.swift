//
//  ViewController.swift
//  iOSCesar
//
//  Created by Marlon Chalegre on 13/04/18.
//  Copyright © 2018 CESAR School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var  i : Int = 4
     var game: MemoryGame!
    var emoticonDict = [Int:String]()
    var emoticons = ["👻", "🎃", "💀", "😈", "😱", "🦇", "🕷", "🤡", "🕸", "🦉","😄","😟","🤬","🤣","😍","😰"]
    
    @IBOutlet weak var labelJogadas: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        self.game = MemoryGame(numberOfPairs: (cardButtons.count/2))
        embaralhar()
    }
    
    func reiniciar(){
        var cards = game.cards
        for index in cardButtons.indices {
            cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            cardButtons[index].isEnabled = true
            cards[index].isMatched  = false
            cards[index].isUp  = false
            cardButtons[index].setTitle("", for: .normal)
         }
        self.game = MemoryGame(numberOfPairs: (cardButtons.count/2))
        self.game.jogadas = 0
        self.labelJogadas.text = "Jogadas: \(  self.game.jogadas )"

    }
    
    
    func embaralhar(){
        for _ in 0 ..< cardButtons.count * i {
            let cardButton = self.cardButtons.remove(at: Int(arc4random_uniform(UInt32(self.cardButtons.count))))
            self.cardButtons.insert(cardButton, at: Int(arc4random_uniform(UInt32(self.cardButtons.count))))
        }
    }
    
    func updateGameScreen() {
        var cards = game.cards
        var isThereMatched = true
      
        for index in cardButtons.indices {
            if cards[index].isUp {
                cardButtons[index].setTitle(selectEmoticon(for: cards[index].indentifier), for: .normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
                cardButtons[index].isEnabled = false

            } else {
                cardButtons[index].setTitle("", for: .normal)
                cardButtons[index].backgroundColor = cards[index].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                cardButtons[index].isEnabled = cards[index].isMatched ? false : true
                
            }
            if(!cards[index].isMatched ){
                isThereMatched = false
            }
        }
        if(isThereMatched){
            let alert = UIAlertController(title:"Fim do jogo",message:"Deseja reiniciar o jogo?",preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title:"Reiniciar",style: .default,handler:{(action) in self.reiniciar()}))
            alert.addAction(UIAlertAction(title:" Home",style: .destructive,handler:{
                (action) in self.navigationController?.popViewController(animated: true)
            }))
            present(alert,animated: true)
        }
        self.labelJogadas.text = "Jogadas: \(self.game.jogadas)"

    }
    
    @IBAction func selectCard(_ sender: UIButton) {
        var position = 0
        for i in cardButtons.indices {
            if sender == cardButtons[i] {
                position = i
                break
            }
        }
        game.chooseCard(at: position)
        updateGameScreen()
    }
    
    func selectEmoticon(for id: Int) -> String {
        if emoticonDict[id] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emoticons.count)))
            emoticonDict[id] = emoticons.remove(at: randomIndex)
        }
        return emoticonDict[id]!
    }
}

