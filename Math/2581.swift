//
//  2581.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/22/24.
//

import Foundation

/**
 설명 - 소수 판별 및 범위 내 소수의 합과 최소값 구하기
 1. **소수 판별 함수 `isPrime`**
    - 주어진 수가 소수인지 판별하기 위해 2부터 해당 수 미만까지 반복문을 실행하며, 하나라도 나누어 떨어지면 소수가 아니라고 판단합니다.
    - 소수가 맞다면 true를 반환합니다.
 2. **범위 내 소수 처리**
    - 입력받은 두 정수 `m`과 `n` 사이의 숫자를 순회하면서 `isPrime` 함수를 사용하여 소수를 판별합니다.
    - 소수인 경우, 해당 값을 `sum`에 더하고 `minimum` 값을 갱신합니다.
 3. **결과 출력**
    - 소수의 합(`sum`)이 0보다 크고 최소값(`minimum`)이 초기값보다 작다면 합과 최소값을 출력합니다.
    - 그렇지 않으면 -1을 출력합니다.

 성능 분석
 1. **시간복잡도**
    - 소수 판별 함수 `isPrime`의 시간 복잡도:
        - 주어진 수 `x`에 대해 최대 \( x - 2 \)까지 반복하므로 \( O(x) \)입니다.
    - `m...n` 범위 내에서 `isPrime`을 호출하므로 총 시간 복잡도는:
        - \( O(n \cdot x) \), 여기서 \( n - m + 1 \)개의 수를 검사하고 각 검사에서 \( x \)만큼 반복합니다.
        - \( n \)과 \( x \)의 관계에 따라 최악의 경우 시간 복잡도는 \( O(n^2) \)입니다.
 2. **공간복잡도**
    - 상수 공간을 사용하여 변수 `sum`, `minimum`을 저장하고, 소수 판별 함수 내부에서도 \( O(1) \)의 공간만 사용합니다.
    - 따라서 공간 복잡도는 \( O(1) \)입니다.
 */


func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var sum = 0
var minimum = 10_000

for num in m...n {
    if isPrime(num) {
        sum += num
        minimum = min(minimum, num)
    }
}

if sum > 0 && minimum < 10_000 {
    print(sum)
    print(minimum)
} else {
    print(-1)
}
