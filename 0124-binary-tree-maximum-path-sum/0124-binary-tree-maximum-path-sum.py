class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Solution:
    def maxPathSum(self, root: TreeNode) -> int:
        self.ans = float('-inf')

        def helper(node):
            if not node:
                return 0
            
            left = max(0, helper(node.left))
            right = max(0, helper(node.right))

            self.ans = max(self.ans, node.val + left + right)

            return node.val + max(left, right)

        helper(root)
        return self.ans
        