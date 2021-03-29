//
//  AkuratecoGetTransStatusVC.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import AkuratecoSDK

final class AkuratecoGetTransStatusVC: TransactionViewController {
    
    // MARK: - Private Properties
    
    private lazy var getTransactionStatusAdapter: AkuratecoGetTransactionStatusAdapter = {
        let adapter = AkuratecoAdapterFactory().createGetTransactionStatus()
        adapter.delegate = self
        return adapter
    }()
    
    // MARK: - Actions
    
    @IBAction func getTransactionStatusAction() {
        executeRequest()
    }
    
    // MARK: - Private Methods
    
    private func executeRequest() {
        guard let selectedTransaction = selectedTransaction else { return }
        
        getTransactionStatusAdapter.execute(transactionId: selectedTransaction.id,
                                            payerEmail: selectedTransaction.payerEmail,
                                            cardNumber: selectedTransaction.cardNumber) { _ in
        }
    }
}

// MARK: - View life cycle

extension AkuratecoGetTransStatusVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAllAction()
    }
}
