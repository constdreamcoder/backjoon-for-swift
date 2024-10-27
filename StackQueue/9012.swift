//
//  9012.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 10/27/24.
//

import Foundation
/**
 설명 - 스택
 1. 문자열을 하나씩 읽고 스택을 이용해 괄호 짝을 검사합니다.
 2. '('는 스택에 추가하고, ')'는 스택에서 마지막 원소를 제거합니다. 만약 스택이 비어있는데 ')'가 나오면 잘못된 문자열로 판단하여 루프를 종료합니다.
 3. 스택이 비어 있고 flag가 true일 경우 "YES", 그렇지 않으면 "NO"를 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - 입력받는 문자열의 길이를 𝑛이라 하면, 각 문자열에 대해 내부 for 루프가 𝑂(𝑛)입니다.
 - stack.append()와 stack.removeLast()의 연산은 모두 평균적으로 𝑂(1)입니다. 따라서 각 문자열을 검사하는 데는 𝑂(𝑛)이 소요됩니다.
 - 전체 반복문은 테스트 케이스의 수 𝑇만큼 반복되므로, **총 시간 복잡도는 𝑂(𝑇 ×. 𝑛)**입니다.
 2. 공간복잡도
 - 스택에 최대 𝑛개의 문자를 저장할 수 있으므로, 각 테스트 케이스의 공간 복잡도는 **𝑂(𝑛)**입니다.
 - 테스트 케이스 수 𝑇에 따라 여러 번 반복할 수 있지만, 메모리 사용량은 입력 크기에 비례하여 증가하지 않습니다.
 */

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!
    var stack = [Character]()
    var flag = true
    
    for s in input {
        if s == "(" {
            stack.append(s)
        } else {
            if stack.isEmpty {
                flag = false
                break
            }
            stack.removeLast()
        }
    }
    
    stack.isEmpty && flag ? print("YES") : print("NO")
}
