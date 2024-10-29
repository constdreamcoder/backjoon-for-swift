//
//  11724.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 10/29/24.
//

import Foundation
/**
 설명 - 그래프 탐색(`DFS`, BFS)
 1. 그래프 탐색 수행을 위한 인접리스트 생성
 2. 그래프 탐색 수행
 팁) DFS - 보통 그래프 완전 탐색에 이용
 
 성능 분석
 1. 시간복잡도
 - 그래프 생성: 그래프를 인접 리스트 형태로 생성하기 위해 𝑂(𝑀)의 시간 복잡도가 발생합니다. 여기서 𝑀은 간선의 수입니다.
 - DFS 탐색: DFS 함수는 각 노드에서 한 번만 호출되며, 각 간선은 양방향으로만 연결되어 있으므로 최대 2𝑀번 탐색됩니다. 각 노드와 간선을 한 번씩 방문하기 때문에 DFS 탐색은 𝑂(𝑁 + 𝑀)의 시간 복잡도를 가집니다. 여기서 𝑁은 노드의 수입니다.
 - 총 시간복잡도: ** O(N+M) **

 2. 공간복잡도
 - 그래프 인접 리스트: 크기가 𝑛 + 1인 배열을 사용하여 각 노드의 연결 상태를 저장하고 있습니다. 각 노드에 연결된 간선 수만큼 공간을 차지하므로 𝑂(𝑁 + 𝑀)의 공간이 필요합니다.
 - 방문 배열 (visited): 방문 여부를 확인하는 배열인 visited는 𝑂(𝑁)의 공간 복잡도를 가집니다.
 - 총 시간복잡도: ** O(N+M) **
 */

/// DFS 풀이
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var graph = [[Int]](repeating: [], count: n + 1)
// 인접리스트 생성
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0], v = input[1]
    // 양방향 그래프로 인해 처리
    graph[u].append(v)
    graph[v].append(u)
}
var visited = [Bool](repeating: false, count: n + 1)

func dfs(node: Int) {
    visited[node] = true
    
    // 방문하지 않은 노드에 대해 DFS 수행
    for nextNode in graph[node] {
        if !visited[nextNode] {
            visited[nextNode] = true
            dfs(node: nextNode)
        }
    }
}

// 총 그래프 수 저장
var count = 0

for i in 1...n {
    if !visited[i] {
        count += 1
        dfs(node: i)
    }
}

print(count)

/// BFS 풀이
// 첫 번째 입력 줄에서 노드 수와 간선 수를 입력받습니다.
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

// 인접 리스트를 생성하여 그래프를 표현합니다.
var graph = [[Int]](repeating: [], count: n + 1)

// 간선 정보를 입력받아 양방향 그래프를 구성합니다.
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0], v = input[1]
    graph[u].append(v)  // 노드 u에서 v로의 간선을 추가
    graph[v].append(u)  // 노드 v에서 u로의 간선을 추가
}

// 방문 여부를 기록하는 배열을 초기화합니다.
var visited = [Bool](repeating: false, count: n + 1)

// BFS 탐색 함수 정의
func bfs(startNode: Int) {
    // 탐색할 노드를 담는 큐를 초기화하고 시작 노드를 추가합니다.
    var queue = [startNode]
    visited[startNode] = true  // 시작 노드를 방문 처리

    // 큐가 빌 때까지 반복하여 노드를 탐색합니다.
    while !queue.isEmpty {
        let node = queue.removeFirst()  // 큐에서 맨 앞의 노드를 꺼냄
        
        // 현재 노드와 연결된 모든 인접 노드를 확인
        for nextNode in graph[node] {
            // 방문하지 않은 인접 노드에 대해
            if !visited[nextNode] {
                visited[nextNode] = true  // 인접 노드를 방문 처리
                queue.append(nextNode)    // 인접 노드를 큐에 추가
            }
        }
    }
}

// 연결 요소의 개수를 저장할 변수 초기화
var count = 0

// 모든 노드에 대해 연결 요소를 탐색
for i in 1...n {
    // 방문하지 않은 노드가 있다면 새로운 연결 요소로 간주
    if !visited[i] {
        count += 1  // 연결 요소 개수 증가
        bfs(startNode: i)  // BFS 탐색 시작
    }
}

// 최종 연결 요소의 개수를 출력합니다.
print(count)

