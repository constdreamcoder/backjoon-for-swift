//
//  10828.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/13/24.
//

import Foundation

// 스택 구조체 정의
struct Stack {
    private var elements: [Int] = []
    
    // push 연산
    mutating func push(_ value: Int) {
        elements.append(value)
    }
    
    // pop 연산
    mutating func pop() -> Int {
        return elements.isEmpty ? -1 : elements.removeLast()
    }
    
    // size 연산
    func size() -> Int {
        return elements.count
    }
    
    // empty 연산
    func empty() -> Int {
        return elements.isEmpty ? 1 : 0
    }
    
    // top 연산
    func top() -> Int {
        return elements.isEmpty ? -1 : elements.last!
    }
}

// 입력 받아서 명령어 처리
var stack = Stack()
let n = Int(readLine()!)!

for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    
    switch command[0] {
    case "push":
        if let value = Int(command[1]) {
            stack.push(value)
        }
    case "pop":
        print(stack.pop())
    case "size":
        print(stack.size())
    case "empty":
        print(stack.empty())
    case "top":
        print(stack.top())
    default:
        break
    }
}
