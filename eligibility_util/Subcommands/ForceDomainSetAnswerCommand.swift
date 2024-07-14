//
//  ForceDomainSetAnswerCommand.swift
//  eligibility
//
//  Created by Kyle on 2024/7/14.
//

import ArgumentParser
import Foundation

struct ForceDomainSetAnswerCommand: ParsableCommand {
    static var configuration: CommandConfiguration = CommandConfiguration(
        commandName: "forceDomainSetAnswer"
    )
    
    @Option(help: "The domain set to force the answer for")
    var domainSet: EligibilityDomainTypes
    
    @Option(help: "The answer to force")
    var answer: EligibilityAnswer
    
    func run() throws {
        let result = os_eligibility_force_domain_set_answers(domainSet, answer, nil)
        if result == 0 {
            print("Force domain set answer successfully")
        } else {
            print("Force domain set answer failed: errorNum \(result)")
        }
    }
}
