//
//  ViewController.swift
//  Silly Song
//
//  Created by Enrique Torrendell on 11/13/16.
//  Copyright © 2016 Enrique Torrendell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var textSong: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.delegate = self
        
    }

    func shortNameFromName(name: String) -> String {
        
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        
            if let firstVowelRange = lowercaseName.rangeOfCharacter(from: vowelSet, options: .caseInsensitive) {
            return lowercaseName.substring(from: firstVowelRange.lowerBound)
        }
        
        // No vowels - return the full name
        return lowercaseName
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameFromName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        self.textSong.text = lyrics
        
        return lyrics
    }
    

    @IBAction func reset(_ sender: Any) {
        self.textSong.text = ""
        self.nameLabel.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        let crazyLyrics = "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME> \n" + "Banana Fana Fo F<SHORT_NAME> \n" + "Me My Mo M<SHORT_NAME> \n" + "<FULL_NAME>"
        
        lyricsForName(lyricsTemplate: crazyLyrics, fullName: nameLabel.text!)
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    

}

