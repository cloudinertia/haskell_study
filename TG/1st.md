# Haskell Study 1st

## 1. Function

* 함수형 프로그래밍은 명령이나 그들의 실행보다 함수를 강조하는 프로그램 설계 방법이다.
* 함수형 프로그래밍은 문제를 엄격하고 간결하게 묘사할 수 있는 간단한 수학적 Notation을 사용한다. (대개 구체적인 방법을 제시하기 보다는 재귀 등을 이용하여 문제를 해결한다.)
* 함수형 프로그래밍의 함수는 수학의 함수와 동치이다.

### 1) Functional Composition


```haskell
f :: Y -> Z
g :: X -> Y

f.g :: X -> Z --(f.g)x = f(g(x))
```

예를 들어 sin(cos(pi/2)) 를 구현하기 위해서 하스켈에서는 다음과 같이 쓴다.

```haskell
(sin.cos) (pi/2)
```

주의해야할 점은, 함수는 왼쪽부터 합성되므로 두 개 이상의 함수를 표현할때는 필히 괄호로 구분해준다.

### 2) Project: Number 2 Words

책의 예제와 거의 동등하나 마지막에 추가적으로 convert 라는 함수를 만들어 일반화 시켜보았다.
코드는 다음과 같다.

```haskell
convert :: Int -> String
convert n | n < 10 = convert1 n
          | n < 100 = convert2 n
          | n < 1000 = convert3 n
          | n < 1000000 = convert6 n
```

책에 있는 모든 코드를 입력했을때, 이 코드를 사용할 수 있다.

## 2. Expressions & Types & Values

### 1) Section & Lambda

보통 우리는 함수를 Explicit하게 작성한다.

```haskell
succ, double :: Int -> Int
succ, n = n + 1
double n = 2*n
```

하지만 하스켈에서는 Section이라 불리는 신기한 기능을 제공하는데, Section에서는 하나의 연산자와 한 개의 argument가 괄호 안에 들어간다.

```haskell
(+1) n = n + 1
(0<) n = 0 < n
(<0) n = n < 0
(1/) x = 1 / x
```
Section들은 합성도 지원하는데, 다음과 같이 사용한다.

```haskell
((+1).(*2)) 3
```

으레 함수형 언어들이 그렇듯이 하스켈도 Lambda Calculus에 그 근간을 두고 있는데, 따라서 Lambda 표현식을 갖고 있다. 용례는 다음과 같다.

```haskell
map (\n -> 2*n + 1) [1..5]
```

### 2) Lazy Evaluation

하스켈은 적극적 계산을 장려하는 OCaml과 다르게 게으른 계산을 사용한다. 따라서 다음과 같은 예시도 가능하다.

```haskell
infinity :: Integer
three :: Integer -> Integer
infinity = infinity + 1
three x = 3

three infinity
```

보통의 언어는 Stack Overflow Error가 발생하겠지만, 하스켈에서는 3이 나온다. 따라서 이를 이용하여 무한 공재귀 및 스트림 등의 자료 구조를 사용할 수 있다. (Scala에서 실험해본 결과로는 리스트를 순회하는 것과 스트림을 순회하는 것은 10배 정도의 속도 차이를 보인다.)
하지만, 게으른 것이 항상 좋은 것은 아닌데 대입하고 계산하는 것이 쉬운  몇몇 계산에서 (ex: Factorial) 적극적인 계산은 지속적인 대입으로 메모리 절약을 하는 반면, 게으른 계산이 좀 더 메모리를 소비하는 경우도 있다. 또한, 리스트 전체를 이용해야 하는 작업에서는 오히려 게으름이 좋지 않을 수 있다.
