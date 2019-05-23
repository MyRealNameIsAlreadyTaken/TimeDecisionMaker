//
//  Operators.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import Foundation

infix operator <*>: LeftFunctionApplicationPrecedence
func <*> <T, U>(funcArray: [(T) -> U?], array: [T]) -> [U] {
	return array.flatMap { value in
		funcArray.compactMap {
			$0(value)
		}
	}
}

infix operator <§>: LeftFunctionApplicationPrecedence
func <§> <T, U>(f: (T) -> U, array: [T]) -> [U] {
	return array.map(f)
}

func <§> <T, U>(f: (T) -> U, value: T?) -> U? {
	return value.map(f)
}

infix operator §: RightFunctionApplicationPrecedence
func § <T, U>(f: (T) -> U, value: T) -> U {
	return f(value)
}
