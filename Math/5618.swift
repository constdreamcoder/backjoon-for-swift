//
//  5618.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/23/24.
//

import Foundation

/**
 설명 - 주어진 숫자들의 공약수 찾기
 1. 입력받은 숫자 배열에서 모든 숫자의 최대공약수(GCD)를 구합니다.
     - GCD는 유클리드 알고리즘을 사용하여 효율적으로 계산됩니다.
 2. GCD의 약수를 구하기 위해 1부터 GCD의 제곱근까지 반복합니다.
     - 약수와 그 짝을 모두 저장하여 공약수를 찾습니다.
 3. 약수들을 정렬하여 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - 숫자의 개수를 𝑛, 배열에서 가장 큰 수를 𝑚이라고 할 때, 최대공약수를 구하는 reduce 과정은 **𝑂(𝑛 * log(𝑚))**입니다.
 - GCD의 약수를 찾는 과정은 **𝑂(√GCD)**입니다.
 - 전체 시간 복잡도는 **𝑂(𝑛 * log(𝑚) + √GCD)**로, 제한된 입력 크기에서 효율적으로 동작합니다.

 2. 공간복잡도
 - numbers 배열: 입력된 숫자 배열을 저장하며, **𝑂(𝑛)** 공간을 차지합니다.
 - divisors 배열: GCD의 약수를 저장하며, 최대로 **𝑂(√GCD)** 공간을 사용합니다.
 - 전체 공간 복잡도: **𝑂(𝑛 + √GCD)**
 
 추가 설명
 1. 약수의 대칭성을 이용한 성능 항샹 도모를 위해 최대공약수의 제곱근까지만 공약수을 구하는 연산 수행
 */


import Foundation

// 유클리드 알고리즘을 사용해 최대공약수(GCD)를 구하는 함수
func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

// GCD를 구하고 약수를 찾아 출력하는 함수
func findCommonDivisors(_ numbers: [Int]) {
    guard let first = numbers.first else { return }
    
    // 모든 숫자의 GCD를 구함
    let commonGCD = numbers.reduce(first, gcd)
    
    // GCD의 약수를 구함
    var divisors: [Int] = []
    for i in 1...Int(sqrt(Double(commonGCD))) {
        if commonGCD % i == 0 {
            divisors.append(i)
            // 짝을 이루는 약수 추가
            if i != commonGCD / i {
                divisors.append(commonGCD / i)
            }
        }
    }
    
    // 약수를 정렬하고 출력
    divisors.sort()
    divisors.forEach { print($0) }
}

// 입력 처리
let n = Int(readLine()!)! // 숫자 개수
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

// 공약수 출력
findCommonDivisors(numbers)
