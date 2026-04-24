import sys
from bisect import bisect_left, bisect_right, insort
from collections import Counter, OrderedDict, defaultdict, deque
from functools import lru_cache, reduce
from heapq import heapify, heappop, heappush
from itertools import accumulate, combinations, permutations, product
from math import ceil, floor, gcd, inf, log2, sqrt
from typing import List, Optional, Tuple

from sortedcontainers import SortedDict, SortedList  # if available

sys.setrecursionlimit(10**6)
