//
//  PrecedenceGroups.swift
//  TimeDecisionMaker
//
//  Created by Me on 5/23/19.
//

import Foundation

import Foundation

precedencegroup LeftFunctionApplicationPrecedence {
	associativity: left
	higherThan: RightFunctionApplicationPrecedence
}

precedencegroup RightFunctionApplicationPrecedence {
	associativity: right
	higherThan: AssignmentPrecedence
}
