---
Title: Leetcode
Author: m
Date: 26082023
---
# Intro
Started it and it feels more completed and concentrated than codewars. More tasks regarding algorithms. So,


## Dynamic Programming - Climbing Stairs

Meta | Content
-----|-----------
Date | 2023-03-30T11:40:33+03:00
Link | [link to task](https://leetcode.com/explore/interview/card/top-interview-questions-easy/97/dynamic-programming/569/)

### My solution

This is general dynamic programming problem, which i meet very often. There are modificatioons of course, but this one is most often used i guess

Problem is that basic recoursive solution leads to O(n2) time. Because for each node we start recursion again and again...
Solutiuon for this is actually caching: base next steps on prvious ones. Stairs list contains solutions for previous number of stairs - which eliminates duplicate calculations.

And next step here is to see that actually results of this function is Fibonacci sequence - so move to regular Fibonacci solution

And next step is to remember that there are more efficient algorithms to fin Fibonacci numbers

```python
def climbStairs(self, n):
    if n < 3:
        return n

    stair = [0] * (n + 1)
    stair[1] = 1
    stair[2] = 2
    for i in range(3, n + 1):
        stair[i] = stair[i - 1] + stair[i - 2]    
    return stair[n]
```

---

## Max Subarray

Meta | Content
-----|-----------
Date | 2023-03-31T10:31:46+03:00
Link |

## Problem

You need to find subarray with maximum sum. Main idea of solutions is this:

Bruteforce approach -
	- iterate through each element,
	- find maximum starting from this element to each of the following
2 loops, both are N at maximum, so - O(n2)

Simple and intuitive suggestion can imoprove this complexity to O(n)!

## Kadane Algoiyhtm

Lets iterate through each element. For each element, local maximum (of all subarrays between index 0 and current) can be achieved by comparison only 2 maxes - [previous subarray, current element] and [current element]. We can definitely say this way, because maximum for [previous subarray] is already solved during previuos iterations! If we know all local maximums for each element, we can determine global maximum, just by comparing local ones

So, instead of counting this subarrays maximums again and again, we use our previous siolutions in each new iteration.


### My solution - Kadane algorythm

```python
    def maxSubArray(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        local_max = - float("inf")
        global_max = - float("inf")
        for e in nums:
            local_max = max(e, e + local_max)
            if global_max < local_max:
                global_max = local_max
        return global_max
```

## Divide and Conquer Approach

To solve the problem, generally we need to find 2 numbers - start and end index of maximum subarray. This is what causes O(n x n) in brute-force approach.

In this method, for any subarray, we can split it into 2 halves. Max subarray can be:
	- either completely in left side,
	- or completely in right side,
	- or crossing center (index by which we splitted subarray)
For 1 and 2, we can just recursively call the same function. For last one, main advantage of this is that we can split this point into to: left and right, and we KNOW end point for left max and start point for right one - and the we just sum those 2 maxes - and it will be maximum of subarray, cerossing center line. Because we know this start/end point, task of finding left edge and right edge is linear (maximum (n/2 + n/2) if max_subarray == array).
Complexity of this soultion is O(n x log(n)). log(n) part is recoursive dividing (same as binary search). n part is linear search of local maximum for subarray, which crosses center.

It is worse than Kadane algoerythm, but it gives an approach which can be used in different algorythms.

### My soultion - Divide and Conquer

def maxSubArray(self, nums):
    """
    :type nums: List[int]
    :rtype: int
    """
    if len(nums) == 1:
        return nums[0]

    middle_index = len(nums) // 2
    left_max = self.maxSubArray(nums[:middle_index])
    right_max =  self.maxSubArray(nums[middle_index:])

    local_max_left = -float("inf")
    acc1 = 0
    for i in range(middle_index-1, -1, -1):
        acc1 += nums[i]
        if acc1 > local_max_left:
            local_max_left = acc1

    local_max_right = -float("inf")
    acc2 = 0
    for i in range(middle_index, len(nums), 1):
        acc2 += nums[i]
        if acc2 > local_max_right:
            local_max_right = acc2

    crossing_center_max = local_max_left + local_max_right
    return max(left_max, right_max, crossing_center_max)

----

## Dynamic Programming - Robber

    Meta | Content
    -----|-----------
    Date | 2023-04-04T13:51:02+03:00
    Link | [link to task](https://leetcode.com/explore/interview/card/top-interview-questions-easy/97/dynamic-programming/576/)

### My solution
    Basically, i struggled how to solve such problems without knowing actual algorythm. You can do bruteforce, of course; but definitely, this is not optimal and really ugly solution. In this case, basic recoursive bruteforce is actually O(2n)!!

    Great approach which i found is described here, according to this specific task:
    [here](https://leetcode.com/problems/house-robber/solutions/156523/From-good-to-great.-How-to-approach-most-of-DP-problems)

    We start with basic recursive, than try dynamic approach - store what is calculated in map, then eliminate recursive, than optimise storage. Will this one in next tasks!


```python
    class Solution(object):  
        def rob(self, nums):
            """
            :type nums: List[int]
            :rtype: int
            """
            memo = [0] * (len(nums)+1)
            print(len(memo), len(nums))

            if not len(nums):
                return 0
            if len(nums) == 1:
                return nums[0]

            memo[0] = 0
            memo[1] = nums[0]
            for i in range(len(nums)):
                memo[i+1] = max(memo[i-1] + nums[i], memo[i])
                print(memo)

            return memo[i+1]
```
