//
//  1012.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/30/24.
//

import Foundation

/**
 방법1: 설명 - 그래프 탐색(`BFS`)
 1. BFS를 수행하기 위해 배추밭을 2D 배열로 초기화하고 큐를 사용하여 군집 탐색
 2. 배추 위치를 기준으로 상하좌우 연결된 모든 배추를 탐색하며 방문 처리
 3. 방문한 배추는 `0`으로 변경하여 중복 탐색을 방지
 팁) BFS는 그래프의 연결 요소를 확인하거나 레벨 기반 탐색 문제에 적합

 성능 분석
 1. 시간복잡도
 - 배추밭 탐색: BFS 함수는 배추밭의 모든 칸을 최대 한 번씩 방문합니다.
 - 한 칸에서 BFS로 연결된 모든 배추를 탐색하며, 각 간선을 한 번씩 확인합니다.
 - 배추밭 크기가 \(M \times N\), 배추 수가 \(K\)일 때, BFS의 시간 복잡도는 \(O(M \times N + K)\)입니다.
 - 총 시간복잡도: **O(M \times N)** (배추 위치의 수 \(K\)는 \(M \times N\)보다 작거나 같음)

 2. 공간복잡도
 - 배추밭 배열(field): 크기가 \(M \times N\)이므로 \(O(M \times N)\)의 공간이 필요합니다.
 - 큐: BFS 실행 시 최악의 경우 배추밭 전체를 큐에 저장하므로 \(O(M \times N)\)의 공간이 필요합니다.
 - 총 공간복잡도: **O(M \times N)**
 */


// 방향 벡터 (상, 하, 좌, 우)
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// BFS 함수 정의
func bfs(_ field: inout [[Int]], _ startR: Int, _ startC: Int, _ rows: Int, _ cols: Int) {
    // BFS를 위한 큐
    var queue: [(Int, Int)] = [(startR, startC)]
    field[startR][startC] = 0 // 시작 지점을 방문 처리
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        let (r, c) = queue.removeFirst()
        
        // 상하좌우 탐색
        for direction in directions {
            let nr = r + direction.0
            let nc = c + direction.1
            
            // 유효한 좌표이고 배추가 있는 경우 탐색
            if nr >= 0, nc >= 0, nr < rows, nc < cols, field[nr][nc] == 1 {
                queue.append((nr, nc))
                field[nr][nc] = 0 // 방문 처리
            }
        }
    }
}

// 메인 함수
func solve() {
    let T = Int(readLine()!)! // 테스트 케이스 수
    var results = [Int]()
    
    for _ in 0..<T {
        // 입력 처리
        let dimensions = readLine()!.split(separator: " ").map { Int($0)! }
        let cols = dimensions[0], rows = dimensions[1], k = dimensions[2]
        
        // 배추밭 초기화
        var field = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        // 배추 위치 입력
        for _ in 0..<k {
            let position = readLine()!.split(separator: " ").map { Int($0)! }
            let x = position[0], y = position[1]
            field[y][x] = 1
        }
        
        // 군집 수 계산
        var wormCount = 0
        for r in 0..<rows {
            for c in 0..<cols {
                if field[r][c] == 1 { // 배추가 있으면 BFS로 탐색 시작
                    wormCount += 1
                    bfs(&field, r, c, rows, cols)
                }
            }
        }
        results.append(wormCount)
    }
    
    // 결과 출력
    results.forEach { print($0) }
}

// 실행
solve()
