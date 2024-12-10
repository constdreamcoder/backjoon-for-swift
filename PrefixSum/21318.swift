//
//  21318.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/10/24.
//

import Foundation

/**
 설명 - 난이도 감소 구간 합 계산
 1. 난이도 배열에서 인접한 두 값의 크기를 비교하여 감소 여부를 계산한 배열(`array`) 생성.
 2. 누적 합 배열(`prefixSum`)을 생성하여 특정 구간의 감소 횟수를 빠르게 계산 가능.
 3. 쿼리마다 누적 합 배열을 사용해 구간 내 감소 횟수 계산.

 성능 분석
 1. 시간 복잡도
 - 감소 여부 계산: 난이도 배열 길이가 \( n \)일 때, 한 번 순회하며 계산하므로 \( O(n) \)입니다.
 - 누적 합 배열 생성: 배열의 길이 \( n \)에 대해 한 번 순회하므로 \( O(n) \)입니다.
 - 쿼리 처리: \( q \)개의 쿼리에 대해 누적 합 배열에서 값을 참조하므로 각 쿼리 \( O(1) \), 총 \( O(q) \)입니다.
 - 총 시간 복잡도: ** O(n + q) **

 2. 공간 복잡도
 - `array`: 감소 여부를 저장하는 배열은 길이 \( n \), 공간 복잡도 \( O(n) \).
 - `prefixSum`: 누적 합 배열은 길이 \( n+1 \), 공간 복잡도 \( O(n) \).
 - 입력 및 출력: 입력 난이도 배열과 쿼리를 처리하는 데 \( O(n + q) \).
 - 총 공간 복잡도: ** O(n + q) **
 */


let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

// 난이도 감소 여부 계산
var array = [Int](repeating: 0, count: n)
for i in 1..<input.count {
    if input[i-1] > input[i] {
        array[i] = 1
    } else {
        array[i] = 0
    }
}

// 누적 합 배열 생성
var prefixSum = [Int](repeating: 0, count: n+1)
for i in 1...array.count {
    prefixSum[i] = array[i-1] + prefixSum[i-1]
}

// 쿼리 처리
let q = Int(readLine()!)!
for _ in 0..<q {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    let x = query[0], y = query[1]
    let result = prefixSum[y] - prefixSum[x]
    print(result)
}

