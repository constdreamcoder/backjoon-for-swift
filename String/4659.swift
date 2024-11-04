//
//  4659.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/4/24.
//

import Foundation

/**
 설명 - 백준 4659번 "비밀번호 발음하기" 문제 해결
 1. 주어진 비밀번호 문자열에 대해 세 가지 조건을 만족하는지 확인합니다:
    - 조건 A: 문자열에 적어도 하나의 모음이 포함되어야 합니다.
    - 조건 B: 모음 또는 자음이 3번 연속으로 나오면 안 됩니다.
    - 조건 C: 동일한 문자가 연속으로 두 번 나오면 안 되지만, "ee"와 "oo"는 예외로 허용됩니다.
 2. 조건 검사를 각각의 함수로 분리하여 각 비밀번호 문자열에 대해 개별적으로 검사합니다.

 성능 분석
 1. 시간 복잡도
 - 각 조건 검사 함수의 시간 복잡도는 다음과 같습니다:
   - `isConditionAPassed`: 문자열 길이 \( N \)에 비례하여 각 문자를 검사하므로 시간 복잡도는 **O(N)**입니다.
   - `isConditionBPassed`: 문자열 길이 \( N \)에 비례하여 각 문자를 검사하며, 모음과 자음의 연속 여부를 확인하므로 시간 복잡도는 **O(N)**입니다.
   - `isConditionCPassed`: 문자열 길이 \( N \)에 비례하여 각 문자를 검사하며, 연속된 문자가 같은지 확인하므로 시간 복잡도는 **O(N)**입니다.
 - 전체적으로 비밀번호 한 개에 대해 조건을 검사하는 시간 복잡도는 **O(N)**입니다.
 - 여러 개의 비밀번호를 입력받아 검사하는 경우 \( M \)개의 테스트 케이스에 대해 시간 복잡도는 **O(M x N)**이 됩니다.

 2. 공간 복잡도
 - 각 조건 함수는 문자열 길이 \( N \)에 따라 고정된 크기의 변수를 사용합니다.
   - `isConditionAPassed`는 상수 공간 **O(1)**을 사용합니다.
   - `isConditionBPassed`는 연속 모음/자음 개수를 추적하는 두 개의 변수만 필요하므로 상수 공간 **O(1)**을 사용합니다.
   - `isConditionCPassed`는 문자열을 배열로 변환하여 처리하므로 공간 복잡도는 **O(N)**입니다.
 - 전체적으로 이 프로그램의 공간 복잡도는 **O(N)**입니다.
 */


// 비밀번호 테스트 케이스를 반복적으로 입력 받는 루프
// "end"가 입력되면 반복을 종료하고 프로그램을 종료
while let testcase = readLine(), testcase != "end" {
    // 각 조건을 만족하는지 검사하는 함수들을 호출하여 비밀번호의 유효성을 확인
    if isConditionAPassed(testcase) && isConditionBPassed(testcase) && isConditionCPassed(testcase) {
        // 모든 조건을 만족하면 "acceptable"로 출력
        print("<\(testcase)> is acceptable.")
    } else {
        // 하나라도 만족하지 않으면 "not acceptable"로 출력
        print("<\(testcase)> is not acceptable.")
    }
}

// 조건 A: 비밀번호에 모음(a, e, i, o, u)이 하나 이상 포함되어야 함
func isConditionAPassed(_ testcase: String) -> Bool {
    // 입력 문자열에 모음 중 하나라도 포함되어 있는지 확인
    return testcase.contains { ["a", "e", "i", "o", "u"].contains($0) }
}

// 조건 B: 모음이 3번 연속으로 나타나거나, 자음이 3번 연속으로 나타나면 안 됨
func isConditionBPassed(_ testcase: String) -> Bool {
    // 모음과 자음이 연속적으로 나타나는 횟수를 저장하는 변수
    var vowelCount = 0
    var consonantCount = 0

    // 비밀번호 문자열의 각 문자를 검사
    for char in testcase {
        if ["a", "e", "i", "o", "u"].contains(char) {
            // 모음일 경우: 모음 카운트를 증가하고 자음 카운트를 초기화
            vowelCount += 1
            consonantCount = 0
        } else {
            // 자음일 경우: 자음 카운트를 증가하고 모음 카운트를 초기화
            consonantCount += 1
            vowelCount = 0
        }
        
        // 모음 또는 자음이 3번 연속으로 나타나는지 확인
        if vowelCount == 3 || consonantCount == 3 {
            return false // 조건을 위반한 경우 false 반환
        }
    }
    return true // 조건을 만족하면 true 반환
}

// 조건 C: 같은 글자가 연속으로 두 번 나타나면 안 됨 (단, "ee"와 "oo"는 예외)
func isConditionCPassed(_ testcase: String) -> Bool {
    // 비밀번호 문자열을 배열로 변환하여 각 문자에 인덱스를 통해 접근 가능하게 함
    let stringedTestCase = Array(testcase)
    
    // 인덱스 1부터 끝까지 순회하며 이전 문자와 비교
    for i in 1..<stringedTestCase.count {
        // 현재 문자와 이전 문자가 동일한지 확인
        if stringedTestCase[i] == stringedTestCase[i - 1] {
            // 연속된 문자가 "e"나 "o"가 아니라면 조건을 위반한 것으로 간주
            if stringedTestCase[i] != "e" && stringedTestCase[i] != "o" {
                return false // 조건을 만족하지 않으면 false 반환
            }
        }
    }
    return true // 조건을 만족하면 true 반환
}

