//
//  TipSplitModel.swift
//  Tipsy
//
//  Created by Yuriy Kalugin on 27.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipSplitModel {
    var personsCount: Int;
    var tipPercent: Decimal;
    var billSum: Decimal;
    
    var splittedSum: Decimal {
        get {
            return self.billSum * (1.0 + self.tipPercent) / Decimal(self.personsCount);
        }
    }
}
