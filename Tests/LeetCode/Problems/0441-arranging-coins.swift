/**

 # Arranging Coins

 ## Description

 You have `n` coins and you want to build a staircase with these coins. The
 staircase consists of `k` rows where the `ith` row has exactly `i` coins. The
 last row of the staircase **may be** incomplete.

 Given the integer `n`, return _the number of **complete rows** of the
 staircase you will build_.

 **Example 1:**

 ![](https://assets.leetcode.com/uploads/2021/04/09/arrangecoins1-grid.jpg)

     **Input:** n = 5
     **Output:** 2
     **Explanation:** Because the 3rd row is incomplete, we return 2.

 **Example 2:**

 ![](https://assets.leetcode.com/uploads/2021/04/09/arrangecoins2-grid.jpg)

     **Input:** n = 8
     **Output:** 3
     **Explanation:** Because the 4th row is incomplete, we return 3.

 **Constraints:**

   * `1 <= n <= 231 - 1`

 **Difficulty:** Easy

 **Link**: <https://leetcode-cn.com/problems/arranging-coins>

 */

import XCTest

private class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var row = 1

        if n == 1 { return row }
        for i in 2 ..< n {
            if i * i + i > 2 * n {
                return row
            } else {
                row += 1
            }
        }

        return row
    }

    // 二分查找法
    func arrangeCoins2(_ n: Int) -> Int {
        var left = 1
        var right = n

        while left < right {
            let mid = left + (right - left + 1) / 2
            let val = (mid * mid + mid) / 2
            if val == n {
                return mid
            } else if val < n {
                left = mid
            } else if val > n {
                right = mid - 1
            }
        }

        return left
    }
}

class TestSolution0441: XCTestCase {
    func test1() {
        XCTAssertEqual(Solution().arrangeCoins(1), 1)
        XCTAssertEqual(Solution().arrangeCoins(5), 2)
        XCTAssertEqual(Solution().arrangeCoins(8), 3)
    }

    func test2() {
        XCTAssertEqual(Solution().arrangeCoins2(1), 1)
        XCTAssertEqual(Solution().arrangeCoins2(3), 2)
        XCTAssertEqual(Solution().arrangeCoins2(2), 1)
        XCTAssertEqual(Solution().arrangeCoins2(5), 2)
        XCTAssertEqual(Solution().arrangeCoins2(8), 3)
    }
}
