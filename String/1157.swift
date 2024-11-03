//
//  1157.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/3/24.
//

import Foundation

/**
 설명 - 문자열
 1. 주어진 암호문에서 알파벳별 개수 정보를 가진 딕셔너리 생성
 - for 루프를 사용하여 각 문자를 순회하면서 딕셔너리 frequency에 문자의 등장 횟수를 기록합니다.
 2. 이 딕셔너리에서 알파벳 개수가 가장 많은 문자를 찾아 반환하거나, 동일하게 많이 등장하는 알파벳이 2개 이상일 때는 ? 반환
 - 딕셔너리의 최대 빈도를 찾아 maxFrequency에 저장한 뒤, 그 빈도를 가진 문자 집합을 frequentKeys에 저장합니다.
 - frequentKeys의 개수가 1일 경우, 해당 알파벳을 대문자로 출력하고, 여러 개라면 ?를 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - 문자열 길이 𝑁 N에 비례하여 각 문자를 순회하며 등장 횟수를 기록하므로 𝑂(𝑁) 의 시간 복잡도를 가집니다.
 - 딕셔너리에서 max()와 filter를 사용하여 최대 빈도와 해당 문자를 찾는 작업도 문자열 길이 𝑁 N에 비례하므로 𝑂(𝑁) 입니다.
 - 전체 시간 복잡도는 **𝑂(𝑁)** 입니다.
 2. 공간복잡도
 - 딕셔너리에 최대 26개의 알파벳을 저장하므로 상수 공간 **𝑂(1)** 을 사용합니다.
 */

let string = readLine()!.lowercased()

var frequency = [Character: Int]() // key: 문자, value: 문자 개수

for char in string {
    frequency[char, default: 0] += 1
}

let maxFrequency = frequency.values.max() ?? 0
let frequentKeys = frequency.filter { $0.value == maxFrequency }.keys

if frequentKeys.count == 1 {
    print(frequentKeys.first!.uppercased())
} else {
    print("?")
}
