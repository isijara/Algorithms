//: [Previous](@previous)

import Foundation
// Add any extra import statements you may need here

class Node {
  let data: Int
  let left: Node?
  let right: Node?
    
  init(_ data: Int, left: Node? = nil, right: Node? = nil) {
    self.data = data
    self.left = left
    self.right = right
  }
}

private extension Node {
  // Add any helper functions you may need here
  func traverseLeftTree(_ stack: [Node?]) -> Int {
    if stack.isEmpty {
      return 0
    }
    
    var newLevelStack: [Node?] = []
    
    for node in stack {
      if let leftNode = node?.left  {
        newLevelStack.append(leftNode)
      }
      if let rightNode = node?.right {
        newLevelStack.append(rightNode)
      }
    }
    
    return traverseLeftTree(newLevelStack) + 1
  }
  
  
  var visibleNodes: Int {
    // Write your code here
    return traverseLeftTree([self])
  }
}

/// MARK: Test Utils
var testCaseNumber = 1

private func check(_ expectedValue: Int, matches output: Int) {
  let rightTick = "\u{2713}";
  let wrongTick = "\u{2717}";
    
  let result = expectedValue == output
  if result {
      print("\(rightTick) Test #\(testCaseNumber)")
  } else {
      print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue) Your output: \(output)")
  }
  testCaseNumber += 1
}

/// MARK: Test cases

let root1 = Node(8,
                 left: Node(3,
                            left: Node(1),
                            right: Node(6,
                                        left: Node(4),
                                        right: Node(7))),
                 right: Node(10,
                             right: Node(14,
                                         left: Node(13))))

check(4, matches: root1.visibleNodes)

let root2 = Node(10,
                 left: Node(8,
                            left: Node(4,
                                       right: Node(5,
                                                   right: Node(6)))),
                 right: Node(15,
                             left: Node(14),
                             right: Node(16)))

check(5, matches: root2.visibleNodes)


// Add your own test cases here

let root3 = Node(8,
                left: nil,
                right: nil)
check(1, matches: root3.visibleNodes)

//: [Next](@next)
