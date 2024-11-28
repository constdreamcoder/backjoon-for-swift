//
//  2167.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/28/24.
//

import Foundation

/**
 설명 - 2차원 배열에서 구간 합 계산 (백준 2167번)
 1. **입력 처리**
    - 배열의 크기와 값을 입력받아 2차원 배열 `array`를 생성합니다.
 2. **누적 합 배열 생성**
    - 2차원 누적 합 배열 `prefixSum`을 생성하여, `(1,1)`부터 `(i,j)`까지의 합을 저장.
    - 계산식:
      \[
      \text{prefixSum}[i][j] = \text{array}[i-1][j-1]
                              + \text{prefixSum}[i-1][j]
                              + \text{prefixSum}[i][j-1]
                              - \text{prefixSum}[i-1][j-1]
      \]
 3. **쿼리 처리**
    - 각 쿼리에서 `(i,j)`부터 `(x,y)`까지의 구간 합을 계산.
    - 계산식:
      \[
      \text{sum} = \text{prefixSum}[x][y]
                   - \text{prefixSum}[i-1][y]
                   - \text{prefixSum}[x][j-1]
                   + \text{prefixSum}[i-1][j-1]
      \]
 4. **결과 출력**
    - 모든 쿼리 결과를 순서대로 출력.

 성능 분석
 1. 시간 복잡도
 - **누적 합 배열 생성**: \( O(n \times m) \)
   - \( n \): 행(row)의 개수.
   - \( m \): 열(column)의 개수.
 - **쿼리 처리**: \( O(k) \)
   - \( k \): 쿼리 개수.
   - 각 쿼리에서 고정된 연산(\( O(1) \))으로 구간 합 계산.
 - **총 시간 복잡도**: \( O(n \times m + k) \)

 2. 공간 복잡도
 - **2차원 배열**: \( array \)와 \( prefixSum \)은 각각 \( O(n \times m) \) 공간 사용.
 - **결과 저장**: \( results \) 배열은 최대 \( O(k) \) 공간 필요.
 - **총 공간 복잡도**: \( O(n \times m + k) \)
 */


// 입력 받기
let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
let n = dimensions[0] // 행
let m = dimensions[1] // 열

// 2차원 배열 입력
var array = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    array.append(row)
}

// 누적 합 계산
var prefixSum = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
for i in 1...n {
    for j in 1...m {
        prefixSum[i][j] = array[i - 1][j - 1]
            + prefixSum[i - 1][j]
            + prefixSum[i][j - 1]
            - prefixSum[i - 1][j - 1]
    }
}

// 쿼리 처리
let k = Int(readLine()!)! // 쿼리 개수
var results = [Int]()
for _ in 0..<k {
    let query = readLine()!.split(separator: " ").map { Int($0)! }
    let i = query[0], j = query[1], x = query[2], y = query[3]
    
    let sum = prefixSum[x][y]
        - prefixSum[i - 1][y]
        - prefixSum[x][j - 1]
        + prefixSum[i - 1][j - 1]
    results.append(sum)
}

// 결과 출력
for result in results {
    print(result)
}
