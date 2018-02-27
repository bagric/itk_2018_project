import Foundation

// Feladat 18: nagy feladat 1
// Írj egy CaesarsCypher nevű osztályt ami komformál az Encryption protocolhoz
// A CaesarsCypher a jó öreg cézár titkosítást valósítsa meg
// A cézár titkosítás lényegében annyi, hogy a bemeneti karaktersort eltolja egy konstans értékkel
// Pl az "abc" eltolva 1 értékkel "bcd" 2 értékkel eltolva: "cde"
// Pl "Kismalac" eltolva 1 értékkel "Ljtnbmbd"

protocol Encryption {
    func encrypt(plaintext: String) -> String?
    func decrypt(cyphertext: String) -> String?
}

class CaesarsCypher: Encryption {
    func encrypt(message: String, shift: Int) -> String {

      func shiftLetter(ucs: UnicodeScalar) -> UnicodeScalar {
          let firstLetter = Int(UnicodeScalar("A").value)
          let lastLetter = Int(UnicodeScalar("Z").value)
          let letterCount = lastLetter - firstLetter + 1
  
          let value = Int(ucs.value)
          switch value {
          case firstLetter...lastLetter:
              // Offset relative to first letter:
              var offset = value - firstLetter
              // Apply shift amount (can be positive or negative):
              offset += shift
              // Transform back to the range firstLetter...lastLetter:
              offset = (offset % letterCount + letterCount) % letterCount
              // Return corresponding character:
              return UnicodeScalar(firstLetter + offset)!
          default:
              // Not in the range A...Z, leave unchanged:
              return ucs
          }
      }
  
      let msg = message.uppercased()
      return String(String.UnicodeScalarView(msg.unicodeScalars.map(shiftLetter)))
  }
  func decrypt(cyphertext: String) -> String? {
      return cyphertext
  }
  func encrypt(plaintext: String) -> String? {
      return plaintext
  }
}

var cezar = CaesarsCypher()

let message = "Attack at dawn"
print(cezar.encrypt(message: message, shift: 2))

// Érdemes a feladathoz létrehozni egy XCode command line projektet. XCode > New Project > macOS > Command Line Tool





