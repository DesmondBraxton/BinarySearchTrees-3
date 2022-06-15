import UIKit


// generic trees keep use an array to keep track of their children


class TreeNode {
    var value: Int
    var leftChild: TreeNode?
    var rightChild: TreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
}

extension TreeNode {
    func insert(_ newValue: Int) {
        if newValue < value {
        // go left if newValue is greater than the current node's value
            if leftChild != nil {
        // keep insert recursively on the left node
            leftChild!.insert(newValue)
        } else { // go right
        // Create a new node and attach as leftChild
        leftChild = TreeNode(newValue)
            }
        } else { // go right
        if rightChild != nil { // call insert recursively in the right
            rightChild!.insert(newValue)
        } else {
            rightChild = TreeNode(newValue)
            }
        }
    }
    
        // Search Logic(contains)
    /*
     
     1) first check the value of the current node
     2) if target value is less than the current node then go left
     3) else search the right side
     */
    
    func contains(_ targetValue: Int) -> Bool {
        if targetValue == value { // Step 1
            return true
        }
        if targetValue < value { // step 2
            if leftChild != nil { // we call .contains recursively, we also force unwrap the optional Node
                return leftChild!.contains(targetValue)
            } else {
                return false
            }
        } else {  // 3
            if rightChild != nil {
                return rightChild!.contains(targetValue)
            }  else {
                return false
            }
        }
    }
    //While using in order traversal we visit the left node, before the root, then the right node.
    
    // If the nodes are printed in acending order, that means this is a binary search tree.
    
    func inOrderTraversal() {
        leftChild?.inOrderTraversal()  // visit left node
        print("\(value)", terminator: " ")   // visits current node
        rightChild?.inOrderTraversal() // visits right node
        }
    }
}
// insert and remove values
// Write a function  that takes in a value and adds anode to the earch tree
/*
        12
      /   \
    5      32
 
 */


    
// constructing nodes first
let rootNode = TreeNode(12)
rootNode.insert(5)
rootNode.insert(32)

rootNode.inOrderTraversal()
