//
//  2164.swift
//  BackJoonCodingPrac
//
//  Created by SUCHAN CHANG on 11/20/24.
//

import Foundation

/**
 설명 - 큐를 이용한 카드 게임
 1. `queue`는 1부터 n까지의 숫자를 포함하는 배열로 초기화됩니다.
 2. while 루프는 `queue`에 숫자가 하나 남을 때까지 반복됩니다.
    - 첫 번째 숫자를 제거(`removeFirst()`)하여 버립니다.
    - 다음 숫자를 제거한 뒤(`removeFirst()`), 이를 `queue`의 맨 뒤에 추가(`append()`)합니다.
 3. 루프가 종료되면 `queue`에 남은 유일한 숫자를 출력합니다.
 
 성능 분석
 1. 시간복잡도
 - `removeFirst()` 연산은 **O(n)**의 시간 복잡도를 가집니다. 이는 배열의 첫 번째 요소를 제거한 뒤, 나머지 요소를 앞으로 이동시키기 때문입니다.
 - `append()` 연산은 평균적으로 **O(1)**의 시간 복잡도를 가집니다.
 - 각 반복 루프는 두 개의 `removeFirst()`와 한 번의 `append()`를 수행하므로, **한 번의 반복에서 O(n)**의 시간이 소요됩니다.
 - 루프는 초기 큐 크기 n에 비례하여 반복되므로, **전체 시간 복잡도는 O(n²)**입니다.
 
 2. 공간복잡도
 - `queue`는 배열로 구현되며, 초기 크기는 **O(n)**입니다.
 - while 루프에서 배열의 크기는 점진적으로 줄어들지만, 공간 복잡도는 배열 크기에 비례합니다.
 - 따라서 **공간 복잡도는 O(n)**입니다.
 
 개선 사항
 - `removeFirst()`로 인해 발생하는 **O(n²)**의 시간 복잡도를 해결하려면, 효율적인 큐 자료구조를 사용해야 합니다.
 - Swift의 `ArraySlice`를 사용해 `removeFirst()`를 **O(1)**로 줄이면 전체 시간 복잡도는 **O(n)**로 개선됩니다.
 */


let n = Int(readLine()!)!
var queue = Array(1...n)[...]

while queue.count > 1 {
    queue.removeFirst() // 첫 번째 카드 버림
    queue.append(queue.removeFirst()) // 다음 카드를 맨 뒤로 이동
}

print(queue.first!) // 마지막 남은 카드 출력

