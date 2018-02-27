import Foundation

// Feladat 20: nagy feladat 3
// Írj egy általános Life-like cellular automaton-t
// A Game of Life általánosítását kell megcsinálni

// Van egy négyzethálós cellákból áló mezőnk ahol minden cella vagy él vagy halott
// Iterációnként értékeljük ki a szabályokat és döntjük el, hogy melyik mező él vagy hal meg
// Minden cellának vannak szomszédai, összesen max 8 szomszédja lehet egy cellának (széleken kérdéses)

// Két féle szabály van:
//      * Survive (S): felsorolás szerűen hány darab élő szomszéd esetén él túl egy cella a következő iterációba
//      * Born (B): felsorolás szerűen hány darab élő szomszéd esetén születik (támad fel) egy cella

// A megejelnítést command lineon csináljátok jó öreg ascii art segítségével
// Ehhez is érdemes egy XCode command line projektet csinálni

// Pl. A jól ismert Game of Life kifejezhető ezekkel a szabályokkal: B3/S23
//          * pontosan 3 szomszéd esetén feltámad egy cella
//          * pontosan 2 vagy 3 szomszéd esetén túlél egy már élő cella a következő iterációba

class Cell {
  let x: Int, y: Int
  var state: State
  
  init (x: Int, y: Int) {
    self.x = x
    self.y = y
    state = .NeverLived
  }
}

enum State {
  case Alive, Dead, NeverLived
}
class World {
  
  var cells: [Cell]
  let dimensions: Int = 20
  
  init() {
    cells = [Cell]()
    
    // create the cells
    for x in 0..<dimensions {
      for y in 0..<dimensions {
        cells.append(Cell(x: x, y: y))
      }
    }
  }
  
  subscript (x: Int, y: Int) -> Cell? {
      return cells.filter { $0.x == x && $0.y == y }.first
  }
  func iterate() {
    
    // utility functions - cannot reference a local function from another
    // local function, hence defined as constant closures
    let cellsAreNeighbours = {
      (op1: Cell, op2: Cell) -> Bool in
      let delta = (abs(op1.x - op2.x), abs(op1.y - op2.y))
      switch (delta) {
      case (1,1), (1,0), (0,1):
        return true
      default:
        return false
      }
    }
    
    let neighboursForCell = {
      (cell: Cell) -> [Cell] in
      return self.cells.filter { cellsAreNeighbours(cell, $0)}
    }
    
    let livingNeighboursForCell = {
      (cell: Cell) -> Int in
      neighboursForCell(cell).filter{ $0.state == State.Alive }.count
    }
    
    // rules of life
    let liveCells = cells.filter { $0.state == .Alive }
    let deadCells = cells.filter { $0.state != .Alive }
    
    let dyingCells = liveCells.filter { 2 > livingNeighboursForCell($0) || 3 < livingNeighboursForCell($0) }
    let newLife =  deadCells.filter { livingNeighboursForCell($0) == 3 }
    
    // updating the world state
    for newL in newLife {
        newL.state = .Alive
    }
    for dyingC in dyingCells {
        dyingC.state = .Dead
    }
    for x in 0..<dimensions {
        print("|", terminator: " ");
      for y in 0..<dimensions {
          for cell in cells {
              if(cell.x == x && cell.y == y) {
                  switch cell.state {
                    case .Alive:
                      print("O", terminator: " ");
                    case .Dead:
                      print("X", terminator: " ");
                    case .NeverLived:
                      print("M", terminator: " ");
                  }
              }
          }
        }
      print("|");
    }
  }
}
var array3D: [[Int]] = [[10, 10], [10, 11], [11, 10], [9, 10]]
var vilagocska: World = World()
vilagocska.iterate()
for pos in array3D {
    for cell in vilagocska.cells {
        if(cell.x == pos[0] && cell.y == pos[1]) {
            cell.state = .Alive
        }
    }
}
vilagocska.iterate()
