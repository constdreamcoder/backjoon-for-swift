//
//  10845.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/14/24.
//

import Foundation

struct Queue {
    private var queue = [Int]()
    
    mutating func push(_ newValue: Int) {
        queue.append(newValue)
    }
    
    mutating func pop() -> Int {
        queue.isEmpty ? -1 : queue.removeFirst()
    }
    
    func size() -> Int {
        queue.count
    }
    
    func empty() -> Int {
        queue.isEmpty ? 1 : 0
    }
    
    func front() -> Int {
        queue.isEmpty ? -1 : queue.first!
    }
    
    func back() -> Int {
        queue.isEmpty ? -1 : queue.last!
    }
}

let n = Int(readLine()!)!

var queue = Queue()

for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { String($0) }
    
    switch command[0] {
    case "push":
        if let newValue = Int(command[1]) {
            queue.push(newValue)
        }
    case "pop":
        print(queue.pop())
    case "size":
        print(queue.size())
    case "empty":
        print(queue.empty())
    case "front":
        print(queue.front())
    case "back":
        print(queue.back())
    default: break
    }
}

