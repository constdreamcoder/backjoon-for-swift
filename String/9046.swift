//
//  9046.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/1/24.
//

import Foundation

/**
 설명 - 문자열
 1. 주어진 암호문에서 알파벳별 개수 정보를 가진 딕셔너리 생성
 2. 이 딕셔너리에서 알파벳 개수가 2개 이상일 때는 ? 아니면 가장 많은 수를 가진 알파벳 반환
 
 성능 분석
 1. 시간복잡도
 - 문자열 길이 𝑁 N에 비례하여 각 문자를 순회하고 등장 횟수를 기록하므로 **𝑂(𝑁)** 의 시간 복잡도를 가집니다.
 2. 공간복잡도
 - 딕셔너리에 최대 26개의 알파벳을 저장하므로 상수 공간 **𝑂(1)**을 사용합니다.
 */

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!
    
    var frequency = [Character: Int]()
    
    // 문자열을 순회하며 알파벳 카운팅
    for char in input where char.isLetter {
        frequency[char, default: 0] += 1
    }
    
    // 최대값을 찾을 때 알파벳 수가 총 26개이므로 최대값을 찾을 때 최대 26을 넘지 않는다.
    // 이는 최대값을 찾는 시간복잡도가 O(1)로 `상수`라는 것을 의미한다.
    let maxFrenquency = frequency.values.max() ?? 0
    let maxChars = frequency.filter { $0.value == maxFrenquency }.keys
    
    // 결과 출력
    if maxChars.count == 1, let result = maxChars.first {
        print(result)
    } else {
        print("?")
    }
}
