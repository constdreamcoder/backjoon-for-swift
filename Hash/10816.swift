//
//  10816.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 10/28/24.
//

import Foundation

/**
 문제 해결
 - readLine() 대신 FileHandle을 사용하는 방법으로 입력 속도를 높임
 
 설명 - 해시
 1.  딕셔너리를 선언하여 상근이가 가지고 있는 각 숫자별 개수 저장
 2. 주어진 숫자들을 상근이가  숫자별로 얼마나 가지고 있는지  확인하여 문자열로 저장하여 출력
 
 성능 분석
 1. 시간복잡도
 - 첫 번째 리스트의 크기를 𝑛1, 두 번째 리스트의 크기를 𝑛2라고 할 때, 이 코드의 전체 시간 복잡도는 **𝑂(𝑛1 + 𝑛2)**입니다.
 2. 공간복잡도
 - countDict 딕셔너리: 딕셔너리는 𝑛1𝐼𝑛𝑝𝑢𝑡의 고유 숫자만큼의 공간을 차지합니다. 최대 𝑂(𝑛1) 공간 복잡도를 갖습니다.
 - result 배열: 𝑛2𝐼𝑛𝑝𝑢𝑡의 크기만큼의 결과를 저장하므로 𝑂(𝑛2) 공간 복잡도를 가집니다.
- 전체 공간 복잡도: **𝑂(𝑛1 + 𝑛2)**
 */

// 빠른 입력 함수 정의
func readInt() -> [Int] {
    return readLine()!.split(separator: " ").map { Int(String($0))! }
}

let n1 = Int(readLine()!)!
let n1Input = readInt()
let n2 = Int(readLine()!)!
let n2Input = readInt()

var countDict: [Int: Int] = [:]

// 첫 번째 입력을 딕셔너리에 저장하여 개수 세기
for num in n1Input {
    countDict[num, default: 0] += 1
}

// 결과를 저장할 배열
var result = [String]()

// 두 번째 입력을 통해 숫자 개수 찾기
for num in n2Input {
    let count = countDict[num, default: 0]
    result.append("\(count)")
}

// 결과를 한 번에 출력
print(result.joined(separator: " "))
