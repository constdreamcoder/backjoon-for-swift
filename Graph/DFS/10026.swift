//
//  10026.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/26/24.
//

import Foundation

/**
 설명 - 그래프 탐색(`DFS`)
 1. DFS 수행을 위한 2차원 배열 (격자) 생성
 2. DFS 수행:
    - 각 노드를 탐색하며 연결된 영역(같은 색상)을 탐색.
    - 방문한 노드는 방문 처리하여 중복 탐색 방지.
 3. 적록색약과 일반 탐색의 두 가지 경우 처리:
    - 적록색약: 빨강(R)과 초록(G)을 동일한 색으로 간주하여 탐색.
    - 일반: 빨강(R), 초록(G), 파랑(B)을 각각 독립적인 영역으로 탐색.
 팁) DFS는 재귀적으로 호출되며, 스택 오버플로우를 방지하기 위해 입력 크기에 따라 `스택 크기` 설정이 필요할 수 있습니다.
 
 성능 분석
 1. 시간복잡도
 - DFS 탐색: 격자의 모든 칸을 탐색하며, 각각의 노드는 한 번 방문됩니다. 따라서 시간 복잡도는 𝑂(𝑁^2)입니다. 여기서 𝑁은 격자의 한 변의 길이입니다.
 - 적록색약 탐색과 일반 탐색은 독립적으로 실행되므로, 총 시간 복잡도는 **O(2 * N^2) = O(N^2)**.

 2. 공간복잡도
 - 격자 저장: 2차원 배열로 격자를 저장하므로 𝑂(𝑁^2)의 공간이 필요합니다.
 - 방문 배열 (visited): 방문 여부를 확인하는 배열인 visited는 𝑂(𝑁^2)의 공간 복잡도를 가집니다.
 - 재귀 호출 스택: DFS는 재귀적으로 호출되므로 최악의 경우 스택에 최대 𝑂(𝑁^2) 깊이가 필요할 수 있습니다.
 - 총 공간 복잡도: **O(N^2)**
 */

// 방향 벡터 (상, 하, 좌, 우)
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

// DFS 탐색 함수
func dfs(_ x: Int, _ y: Int, _ color: Character, _ grid: inout [[Character]], _ visited: inout [[Bool]]) {
    let n = grid.count
    visited[x][y] = true

    for (dx, dy) in directions {
        let nx = x + dx
        let ny = y + dy

        // 범위 체크와 방문 여부 확인
        if nx >= 0, nx < n, ny >= 0, ny < n, !visited[nx][ny], grid[nx][ny] == color {
            dfs(nx, ny, color, &grid, &visited)
        }
    }
}

// 입력 처리
let n = Int(readLine()!)!
var grid = [[Character]]()
for _ in 0..<n {
    grid.append(Array(readLine()!))
}

// 적록색약 아닌 경우와 적록색약인 경우의 그래프
var normalGrid = grid
var colorblindGrid = grid.map { row in
    row.map { $0 == "G" ? "R" : $0 } // 초록(G)을 빨강(R)으로 변환
}

// 방문 체크 배열
var visitedNormal = Array(repeating: Array(repeating: false, count: n), count: n)
var visitedColorblind = Array(repeating: Array(repeating: false, count: n), count: n)

// 영역 카운트
var normalCount = 0
var colorblindCount = 0

// 적록색약 아닌 경우 탐색
for i in 0..<n {
    for j in 0..<n {
        if !visitedNormal[i][j] {
            normalCount += 1
            dfs(i, j, normalGrid[i][j], &normalGrid, &visitedNormal)
        }
    }
}

// 적록색약인 경우 탐색
for i in 0..<n {
    for j in 0..<n {
        if !visitedColorblind[i][j] {
            colorblindCount += 1
            dfs(i, j, colorblindGrid[i][j], &colorblindGrid, &visitedColorblind)
        }
    }
}

// 결과 출력
print("\(normalCount) \(colorblindCount)")
