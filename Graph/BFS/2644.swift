//
//  2644.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 12/27/24.
//

import Foundation

/**
 방법1: 설명 - 그래프 탐색(`BFS`)
 1. BFS를 수행하기 위해 인접 리스트(graph)와 방문 배열(visited) 생성
 2. BFS를 사용하여 시작 노드에서 목표 노드까지 최단 거리를 탐색
 3. 각 노드 방문 시 방문 체크를 통해 중복 방문을 방지
 팁) BFS는 최단 거리 탐색 및 레벨 기반 탐색 문제에 적합

 성능 분석
 1. 시간복잡도
 - 그래프 탐색: BFS 함수는 각 노드와 간선을 한 번씩 방문합니다.
 - 노드 수가 \(V\), 간선 수가 \(E\)일 때, BFS의 시간 복잡도는 \(O(V + E)\)입니다.
 - 총 시간복잡도: **O(V + E)**

 2. 공간복잡도
 - 인접 리스트(graph): 노드 수 \(V\)와 간선 수 \(E\)를 기반으로 하여 \(O(V + E)\)의 공간이 필요합니다.
 - 방문 배열(visited): 노드 수 \(V\)만큼의 공간이 필요하므로 \(O(V)\)입니다.
 - 큐: BFS 실행 시 최악의 경우 모든 노드를 큐에 저장하므로 \(O(V)\)의 공간이 필요합니다.
 - 총 공간복잡도: **O(V + E)**
 */

// 입력 받기
let n = Int(readLine()!)! // 사람 수
let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let (start, end) = (inputs[0], inputs[1])
let m = Int(readLine()!)! // 관계 수

// 인접 리스트 생성
var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<m {
    let relation = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (relation[0], relation[1])
    graph[a].append(b)
    graph[b].append(a)
}

// 방문 체크 배열
var visited = [Bool](repeating: false, count: n + 1)

// BFS 함수
func bfs(start: Int, target: Int) -> Int {
    var queue: [(node: Int, depth: Int)] = [(start, 0)]
    visited[start] = true
    
    while !queue.isEmpty {
        let (current, depth) = queue.removeFirst()
        
        // 목표 노드에 도달했을 경우
        if current == target {
            return depth
        }
        
        // 인접 노드 탐색
        for neighbor in graph[current] {
            if !visited[neighbor] {
                visited[neighbor] = true
                queue.append((neighbor, depth + 1))
            }
        }
    }
    
    // 목표 노드에 도달하지 못했을 경우
    return -1
}

// 결과 출력
let result = bfs(start: start, target: end)
print(result)
