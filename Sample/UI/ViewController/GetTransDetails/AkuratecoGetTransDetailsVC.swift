//
//  AkuratecoGetTransDetailsVC.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import AkuratecoSDK

final class AkuratecoGetTransDetailsVC: TransactionViewController {
    
    // MARK: - Private Properties
    
    private lazy var getTransactionDetailsAdapter: AkuratecoGetTransactionDetailsAdapter = {
        let adapter = AkuratecoAdapterFactory().createGetTransactionDetails()
        adapter.delegate = self
        return adapter
    }()
    
    // MARK: - Actions
    
    @IBAction func getTransactionDetailsAction() {
        executeRequest()
    }
    
    // MARK: - Private Methods
    
    private func executeRequest() {
        guard let selectedTransaction = selectedTransaction else { return }
        
        getTransactionDetailsAdapter.execute(transactionId: selectedTransaction.id,
                                             payerEmail: selectedTransaction.payerEmail,
                                             cardNumber: selectedTransaction.cardNumber) { (_) in
        }
    }
}

// MARK: - View life cycle

extension AkuratecoGetTransDetailsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAllAction()
    }
}

