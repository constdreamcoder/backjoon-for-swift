//
//  10798.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/2/24.
//

import Foundation

/**
 설명 - 문자열
 1. 초기 5 x 15의 이중 배열 선언해서 입력을 모두 추가
 2. 이 딕셔너리에서 알파벳 개수가 2개 이상일 때는 ? 아니면 가장 많은 수를 가진 알파벳 반환
 
 성능 분석
 1. 시간복잡도
 - 초기 크기가 (5 x 15)인 이중 배열을 초기화했으므로 시간복잡도는 O(5 x 15) = O(75)로, 상수시간이다. 따라서 총 시간복잡도는 **O(1)**이다.
 2. 공간복잡도
 - 5 x 15로 선언된 이중배열을 이중 루프를 통해 순회하므로 총 공간복잡도는 **O(1)**이다.
 */

var words = [[String]](repeating: [String](repeating: "", count: 15), count: 5)

for i in 0..<5 {
    let word = readLine()!.map { String($0) }
    let lastIndex = word.count - 1
    words[i].replaceSubrange(0..<lastIndex, with: word)
}

for column in 0..<15 {
    for row in 0..<5 {
        print(words[row][column], terminator: "")
    }
}
