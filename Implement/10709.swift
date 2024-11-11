//
//  10709.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/11/24.
//

import Foundation
/**
 설명 - 각 행에서 구름의 위치를 추적하여 구름이 있는 위치로부터의 거리를 계산
 1. 입력된 2차원 배열에서 각 행의 구름 위치를 추적하여 거리 정보를 저장할 배열을 생성합니다.
 2. 각 행에서 구름이 등장한 위치를 기준으로 구름으로부터의 거리를 계산하여 배열에 저장합니다.
    - 구름('c')이 나타난 위치에 0을 저장하고, 이후 위치에서는 이전 구름 위치로부터의 거리를 계산하여 저장합니다.
 3. 최종적으로 구름과의 거리가 계산된 배열을 출력합니다.

 성능 분석
 1. 시간복잡도
 - 주어진 배열의 크기를 \( H \times W \)라고 할 때, 각 행을 한 번씩 순회하므로 이 코드의 시간 복잡도는 **𝑂(𝐻 \times 𝑊)**입니다.
 - 입력 크기가 제한적이므로 \( H, W \leq 100 \)에서 최악의 경우에도 10,000번의 연산으로 제한 시간 내에서 충분히 처리 가능합니다.

 2. 공간복잡도
 - grid 배열: 입력 배열의 구름 위치를 추적하고 거리를 계산하여 저장하므로 **𝑂(𝐻 \times 𝑊)** 공간을 차지합니다.
 - lastCloudPosition 변수: 각 행마다 마지막 구름 위치를 기록하는 정수 변수로, **𝑂(1)** 공간을 차지합니다.
 - 전체 공간 복잡도: **𝑂(𝐻 \times 𝑊)**
 */

// 입력 받기
let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
let H = dimensions[0]
let W = dimensions[1]

var grid: [[Int]] = []

// 초기화 및 구름이 나타나는 위치에 따라 거리 설정
for _ in 0..<H {
    let line = readLine()!
    var row: [Int] = []
    var lastCloudPosition = -1
    
    for (j, char) in line.enumerated() {
        if char == "c" {
            lastCloudPosition = j
            row.append(0)
        } else {
            if lastCloudPosition == -1 {
                row.append(-1)
            } else {
                row.append(j - lastCloudPosition)
            }
        }
    }
    
    grid.append(row)
}

// 출력하기
for row in grid {
    print(row.map { String($0) }.joined(separator: " "))
}
