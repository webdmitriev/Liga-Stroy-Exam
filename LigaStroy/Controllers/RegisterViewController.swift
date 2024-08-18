//
//  RegisterViewController.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 17.08.2024.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var delegate: SceneDelegateProtocol?
    
    private let appBuilder = UIBuilder()
    
    // MARK: - Container page
    private lazy var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var titleLabel: UILabel = appBuilder.addLabel(text: "Регистрация", fontS: 34, fontW: .bold)
    
    // MARK: - Fields
    private lazy var textFieldName: UITextField = appBuilder.addTextField(placeholder: "Имя")
    private lazy var textFieldEmail: UITextField = appBuilder.addTextField(placeholder: "Почта")
    private lazy var textFieldPassword: UITextField = appBuilder.addTextField(placeholder: "Пароль", secure: true)
    private lazy var textFieldPasswordBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.yeyIcon, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: - Checkbox
    private lazy var hStackPrivacyPolicy: UIStackView = appBuilder.addStack(alignment: .fill, distribution: .fill, spacing: 22)
    private lazy var checkboxPrivacyPolicy: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.checkbox, for: .normal)
        return $0
    }(UIButton())
    private lazy var textprivacyPolicy: UILabel = appBuilder.addLabel(text: "Я согласен с Условиями предоставления услуг \nи Политикой конфиденциальности", fontS: 13, fontW: .regular, color: .appText)
    
    // MARK: - Handlers
    private lazy var handlerBtn: UIButton = appBuilder.addButton(text: "РЕГИСТРАЦИЯ")
    private lazy var hStack: UIStackView = appBuilder.addStack(alignment: .fill, distribution: .fill)
    private lazy var hStackText: UILabel = appBuilder.addLabel(text: "Уже есть аккаунт?", fontS: 18, fontW: .regular)
    private lazy var hStackBtn: UILabel = appBuilder.addLabel(text: "ВОЙТИ", fontS: 18, fontW: .bold, color: .appBlue)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Handler to Showing Password Field
        textFieldPasswordBtn.addTarget(self, action: #selector(handleShowsPassword), for: .primaryActionTriggered)
        
        // MARK: - Handler to Tab Bar VC
        handlerBtn.addTarget(self, action: #selector(handleTabBarVC), for: .primaryActionTriggered)
        
        // MARK: - Handler to AuthViewController
        let tap = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.handleAuthVC))
        hStackBtn.isUserInteractionEnabled = true
        hStackBtn.addGestureRecognizer(tap)
        
        setupUI()
        constraitionUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        titleLabel.textAlignment = .center
        hStackText.textAlignment = .right
        hStackBtn.textAlignment = .center


        view.addSubview(containerView)

        containerView.addSubviews(titleLabel, textFieldName, textFieldEmail, textFieldPassword, textFieldPasswordBtn, hStackPrivacyPolicy, handlerBtn, hStack)
        
        hStackPrivacyPolicy.addArrangedSubviews(checkboxPrivacyPolicy, textprivacyPolicy)

        hStack.addArrangedSubviews(hStackText, hStackBtn)
        
        // MARK: - Gesture's
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureForHideKeyBoard))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Constraint
    private func constraitionUI() {
        NSLayoutConstraint.activate([
            // MARK: - Container page
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: appBuilder.offsetPage),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -appBuilder.offsetPage),

            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            // MARK: - Fields
            textFieldName.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            textFieldName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textFieldName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10),
            textFieldEmail.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textFieldEmail.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 10),
            textFieldPassword.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textFieldPassword.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textFieldPasswordBtn.centerYAnchor.constraint(equalTo: textFieldPassword.centerYAnchor, constant: 0),
            textFieldPasswordBtn.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor, constant: -22),
            
            // MARK: - Checkbox
            hStackPrivacyPolicy.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 25),
            hStackPrivacyPolicy.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            hStackPrivacyPolicy.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            // MARK: - Handlers
            handlerBtn.topAnchor.constraint(equalTo: hStackPrivacyPolicy.bottomAnchor, constant: 40),
            handlerBtn.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            handlerBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            hStack.topAnchor.constraint(equalTo: handlerBtn.bottomAnchor, constant: 25),
            hStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            hStack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            hStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    // MARK: - Handler to Showing Password Field
    @objc func handleShowsPassword() {
        self.textFieldPassword.isSecureTextEntry = !self.textFieldPassword.isSecureTextEntry
    }
    
    // MARK: - Handler to Tab Bar VC
    @objc func handleTabBarVC(sender: UITapGestureRecognizer) {
        self.delegate?.changeRootVC()
    }
    
    // MARK: - Handler to AuthViewController
    @objc func handleAuthVC(sender: UITapGestureRecognizer) {
        let authVC = AuthViewController()
        authVC.delegate = self.delegate
        self.navigationController?.pushViewController(authVC, animated: true)
    }
    
    // MARK: - Gesture's
    @objc func tapGestureForHideKeyBoard() {
        textFieldName.resignFirstResponder()
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
}
