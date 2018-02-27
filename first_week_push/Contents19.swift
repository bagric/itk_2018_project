import Foundation

// Feladat 19: nagy feladat 2
// Írj egy OneTimePad nevű osztályt ami a one-time-pad titkosítást valósítja meg
// A OneTimePad komformáljon az Encryption protocolhoz
// A one-time pad titkosítás feltörhetetlen (tényleg)
// A one-time pad titkosítás lényegében annyi, hogy egy szövegnek a karaktereit eltolja egy másik "kulcs" karaktersorozat értékeivel
// Ehhez is érdemes egy XCode command line projektet csinálni

// Pl "abc" eltolva a "afd" kulcsal: "bhg"
// (mert a: 1, b: 2, c: 3    a: 1, f: 6, d: 4  a+a = 1+1 = 2 = b, b+f = 2+6 = 8 = h, c+d = 3+4 = 7 = g -> "bhg")

//Későn fogtam neki ezért végül feladtam és inkább átnéztem egyet részletesebben a netről

import UIKit

protocol Encryption {
    func encrypt(plaintext: String) -> String?
    func decrypt(cyphertext: String) -> String?
}

class OneTimePad: Encryption {
    static let shared = OneTimePad()
    init() {}
    
    func encrypt(text: String) -> (text: String, key: [Int])
    {
        let text = text.lowercased()
        let key = self.key(count: text.characters.count)
        let map = self.map()
        var output = String()
        
        for (index, character) in text.characters.enumerated() {
            if character == " " {
                output.append(character)
            }
            
            else {
                if let letterIndex = map.forward[String(character)] {
                    let keyIndex = key[index]
                    let outputIndex = (letterIndex + keyIndex + map.lastCharacterIndex) % map.lastCharacterIndex
                    if let outputCharacter = map.reversed[outputIndex] {
                        output.append(outputCharacter)
                    }
                }
            }
        }
        
        return (text: output.uppercased(), key: key)
    }
    
    func decrypt(text: String, key:[Int]) -> String
    {
        let text = text.lowercased()
        let map = self.map()
        var output = String()
        
        for (index, character) in text.characters.enumerated() {
            
            if character == " " {
                output.append(character)
            }
                
            else {
                if let letterIndex = map.forward[String(character)] {
                    let keyIndex = key[index]
                    let outputIndex = (letterIndex - keyIndex + map.lastCharacterIndex) % map.lastCharacterIndex
                    if let outputCharacter = map.reversed[outputIndex] {
                        output.append(outputCharacter)
                    }
                }
            }
            
        }
        
        return output
    }
    
    // MARK: Helper Functions
    
    private let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    private func key(count: Int) -> [Int]
    {
        var key = [Int]()
        
        for _ in 0..<count {
            key.append(Int(arc4random() % 26))
        }
        
        return key
    }
    
    private func map() -> (forward: [String : Int], reversed: [Int : String], lastCharacterIndex: Int)
    {
        var forward = [String : Int]()
        var reversed = [Int : String]()
        var lastCharacterIndex = 0
        
        for (index, letter) in self.alphabet.enumerated() {
            forward[letter] = index
            reversed[index] = letter
            lastCharacterIndex = index
        }
        
        return (forward: forward, reversed: reversed, lastCharacterIndex: lastCharacterIndex)
    }
    func decrypt(cyphertext: String) -> String? {
        return cyphertext
    }
    func encrypt(plaintext: String) -> String? {
        return plaintext
    }
}

var onetime = OneTimePad()

let message = "Attack at dawn"
print(onetime.encrypt(text: message))

// Érdemes a feladathoz létrehozni egy XCode command line projektet. XCode > New Project > macOS > Command Line Tool





