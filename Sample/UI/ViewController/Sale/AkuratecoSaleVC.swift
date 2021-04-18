//
//  AkuratecoSaleVC.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import Fakery
import AkuratecoSDK

final class AkuratecoSaleVC: BaseViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tfOrderId: UITextField!
    @IBOutlet private weak var tfOrderAmount: UITextField!
    @IBOutlet private weak var tfOrderDescription: UITextField!
    @IBOutlet private weak var tfOrderCurrencyCode: UITextField!
    
    @IBOutlet private weak var tfPayerFirstName: UITextField!
    @IBOutlet private weak var tfPayerLastName: UITextField!
    @IBOutlet private weak var tfPayerAddress: UITextField!
    @IBOutlet private weak var tfPayerCountryCode: UITextField!
    @IBOutlet private weak var tfPayerCity: UITextField!
    @IBOutlet private weak var tfPayerZip: UITextField!
    @IBOutlet private weak var tfPayerEmail: UITextField!
    @IBOutlet private weak var tfPayerPhone: UITextField!
    @IBOutlet private weak var tfPayerIpAddress: UITextField!
    
    @IBOutlet private weak var tfPayerMiddleName: UITextField!
    @IBOutlet private weak var tfPayerAddress2: UITextField!
    @IBOutlet private weak var tfPayerState: UITextField!
    @IBOutlet private weak var tfPayerBirthday: UITextField!
    
    @IBOutlet private weak var btnSuccessSaleCard: AkuratecoRadioButton!
    @IBOutlet private weak var btnFailueSaleCard: AkuratecoRadioButton!
    @IBOutlet private weak var btnFailureCaptureCard: AkuratecoRadioButton!
    @IBOutlet private weak var btnSuccess3dSecureSaleCard: AkuratecoRadioButton!
    @IBOutlet private weak var btnFailure3dSecureSaleCard: AkuratecoRadioButton!
    
    @IBOutlet private weak var swtInitRecurringSale: UISwitch!
    @IBOutlet private weak var tfChannelId: UITextField!
    
    // MARK: - Private Properties
    
    private lazy var cardsContainer = AkuratekoRadioButtonContainer(btnSuccessSaleCard,
                                                                    btnFailueSaleCard,
                                                                    btnFailureCaptureCard,
                                                                    btnSuccess3dSecureSaleCard,
                                                                    btnFailure3dSecureSaleCard)
    
    private lazy var saleAdapter: AkuratecoSaleAdapter = {
        let adapter = AkuratecoAdapterFactory().createSale()
        adapter.delegate = self
        return adapter
    }()
    
    // MARK: - Actions
    
    @IBAction func clearTransactionAction() {
        transactionStorage.clearTransactions()
    }
    
    @IBAction func randomizeRequairedAction() {
        randomize(isAll: false)
    }
    
    @IBAction func randomizeAllAction() {
        randomize(isAll: true)
    }
    
    @IBAction func authRequestAction() {
        executeRequest(isAuth: true)
    }
    
    @IBAction func saleRequestAction() {
        executeRequest(isAuth: false)
    }
}

// MARK: - View life cycle

extension AkuratecoSaleVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardsContainer.selectButton(at: 0)
    }
}

// MARK: - Private Methods

private extension AkuratecoSaleVC {
    func randomize(isAll: Bool) {
        tfOrderId.text = UUID().uuidString
        tfOrderAmount.text = String(format: "%.2f", Double.random(in: 0...100000))
        tfOrderDescription.text = faker.lorem.sentences()
        tfOrderCurrencyCode.text = ["UAH", "USD"].randomElement()
        
        tfPayerFirstName.text = faker.name.firstName()
        tfPayerLastName.text = faker.name.lastName()
        tfPayerAddress.text = faker.address.secondaryAddress()
        tfPayerCountryCode.text = faker.address.countryCode()
        tfPayerCity.text = faker.address.city()
        tfPayerZip.text = faker.address.postcode()
        tfPayerEmail.text = faker.internet.email()
        tfPayerPhone.text = faker.phoneNumber.phoneNumber()
        tfPayerIpAddress.text = faker.internet.ipV4Address()
        
        cardsContainer.selectButton(at: .random(in: 0..<4))
        lbResponse.text = ""
        
        if (isAll) {
            tfPayerMiddleName.text = faker.name.lastName()
            tfPayerAddress2.text = faker.address.streetName() + faker.address.buildingNumber()
            tfPayerState.text = faker.address.state()
            tfPayerBirthday.text = Faker.birthday()
            
            swtInitRecurringSale.isOn = .random()
            tfChannelId.text = String(UUID().uuidString.prefix(16))
            
        } else {
            tfPayerMiddleName.text = ""
            tfPayerAddress2.text = ""
            tfPayerState.text = ""
            tfPayerBirthday.text = ""
            
            swtInitRecurringSale.isOn = false
            tfChannelId.text = ""
        }
    }
    
    func executeRequest(isAuth: Bool) {
        guard let selectedCardIndex = cardsContainer.selectedIndex else { return }
        
        let order = AkuratecoSaleOrder(id: tfOrderId.text ?? "",
                                       amount: Double(tfOrderAmount.text ?? "") ?? 0,
                                       currency: tfOrderCurrencyCode.text ?? "",
                                       description: tfOrderDescription.text ?? "")
        
        let card = getCard(at: selectedCardIndex)
        
        let payerOptions = AkuratecoPayerOptions(middleName: tfPayerMiddleName.text,
                                                 birthdate: Foundation.Date.formatter.date(from: tfPayerBirthday.text ?? ""),
                                                 address2: tfPayerAddress2.text,
                                                 state: tfPayerState.text)
        
        let payer = AkuratecoPayer(firstName: tfPayerFirstName.text ?? "",
                                   lastName: tfPayerLastName.text ?? "",
                                   address: tfPayerAddress.text ?? "",
                                   country: tfPayerCountryCode.text ?? "",
                                   city: tfPayerCity.text ?? "",
                                   zip: tfPayerZip.text ?? "",
                                   email: tfPayerEmail.text ?? "",
                                   phone: tfPayerPhone.text ?? "",
                                   ip: tfPayerIpAddress.text ?? "",
                                   options: payerOptions)
        
        let saleOptions = AkuratecoSaleOptions(channelId: tfChannelId.text,
                                               recurringInit: swtInitRecurringSale.isOn)
        
        let transaction = AkuratecoTransactionStorage.Transaction(payerEmail: payer.email,
                                                                  cardNumber: card.number)
        
        let termUrl3ds = "https://akurateco.com/"
        
        saleAdapter.execute(order: order,
                            card: card,
                            payer: payer,
                            termUrl3ds: termUrl3ds,
                            options: saleOptions,
                            auth: isAuth) { [weak self] (response) in
            guard let self = self else { return }
            
            switch response {
            case .result(let result):
                transaction.fill(result: result.result)
                transaction.isAuth = true
                
                switch result {
                case .recurring(let result):
                    transaction.recurringToken = result.recurringToken
                    
                case .secure3d(let result):
                    self.openRedirect3Ds(termUrl: result.redirectParams.termUrl,
                                         termUrl3Ds: termUrl3ds,
                                         redirectUrl: result.redirectUrl,
                                         paymentRequisites: result.redirectParams.paymentRequisites)
                    
                default: break
                }
                
                self.transactionStorage.addTransaction(transaction)
                
            case .error, .failure: break
            }
        }
    }
    
    func getCard(at index: Int) -> AkuratecoCard {
        switch index {
        case 1: return AkuratecoTestCard.saleFailure
        case 2: return AkuratecoTestCard.captureFailure
        case 3: return AkuratecoTestCard.secure3dSuccess
        case 4: return AkuratecoTestCard.secure3dFailure
        default: return AkuratecoTestCard.saleSuccess
        }
    }
}
