//
//  11660.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/9/24.
//

import Foundation

/**
 설명 - 2차원 배열의 누적합을 계산하고 특정 구간의 합을 구합니다.
 1. 입력된 \( n \times n \) 크기의 2차원 배열에서 누적합을 계산하여 저장할 \( (n+1) \times (n+1) \) 크기의 배열을 생성합니다.
 2. 누적합 배열의 각 위치에 대해 다음 공식을 사용해 누적합을 계산합니다:
    - \(\text{prefixSum}[i][j] = \text{array}[i-1][j-1] + \text{prefixSum}[i-1][j] + \text{prefixSum}[i][j-1] - \text{prefixSum}[i-1][j-1]\)
 3. 주어진 \( m \)개의 쿼리에 대해 구간 합을 계산하여 출력합니다:
    - 구간 합 공식: \(\text{sum} = \text{prefixSum}[x_2][y_2] - \text{prefixSum}[x_2][y_1-1] - \text{prefixSum}[x_1-1][y_2] + \text{prefixSum}[x_1-1][y_1-1]\)
 4. 결과적으로, 구간 합 계산을 효율적으로 수행할 수 있습니다.

 성능 분석
 1. 시간복잡도
 - 입력 배열 초기화: \( O(n^2) \).
 - 누적합 배열 계산: \( O(n^2) \).
 - 쿼리 처리: \( O(m) \) (각 쿼리는 상수 시간에 처리).
 - 총 시간 복잡도: **\( O(n^2 + m) \)**.
 - 입력 크기가 \( n, m \leq 100 \)에서 최악의 경우 \( 10,000 + 100 = 10,100 \)번의 연산으로 제한 시간 내에서 충분히 처리 가능합니다.

 2. 공간복잡도
 - 배열 `array`: 입력 배열을 저장하므로 **\( O(n^2) \)**.
 - 배열 `prefixSum`: 누적합 배열을 저장하므로 **\( O((n+1)^2) \)**.
 - 기타 변수: 상수 크기의 변수만 사용하므로 **\( O(1) \)**.
 - 총 공간 복잡도: **\( O(n^2) \)** (실질적으로 \( O((n+1)^2) \)이지만 동일한 크기).

 */

// 입력 데이터 읽기
let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let (n, m) = (nm[0], nm[1])

// 배열 초기화
var array = (0..<n).map { _ in
    readLine()!.split(separator: " ").compactMap { Int($0) }
}

// 누적합 배열 초기화
var prefixSum = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)

// 누적합 계산
for i in 1...n {
    for j in 1...n {
        prefixSum[i][j] = array[i-1][j-1]
                        + prefixSum[i-1][j]
                        + prefixSum[i][j-1]
                        - prefixSum[i-1][j-1]
    }
}

// 쿼리 처리 및 출력
for _ in 0..<m {
    let query = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (x1, y1, x2, y2) = (query[0], query[1], query[2], query[3])
    
    let sum = prefixSum[x2][y2]
              - prefixSum[x2][y1-1]
              - prefixSum[x1-1][y2]
              + prefixSum[x1-1][y1-1]
    
    print(sum)
}

