//
//  1978.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/21/24.
//

import Foundation

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

let primeCount = numbers.filter { isPrime($0) }.count

print(primeCount)
