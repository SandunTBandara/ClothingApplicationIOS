//
//  PaymentModel.swift
//  ClothingApplication
//
//  Created by Sandun Bandara on 2024-03-29.
//

import SwiftUI

struct PaymentModel: Identifiable, Equatable {
    
    var id: Int = 0
    var name: String = ""
    var cardNumber: String = ""
    var cardMonth: String = ""
    var cardYear: String = ""
    
    
    init(dict: NSDictionary) {
        self.id = dict.value(forKey: "pay_id") as? Int ?? 0
        self.name = dict.value(forKey: "name") as? String ?? ""
        self.cardNumber = dict.value(forKey: "card_number") as? String ?? ""
        self.cardMonth = dict.value(forKey: "card_month") as? String ?? ""
        self.cardYear = dict.value(forKey: "card_year") as? String ?? ""
    }
    
    static func == (lhs: PaymentModel, rhs: PaymentModel) -> Bool {
        return lhs.id == rhs.id
    }
}

