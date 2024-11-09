//
//  7568.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/9/24.
//

import Foundation

/**
 설명 - 이중 for 문을 통한 덩치 비교
 1. 각 사람의 몸무게와 키를 저장한 배열을 생성합니다.
 2. 이중 for 문을 사용하여 각 사람과 다른 모든 사람을 비교합니다.
     - 만약 비교 대상의 몸무게와 키가 모두 큰 경우, 현재 사람의 덩치 등수를 1 증가시킵니다.
 3. 최종적으로 각 사람의 덩치 등수를 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - 사람의 수를 𝑛이라고 할 때, 이 코드의 시간 복잡도는 **𝑂(𝑛^2)**입니다.
 - 최대 𝑛 = 50이므로, 최악의 경우에도 2500번의 비교로 제한 시간 내에서 충분히 처리 가능합니다.
 
 2. 공간복잡도
 - people 배열: 각 사람의 몸무게와 키를 저장하며, **𝑂(𝑛)** 공간을 차지합니다.
 - ranks 배열: 각 사람의 덩치 등수를 저장하며, **𝑂(𝑛)** 공간을 차지합니다.
 - 전체 공간 복잡도: **𝑂(𝑛)**
 */



// 입력을 읽어오는 함수
func readInput() -> [(weight: Int, height: Int)] {
    let n = Int(readLine()!)!
    var people: [(weight: Int, height: Int)] = []

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        people.append((weight: input[0], height: input[1]))
    }
    
    return people
}

// 덩치 등수를 계산하는 함수
func calculatedRankds(for people: [(weight: Int, height: Int)]) -> [Int] {
    var ranks = Array(repeating: 1, count: people.count)
    
    for i in 0..<people.count {
        for j in 0..<people.count {
            if i != j && people[i].weight < people[j].weight && people[i].height < people[j].height {
                ranks[i] += 1
            }
        }
    }
    
    return ranks
}

let people = readInput()
let ranks = calculatedRankds(for: people)
print(ranks.map { String($0) }.joined(separator: " "))
