//
//  2178.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 1/2/25.
//

import Foundation

/**
 방법1: 설명 - 그래프 탐색(`BFS`)
 1. BFS를 수행하기 위해 미로를 2D 배열로 초기화하고 큐를 사용하여 최단 경로 탐색
 2. 시작점에서부터 상하좌우 방향으로 이동하며 유효한 경로를 방문 처리
 3. 방문한 위치는 `visited` 배열로 관리하여 중복 탐색을 방지
 4. BFS는 첫 경로를 찾으면 종료되므로 최단 경로를 보장함
 팁) BFS는 최단 경로 탐색이나 연결 요소 확인에 적합한 알고리즘입니다.

 성능 분석
 1. 시간복잡도
 - 미로 탐색: BFS 함수는 미로의 모든 칸을 최대 한 번씩 방문합니다.
 - 각 칸에서 상하좌우로 최대 4개의 간선을 탐색합니다.
 - 미로의 크기가 \(N \times M\)일 때, BFS의 시간 복잡도는 \(O(N \times M)\)입니다.
 - 총 시간복잡도: **O(N \times M)**

 2. 공간복잡도
 - 미로 배열(maze): 크기가 \(N \times M\)이므로 \(O(N \times M)\)의 공간이 필요합니다.
 - 방문 배열(visited): 크기가 \(N \times M\)이므로 \(O(N \times M)\)의 추가 공간이 필요합니다.
 - 큐: BFS 실행 시 최악의 경우 미로 전체를 큐에 저장하므로 \(O(N \times M)\)의 공간이 필요합니다.
 - 총 공간복잡도: **O(N \times M)**
 */

struct Point {
    let x: Int
    let y: Int
}

func bfsMazeSolver(_ maze: [[Int]], _ n: Int, _ m: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = [(Point, Int)]() // (현재 위치, 이동 거리)
    queue.append((Point(x: 0, y: 0), 1)) // 시작점
    visited[0][0] = true
    
    // 이동 방향: 상, 하, 좌, 우
    let directions = [Point(x: -1, y: 0), Point(x: 1, y: 0), Point(x: 0, y: -1), Point(x: 0, y: 1)]
    
    while !queue.isEmpty {
        let (current, distance) = queue.removeFirst()
        
        // 도착 지점에 도달하면 거리 반환
        if current.x == n - 1 && current.y == m - 1 {
            return distance
        }
        
        // 4방향 탐색
        for direction in directions {
            let nextX = current.x + direction.x
            let nextY = current.y + direction.y
            
            // 범위 내에 있고 방문하지 않았으며 통로(1)인 경우만 이동
            if nextX >= 0 && nextX < n && nextY >= 0 && nextY < m && maze[nextX][nextY] == 1 && !visited[nextX][nextY] {
                visited[nextX][nextY] = true
                queue.append((Point(x: nextX, y: nextY), distance + 1))
            }
        }
    }
    
    return -1 // 경로가 없으면 -1 반환 (문제에서는 항상 경로가 존재한다고 가정)
}

// 입력 처리
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var maze = [[Int]]()

for _ in 0..<n {
    maze.append(readLine()!.map { Int(String($0))! })
}

// 결과 출력
let result = bfsMazeSolver(maze, n, m)
print(result)
