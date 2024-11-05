//
//  14467.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/5/24.
//

import Foundation

let n = Int(readLine()!)!

var array = [Int?](repeating: nil, count: 11)

var changeCount = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    if array[input[0]] != nil && array[input[0]] != input[1] {
        changeCount += 1
    }
    array[input[0]] = input[1]
}

print(changeCount)
