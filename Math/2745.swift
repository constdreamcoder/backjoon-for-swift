//
//  2745.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/26/24.
//

import Foundation

/**
 설명 - 진법 변환
 1. 입력 문자열을 거꾸로 탐색하며 각 자리의 값을 계산.
 2. 숫자(0-9)와 문자(A-Z)를 처리해 각 진법 값을 더함.
 팁) 진법 변환은 각 자리의 값을 해당 자리의 가중치(진법 제곱)와 곱해 더하는 방식으로 수행.

 성능 분석
 1. 시간 복잡도
 - 문자열 길이: 입력 문자열의 길이를 \( n \)이라 할 때, 문자열을 한 번 순회하므로 시간 복잡도는 \( O(n) \)입니다.
 - 진법 계산: 각 문자를 처리하는 연산은 \( O(1) \)입니다.
 - 총 시간 복잡도: ** O(n) **

 2. 공간 복잡도
 - 변수 저장: 결과를 저장하는 \( result \) 변수와 각 자리 값을 저장하는 \( value \)는 \( O(1) \)의 공간만 사용합니다.
 - \( reversed \): 입력 문자열을 뒤집기 위해 임시로 저장된 배열은 \( O(n) \) 공간을 차지합니다.
 - 총 공간 복잡도: ** O(n) **
 */


func convertToDecimal(_ input: String, _ base: Int) -> Int {
    var result = 0
    for (index, char) in input.reversed().enumerated() {
        let value: Int
        if let digit = char.wholeNumberValue {
            value = digit // 숫자 (0-9)
        } else {
            value = Int(char.asciiValue! - Character("A").asciiValue! + 10) // 문자 (A-Z)
        }
        result += value * Int(pow(Double(base), Double(index)))
    }
    return result
}

// 입력 처리
if let input = readLine() {
    let components = input.split(separator: " ")
    let number = String(components[0])
    let base = Int(components[1])!
    let decimalValue = convertToDecimal(number, base)
    print(decimalValue)
}
