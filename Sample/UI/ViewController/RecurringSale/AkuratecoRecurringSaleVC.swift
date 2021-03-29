//
//  AkuratecoRecurringSaleVC.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import AkuratecoSDK

final class AkuratecoRecurringSaleVC: TransactionViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tfRecurringFirstTransId: UITextField!
    @IBOutlet weak var tfRecurringToken: UITextField!
    
    @IBOutlet weak var tfOrderId: UITextField!
    @IBOutlet weak var tfOrderAmount: UITextField!
    @IBOutlet weak var tfOrderDescription: UITextField!
    
    @IBOutlet weak var btnAuth: AkuratecoButton!
    @IBOutlet weak var btnSale: AkuratecoButton!
    
    // MARK: - Private Properties
    
    private lazy var recurringSaleAdapter: AkuratecoRecurringSaleAdapter = {
        let adapter = AkuratecoAdapterFactory().createRecurringSale()
        adapter.delegate = self
        return adapter
    }()
    
    // MARK: - Actions
    
    @IBAction func loadRecurringSaleAction() {
        transactions = transactionStorage.getRecurringSaleTransactions()
    }
    
    @IBAction func randomizeAction() {
        tfOrderId.text = UUID().uuidString
        tfOrderAmount.text = String(format: "%.2f", Double.random(in: 0...10000))
        tfOrderDescription.text = faker.lorem.sentences()
        
        lbResponse.text = ""
    }
    
    @IBAction func authAction() {
        executeRequest(isAuth: true)
    }
    
    @IBAction func saleAction() {
        executeRequest(isAuth: false)
    }
    
    // MARK: - Private Methods
    
    override func setTansaction(_ transaction: AkuratecoTransactionStorage.Transaction?) {
        super.setTansaction(transaction)
        
        btnAuth.isEnabled = selectedTransaction != nil
        btnSale.isEnabled = selectedTransaction != nil

        tfRecurringFirstTransId.text = selectedTransaction?.id
        tfRecurringToken.text = selectedTransaction?.recurringToken
    }
    
    private func executeRequest(isAuth: Bool) {
        guard let selectedTransaction = selectedTransaction else { return }
        
        let amount = Double(tfOrderAmount.text ?? "") ?? 0
        
        let order = AkuratecoOrder(id: tfOrderId.text ?? "",
                                   amount: amount,
                                   description: tfOrderDescription.text ?? "")
        
        let recurringOptions = AkuratecoRecurringOptions(firstTransactionId: tfRecurringFirstTransId.text ?? "",
                                                         token: tfRecurringToken.text ?? "")
        
        let transaction = AkuratecoTransactionStorage.Transaction(payerEmail: selectedTransaction.payerEmail,
                                                                  cardNumber: selectedTransaction.cardNumber)
        
        recurringSaleAdapter.execute(order: order,
                                     options: recurringOptions,
                                     payerEmail: selectedTransaction.payerEmail,
                                     cardNumber: selectedTransaction.cardNumber,
                                     auth: isAuth) { [weak self] (response) in
            guard let self = self else { return }
            
            switch response {
            case .result(let result):
                transaction.fill(result: result.result)
                transaction.isAuth = isAuth
                
                switch result {
                case .recurring(let recurring): transaction.recurringToken = recurring.recurringToken
                default: break
                }
                
                self.transactionStorage.addTransaction(transaction)
                
            case .error, .failure: break
            }
        }
    }
}
