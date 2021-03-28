//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tipButtons: [UIButton]!
    @IBOutlet weak var personCountLabel: UILabel!
    @IBOutlet weak var billSumText: UITextField!
    @IBOutlet weak var personCountStepper: UIStepper!
    @IBOutlet weak var zeroPrcButton: UIButton!
    @IBOutlet weak var tenPrcButton: UIButton!
    @IBOutlet weak var twentyPrcButton: UIButton!
    
    var model: TipSplitModel = TipSplitModel(personsCount: 4, tipPercent: 0.1, billSum: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad();
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap);
        self.updateView();
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "openModalCalculate") {
            let controller = segue.destination as! ResultViewController;
            controller.model = self.model;
        }
    }
        
    func updateView() {
        billSumText.text = model.billSum.description;
        personCountLabel.text = String(model.personsCount)
        personCountStepper.value = Double(model.personsCount)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        for button in self.tipButtons {
            button.isSelected = false;
        }
        sender.isSelected = true;
        if (sender == zeroPrcButton) {
            model.tipPercent = 0;
        } else if (sender == tenPrcButton) {
            model.tipPercent = 0.1;
        } else {
            model.tipPercent = 0.2;
        }
    }
    
    @IBAction func personCountChanged(_ sender: UIStepper) {
        model.personsCount = Int(sender.value);
        updateView();
    }
    @IBAction func billSumTextChanged(_ sender: UITextField!) {
        model.billSum = Decimal(string: sender.text!)!;
    }
}

