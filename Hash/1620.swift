//
//  1620.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/16/24.
//

import Foundation

/**
 설명 - 딕셔너리를 이용한 포켓몬 이름과 번호 검색
 1. 포켓몬 이름을 번호와 매핑한 `nameToNumber` 딕셔너리와,
    번호를 이름과 매핑한 `numberToName` 딕셔너리를 생성합니다.
 2. n번 반복하여 포켓몬 이름을 입력받아 두 딕셔너리에 저장합니다.
     - `nameToNumber`는 이름을 키로, 번호를 값으로 저장합니다.
     - `numberToName`는 번호를 키로, 이름을 값으로 저장합니다.
 3. m번 반복하여 문제를 입력받고 처리합니다.
     - 입력이 숫자인 경우 `numberToName` 딕셔너리를 통해 이름을 출력합니다.
     - 입력이 문자열인 경우 `nameToNumber` 딕셔너리를 통해 번호를 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - 입력 처리: 포켓몬 정보를 딕셔너리에 저장하는 작업은 총 n번 반복되며, 각 작업은 딕셔너리의 키-값 삽입으로 **𝑂(1)**입니다. 따라서 입력 처리 시간은 **𝑂(𝑛)**입니다.
 - 문제 처리: 문제를 처리하는 작업은 총 m번 반복되며, 각 작업은 딕셔너리 키를 이용한 검색으로 **𝑂(1)**입니다. 따라서 문제 처리 시간은 **𝑂(𝑚)**입니다.
 - 전체 시간 복잡도: **𝑂(𝑛 + 𝑚)**
 
 2. 공간복잡도
 - nameToNumber 딕셔너리: n개의 포켓몬 이름과 번호를 저장하며, **𝑂(𝑛)** 공간을 차지합니다.
 - numberToName 딕셔너리: n개의 번호와 이름을 저장하며, **𝑂(𝑛)** 공간을 차지합니다.
 - 전체 공간 복잡도: **𝑂(𝑛)**
 */


let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]

var nameToNumber = [String: Int]() // 포켓몬 이름 -> 번호
var numberToName = [Int: String]() // 번호 -> 포켓몬 이름

for i in 1...n {
    let name = readLine()!
    nameToNumber[name] = i
    numberToName[i] = name
}

for _ in 0..<m {
    let problem = readLine()!
    
    if let number = Int(problem) { // 숫자로 입력된 경우
        print(numberToName[number]!)
    } else { // 이름으로 입력된 경우
        print(nameToNumber[problem]!)
    }
}
