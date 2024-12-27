//
//  2583.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/23/24.
//

import Foundation

/**
 방법1: 설명 - 그래프 탐색(`DFS`)
 1. DFS 수행을 위한 지도 배열(map)과 방향 벡터 생성
 2. DFS를 사용해 연결된 영역을 탐색하며 영역 크기를 계산
 팁) DFS는 연결 요소 탐색 및 그래프의 완전 탐색 문제에 적합

 성능 분석
 1. 시간복잡도
 - 그래프 탐색: DFS 함수는 각 노드(칸)를 최대 한 번씩 방문하며, 모든 간선을 확인합니다. 지도 크기가 \(M \times N\)이므로, 전체 노드를 탐색하기 위해 \(O(M \times N)\)의 시간 복잡도를 가집니다.
 - 총 시간복잡도: **O(M \times N)**

 2. 공간복잡도
 - 지도 배열(map): 입력 크기가 \(M \times N\)이므로 \(O(M \times N)\)의 공간이 필요합니다.
 - 호출 스택: DFS 호출 시 스택에 노드가 저장되며, 최악의 경우 하나의 영역이 \(M \times N\) 전체를 차지할 수 있으므로 \(O(M \times N)\)의 공간이 필요합니다.
 - 총 공간복잡도: **O(M \times N)**
 
 `스택을 이용한 DFS의 주요 아이디어`
 1. 스택 초기화:
 - 탐색을 시작할 노드를 스택에 넣습니다.
 2. 반복 구조:
 - 스택이 비어 있지 않을 때까지 아래를 반복합니다:
   1) 스택에서 노드를 꺼냅니다.
   2) 꺼낸 노드가 아직 방문되지 않았다면, 해당 노드를 방문합니다.
   3) 현재 노드와 연결된 인접 노드들을 스택에 추가합니다.
 3. 방문 여부 확인:
 - 방문한 노드는 다시 탐색하지 않도록 기록합니다(예: visited 배열).
 */

// 입력 처리
let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0] // 세로 길이
let n = input[1] // 가로 길이
let k = input[2] // 사각형 개수

var map = Array(repeating: Array(repeating: 0, count: n), count: m)

// 사각형 좌표 처리
for _ in 0..<k {
    let rect = readLine()!.split(separator: " ").map { Int($0)! }
    let x1 = rect[0], y1 = rect[1], x2 = rect[2], y2 = rect[3]
    
    for i in y1..<y2 {
        for j in x1..<x2 {
            map[i][j] = 1 // 사각형 내부를 채움
        }
    }
}

// 방향 벡터 (상, 하, 좌, 우)
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// DFS 함수
func dfs(_ x: Int, _ y: Int) -> Int {
    var stack = [(x, y)]
    var area = 0
    
    while !stack.isEmpty {
        let (curX, curY) = stack.removeLast()
        if curX < 0 || curY < 0 || curX >= m || curY >= n || map[curX][curY] == 1 {
            continue
        }
        
        // 방문 처리 및 영역 크기 증가
        map[curX][curY] = 1
        area += 1
        
        // 인접한 좌표 탐색
        for direction in directions {
            let newX = curX + direction.0
            let newY = curY + direction.1
            stack.append((newX, newY))
        }
    }
    
    return area
}

// 영역 탐색
var areas = [Int]()
for i in 0..<m {
    for j in 0..<n {
        if map[i][j] == 0 { // 아직 방문하지 않은 영역
            let area = dfs(i, j)
            areas.append(area)
        }
    }
}

// 결과 출력
areas.sort()
print(areas.count) // 영역의 개수
print(areas.map { String($0) }.joined(separator: " ")) // 각 영역의 넓이

