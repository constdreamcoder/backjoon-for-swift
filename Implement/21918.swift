//
//  21918.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/6/24.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var array = readLine()!.split(separator: " ").map { Int($0)! }

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1], c = input[2]
    
    performCommand(&array, a, b, c)
}

print(array.map { String($0) }.joined(separator: " "))

func performCommand(_ array: inout [Int], _ a: Int, _ b: Int, _ c: Int) {
    switch a {
    case 1:
        array[b - 1] = c // i번째 i = b - 1
    case 2:
        for idx in (b-1)...(c-1) {
            if array[idx] == 0 {
                array[idx] = 1
            } else if array[idx] == 1 {
                array[idx] = 0
            }
        }
    case 3:
        for idx in (b-1)...(c-1) {
            array[idx] = 0
        }
    case 4:
        for idx in (b-1)...(c-1) {
            array[idx] = 1
        }
    default: break
    }
}
