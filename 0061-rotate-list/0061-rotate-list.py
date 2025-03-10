class Solution:
    def rotateRight(self, head, k):
        if not head or not head.next or k == 0:
            return head  # Edge cases
        
        # Step 1: Find the length of the list
        length = 1
        last = head
        while last.next:
            last = last.next
            length += 1

        # Step 2: Optimize k
        k = k % length
        if k == 0:
            return head  # No rotation needed

        # Step 3: Find the new tail
        prev = head
        for _ in range(length - k - 1):
            prev = prev.next

        # Step 4: Perform the rotation
        newHead = prev.next
        prev.next = None
        last.next = head

        return newHead
        