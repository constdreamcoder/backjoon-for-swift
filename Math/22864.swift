//
//  22864.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/27/24.
//

import Foundation

/**
 설명 - 24시간 동안 작업량을 계산하는 백준 22864번 문제
 1. **작업 조건에 따른 처리**
    - 24시간 동안 매 시간 단위로 작업하거나 휴식을 결정합니다.
    - 피로도 증가 조건을 확인하여 작업 가능 여부를 판단하며, 피로도가 한계치에 도달하면 휴식을 통해 피로도를 회복합니다.
 2. **작업 시나리오**
    - 작업 가능한 경우(`currentFatigueFigure + a <= m`):
        - 작업량(`workLoad`)을 증가시키고, 피로도를 갱신합니다.
    - 작업 불가능한 경우:
        - 피로도를 감소시키며, 피로도가 음수로 내려가지 않도록 관리합니다.
 3. **결과 출력**
    - 24시간 동안 작업량(`workLoad`)을 계산한 후 출력합니다.

 성능 분석
 1. **시간복잡도**
    - `while hours < 24` 루프는 고정된 24회 반복:
        - 매 루프에서 상수 시간 작업(작업 여부 확인 및 변수 갱신)을 수행합니다.
        - 작업 가능 여부는 단순 비교와 덧셈/뺄셈으로 처리하므로 \( O(1) \)입니다.
    - 총 시간 복잡도는 \( O(24 \times 1) = O(1) \)로 상수 시간입니다.
 2. **공간복잡도**
    - 상수 공간 사용:
        - 변수(`hours`, `currentFatigueFigure`, `workLoad`)는 모두 정수형 변수로 고정된 크기를 가집니다.
        - 별도의 배열이나 동적 데이터 구조를 사용하지 않으므로 \( O(1) \)입니다.
 */


let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0] // 시간당 쌓이는 피로도
let b = input[1] // 시간당 처리 능력
let c = input[2] // 시간당 줄어드는 피로도
let m = input[3] // 견딜 수 있는 피로도 최대값

var hours = 0 // 흐른 시간
var currentFatigueFigure = 0 // 현재 피로도
var workLoad = 0 // 처리된 업무량

while hours < 24 {
    if currentFatigueFigure + a <= m {
        // 일을 할 수 있는 경우
        workLoad += b
        currentFatigueFigure += a
    } else {
        // 피로도가 한계치를 넘을 경우 휴식
        currentFatigueFigure = max(0, currentFatigueFigure - c)
    }
    hours += 1 // 시간 증가
}

print(workLoad)
