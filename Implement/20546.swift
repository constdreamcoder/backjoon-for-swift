//
//  20546.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/8/24.
//

import Foundation

/**
 설명 - 주식 투자 시뮬레이션
 1. 준현의 투자 방식 (BNP):
    - 매일 주식을 가능한 최대한 구매하고 남은 현금을 기록합니다.
    - 최종 자산은 남은 현금과 보유 주식을 현재가로 환산한 값의 합입니다.
 2. 성민의 투자 방식 (TIMING):
    - 3일 연속 가격이 하락할 경우 주식을 최대한 구매합니다.
    - 3일 연속 가격이 상승할 경우 보유한 모든 주식을 매도합니다.
    - 최종 자산은 남은 현금과 보유 주식을 현재가로 환산한 값의 합입니다.
 3. 두 방식의 최종 자산을 비교하여 더 높은 자산을 가진 투자 방식을 출력합니다.

 성능 분석
 1. 시간복잡도
 - `bnpInvestment` 함수:
   - 주식 가격 배열의 길이를 𝑛이라고 하면, 배열의 모든 요소를 한 번씩 순회하므로 𝑂(𝑛)입니다.
 - `timingInvestment` 함수:
   - 배열의 길이 𝑛에 대해 세 번째 요소부터 한 번씩 순회하므로, 전체 시간 복잡도는 𝑂(𝑛)입니다.
 - 두 함수 모두 𝑂(𝑛)으로 수행되고 독립적으로 실행되므로, **총 시간 복잡도는 𝑂(2𝑛)**이며, 𝑂(𝑛)으로 간주할 수 있습니다.

 2. 공간복잡도
 - 두 함수 모두 몇 개의 정수 변수와 반복문에서만 공간을 사용하므로, 공간 복잡도는 상수 공간 𝑂(1)입니다.
 - 배열을 추가적으로 생성하지 않고 입력된 주식 가격 배열을 그대로 사용합니다.
 - 따라서 **공간 복잡도는 𝑂(1)**입니다.
 */

// 입력 받기
let initialCash = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map { Int($0)! }

// 준현의 투자 방식 (BNP)
func bnpInvestment(cash: Int, prices: [Int]) -> Int {
    var remainingCash = cash
    var stocks = 0

    for price in prices {
        if remainingCash >= price {
            let maxStocksToBuy = remainingCash / price
            stocks += maxStocksToBuy
            remainingCash -= maxStocksToBuy * price
        }
    }

    return remainingCash + (stocks * prices.last!)
}

// 성민의 투자 방식 (TIMING)
func timingInvestment(cash: Int, prices: [Int]) -> Int {
    var remainingCash = cash
    var stocks = 0

    for i in 3..<prices.count {
        if prices[i-3] > prices[i-2] && prices[i-2] > prices[i-1] && remainingCash >= prices[i] {
            let maxStocksToBuy = remainingCash / prices[i]
            stocks += maxStocksToBuy
            remainingCash -= maxStocksToBuy * prices[i]
        } else if prices[i-3] < prices[i-2] && prices[i-2] < prices[i-1] && stocks > 0 {
            remainingCash += stocks * prices[i]
            stocks = 0
        }
    }

    return remainingCash + (stocks * prices.last!)
}

// 결과 비교 및 출력
let bnpResult = bnpInvestment(cash: initialCash, prices: prices)
let timingResult = timingInvestment(cash: initialCash, prices: prices)

if bnpResult > timingResult {
    print("BNP")
} else if bnpResult < timingResult {
    print("TIMING")
} else {
    print("SAMESAME")
}
