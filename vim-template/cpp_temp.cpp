/**************************************************************
 * Author: AdamMa
 * Mail: qq240814476@gmail.com
 * *************************************************************/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <queue>
#include <stack>
#include <algorithm>
#include <string>
#include <map>
#include <set>
#include <vector>
#include <cstring>
// tolower, toupper, isupper, islower, isdigit, isalpha
#include <cctype>

typedef pair<int, int> PII;
typedef vector<int> VI;
typedef vector<VI> VVI;

using namespace std;

// 单调队列, 求 k 区间 滑动窗口的最大值
//vector<int> maxSlidingWindow(vector<int>& nums, int k) {
//	vector<int> res;
//	deque<int> q;
//	for(int i = 0;i<nums.size();i++){
		// 1. 维护 monotonic
//		while(q.size() && nums[q.back()] <= nums[i]) q.pop_back();
		// 2. 压入 下标
//		q.push_back(i);
		// 3. 超过 k 范围 弹出 front
//		if(i - q.front() >= k) q.pop_front();
		// 4. 没到 k, 不记录
//		if(i+1 < k) continue;
		// 5. 记录每个队首
//		res.push_back(nums[q.front()]);
//	}
//	return res;
//}

// 二维数组 dp, 两个字符串, 求最长公共子序列
//int longestCommonSubsequence(string text1, string text2) {
		// dp[i][j]
		// if text1[i] == text2[j] dp[i][j] = dp[i-1][j-1] + 1;
		// else dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
//		int s1 = text1.size(), s2 = text2.size();
//		vector<vector<int>> dp(s1+1, vector<int>(s2+1, 0));
//		dp[0][0] = 0;
//		for(int i = 1;i<=s1;i++){
//				for(int j = 1;j<=s2;j++){
//						if(text1[i-1] == text2[j-1]){
//								dp[i][j] = dp[i-1][j-1] + 1;
//						} else {
//								dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
//						}
//				}
//		}
//		return dp[s1][s2];
//}

// 自定义排序 模版
// sort(a.begin(), a.end(), [](const auto &a, const auto &b){
// return a[1] > b[1];
// });

// 堆排序 heap, priority_queue
// auto cmp = [](const PII &a, const PII &b){
// 		// 1/3 , 3/ 5 统一分母, 比较 分子, 所以乘以分母
// 		// 1 * 5 , 3 * 3
// 		return a.first * b.second > a.second * b.first;
// };
// priority_queue<PII, vector<PII>, decltype(cmp)> q(cmp);

// set 红黑树
// set<int> s;
// s.insert(x);
// s.erase(x);
// use binary search
// auto iter = s.lower_bound(s.begin(), s.end(), val). get first iter >= val
// auto iter = s.upper_bound(s.begin(), s.end(), val) get first iter > val
// int iterVal = *iter;
// int iterPos = iter - s.being();

// dp 板子
//int rob(vector<int>& nums) {
	// 1.确定dp数组以及下标的含义
	// 2. 确定递推公式
	// 3. dp数组如何初始化
	// 4. 确定遍历顺序
	// 5. 举例推导dp数组
//	int n = nums.size();
//	vector<vector<int>> dp(2, vector<int>(2, 0));
//	dp[0][1] = nums[0];
//	for(int i = 1;i<n;i++){
//		int cur = i % 2, pre = cur ^ 1;
//		dp[cur][0] = max(dp[pre][0], dp[pre][1]); // 如果当前不拿, 前一个可拿可不拿, 此时取最大值, 实现局部最优
//		dp[cur][1] = dp[pre][0] + nums[i];
//	}
//	int ind = (n-1) % 2;
//	return max(dp[ind][0], dp[ind][1]);
//}

// quick sort
// 45113
// base = 4 , x = 0, y = 4
// 3514 x = 1, y = 4
// y = 3, x = 2 31154
//
//void quickSort(VI &arr, int l, int r){
//	while(l<r){
//		int x = l, y = r, base = arr[x];
//		while(x<y){
//			// 左侧是大于等于 base 的
//			while(x < y && arr[y] >= base) y--;
			// 如果此时 x < y, arr[x] arr[y] 交换 x 后移一位, y 不移动, 因为 下一个位置 的 y 没有和 base 比较过, 未知
//			if(x<y) swap(arr[x++], arr[y]);
//			while(x < y && arr[x] <= base) x++;
//			if(x<y) swap(arr[x], arr[y--]);
//		}
//		quickSort(arr, x+1, r);
//		r = x-1;
//	}
//}

int main(){
  return 0;
}
