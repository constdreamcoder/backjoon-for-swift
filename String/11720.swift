//
//  11720.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 10/31/24.
//

import Foundation

let num = Int(readLine()!)!
let numbers = readLine()!

var sum = 0

for number in numbers {
    sum += Int(String(number))!
}

print(sum)
