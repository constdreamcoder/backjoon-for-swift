//
//  11659.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/5/24.
//

import Foundation

/**
 설명 - 누적 합을 이용한 구간 합 구하기
 1. `prefixSum`은 입력 배열의 누적 합을 저장하는 배열로 초기화됩니다.
    - `prefixSum[i]`는 입력 배열의 1번째 요소부터 i번째 요소까지의 합을 나타냅니다.
 2. 질의는 `m`번 입력받으며, 각 질의마다 구간 [i, j]의 합을 계산합니다.
    - `prefixSum[j] - prefixSum[i - 1]`을 통해 O(1) 시간에 구간 합을 구할 수 있습니다.
 3. 모든 질의 결과를 저장한 뒤 출력합니다.

 성능 분석
 1. 시간복잡도
 - 누적 합 계산: 입력 배열 크기 \(n\)에 비례하여 **O(n)**의 시간 복잡도를 가집니다.
 - 질의 처리: 각 질의에 대해 `prefixSum[j] - prefixSum[i - 1]`을 계산하므로, 한 질의는 **O(1)**의 시간 복잡도를 가집니다.
 - \(m\)개의 질의를 처리하므로, 전체 질의 처리 시간은 **O(m)**입니다.
 - 따라서 전체 시간 복잡도는 **O(n + m)**입니다.

 2. 공간복잡도
 - 입력 배열의 크기: **O(n)**.
 - 누적 합 배열의 크기: **O(n + 1)**.
 - 결과 저장을 위한 추가 공간: **O(m)**.
 - 따라서 전체 공간 복잡도는 **O(n + m)**입니다.
 */

// 입력 받기
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 배열의 크기
let m = nm[1] // 질의의 개수

// 배열 입력
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

// 누적 합 배열 생성
var prefixSum = Array(repeating: 0, count: n + 1)
for i in 1...n {
    prefixSum[i] = prefixSum[i - 1] + numbers[i - 1]
}

// 질의 처리
var results = [Int]()
for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let i = ij[0], j = ij[1]
    results.append(prefixSum[j] - prefixSum[i - 1])
}

// 결과 출력
results.forEach { print($0) }
