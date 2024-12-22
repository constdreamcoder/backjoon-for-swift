//
//  2667.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/22/24.
//

import Foundation

/**
 방법1: 설명 - 그래프 탐색(`DFS`)
 1. DFS 수행을 위한 방문 배열과 방향 벡터 생성
 2. DFS를 사용해 연결된 단지를 탐색하며 단지 크기 계산
 팁) DFS - 연결 요소를 탐색하거나 그래프 완전 탐색에 자주 사용

 성능 분석
 1. 시간복잡도
 - 그래프 탐색: DFS 함수는 각 노드에서 한 번만 호출되며, 각 간선은 한 번씩 탐색됩니다. 지도 크기가 \(N \times N\)이고, 집이 있는 노드(1)를 기준으로 탐색하므로, 모든 노드를 한 번씩 방문하며 \(O(N^2)\)의 시간 복잡도를 가집니다.
 - 총 시간복잡도: **O(N^2)**

 2. 공간복잡도
 - 지도 배열(map): 입력 크기가 \(N \times N\)이므로 \(O(N^2)\)의 공간이 필요합니다.
 - 방문 배열(visited): 방문 여부를 저장하는 배열로 \(O(N^2)\)의 공간을 차지합니다.
 - 호출 스택: DFS 호출 시 스택에 노드가 저장되며, 최악의 경우 단지의 크기만큼 스택 공간이 사용됩니다. 최대 크기는 \(O(N^2)\)입니다.
 - 총 공간복잡도: **O(N^2)**
 */

// Input
let n = Int(readLine()!)!
var map = [[Int]]()
for _ in 0..<n {
    let row = readLine()!.map { Int(String($0))! }
    map.append(row)
}

// Directions for moving up, down, left, right
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var complexes = [Int]() // Array to store the size of each complex

// DFS function
func dfs(_ x: Int, _ y: Int) -> Int {
    visited[x][y] = true
    var count = 1 // Count the current house

    for dir in directions {
        let nx = x + dir.0
        let ny = y + dir.1

        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            if map[nx][ny] == 1 && !visited[nx][ny] {
                count += dfs(nx, ny)
            }
        }
    }

    return count
}

// Main logic to find all complexes
for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1 && !visited[i][j] {
            let complexSize = dfs(i, j)
            complexes.append(complexSize)
        }
    }
}

// Output
complexes.sort()
print(complexes.count) // Number of complexes
for size in complexes {
    print(size) // Size of each complex
}



/**
 방법2: 설명 - 그래프 탐색(`DFS`)
 1. DFS 수행을 위한 지도 배열(map)과 방향 벡터(directions) 생성
 2. DFS를 사용해 연결된 집(단지)을 탐색하며 단지 크기를 계산
 팁) DFS는 연결 요소 탐색 및 그래프의 완전 탐색 문제에 적합

 성능 분석
 1. 시간복잡도
 - 그래프 탐색: DFS는 각 노드(집)를 최대 한 번씩 방문하며, 모든 간선과 노드를 확인합니다. 지도 크기가 \(N \times N\)일 때, 모든 노드를 탐색하기 위해 \(O(N^2)\)의 시간 복잡도를 가집니다.
 - 총 시간복잡도: **O(N^2)**

 2. 공간복잡도
 - 지도 배열(map): 입력 크기가 \(N \times N\)이므로 \(O(N^2)\)의 공간이 필요합니다.
 - 호출 스택: DFS 호출 시 스택에 노드가 저장되며, 최악의 경우 단지의 크기만큼 스택 공간이 사용됩니다. 단지가 최대 \(N^2\) 크기일 경우, \(O(N^2)\)의 공간이 필요합니다.
 - 총 공간복잡도: **O(N^2)**
 */

let n = Int(readLine()!)!
var graph = [[Character]]()

for _ in 0..<n {
    let row = readLine()!.map { $0 }
    graph.append(row)
}

let rows = graph.count
let cols = graph[0].count

func dfs(_ graph: inout [[Character]], _ r: Int, _ c: Int, _ currentComplexSize: inout Int) {
    if r < 0 || c < 0 || r >= rows || c >= cols || graph[r][c] == "0" {
        return
    }
    
    graph[r][c] = "0" // 방문 처리
    currentComplexSize += 1
    
    dfs(&graph, r-1, c, &currentComplexSize)
    dfs(&graph, r+1, c, &currentComplexSize)
    dfs(&graph, r, c-1, &currentComplexSize)
    dfs(&graph, r, c+1, &currentComplexSize)
}

var totalCount = 0
var result = [Int]()

for r in 0..<rows {
    for c in 0..<cols {
        if graph[r][c] == "1" {
            totalCount += 1
            var currentComplexSize = 0
            dfs(&graph, r, c, &currentComplexSize)
            result.append(currentComplexSize)
        }
    }
}

result.sort() // 단지 크기 오름차순 정렬

print(totalCount) // 단지 개수 출력
for size in result {
    print(size) // 각 단지 크기 출력
}
