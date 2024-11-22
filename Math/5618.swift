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
 */


func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var sum = 0
var minimum = 10_000

for number in m...n {
    if isPrime(number) {
        sum += number
        minimum = min(number, minimum)
    }
}

if sum == 0 && minimum == 10_000 {
    print(-1)
} else {
    print(sum)
    print(minimum)
}
