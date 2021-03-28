//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Yuriy Kalugin on 28.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var splittedSumLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var model: TipSplitModel? = nil;
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true);
    }
    
    override func viewDidLoad() {
        splittedSumLabel.text = String(format: "%.2f", Double(truncating: model!.splittedSum as NSNumber));
        descriptionLabel.text = String(format: "Split between %d people, with %.2f%% tip.", model!.personsCount, Double(truncating: model!.tipPercent as NSNumber) * 100.0);
    }
    
}
