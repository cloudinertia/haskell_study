what is functional programming?

overall

- 함수를 프로그램의 기본 단위로 보고 조합해나감

functions and types & composition

- 하스켈은 기본적으로 함수를 left associativity로 적용하기 때문에, 함수 적용시에 순서를 항상 유념한다.
  - e.g
"""haskell
    > log ( sin theta )
    > -- not log sin theta
"""

- 특히 합성함수 f\cdot g(x) 같은경우 인자 x는 g에 먼저 적용되어야 함을 잊지말자.

example: common words

- 교훈: 항상 문제를 함수의 연속된 적용으로 풀려고 노력하자(pipelining)
- 예를들어 특정 string내에 있는 단어중 최빈 단어 n개를 뽑으려 한다면
  - 우선 string을 word로 쪼개야 한다 ( [Char] => [Word])
  - 쪼갠 word는 소문자로 표준화시켜준다 ([Word] -> [Word])
  - 단어를 알파벳순으로 정렬한다 ([Word] -> [Word])
  - 정렬한 단어를 그룹화한다 ([Word] -> [[Word]])
  - 그룹화한 단어를 세어 tuple로 나타낸다 ( [[Word]] -> [(Word,Int)])
  - 최빈단어로 정렬한다
  - 가장 자주나오는 단어부터 n번째 단어까지 take한다

