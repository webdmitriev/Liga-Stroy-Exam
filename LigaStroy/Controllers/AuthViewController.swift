//
//  AuthViewController.swift
//  LigaStroy
//
//  Created by Олег Дмитриев on 18.08.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    var delegate: SceneDelegateProtocol?
    
    private let appBuilder = UIBuilder()
    
    // MARK: - Container page
    private lazy var containerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var titleLabel: UILabel = appBuilder.addLabel(text: "Войти", fontS: 34, fontW: .bold)
    
    // MARK: - Fields
    private lazy var textFieldEmail: UITextField = appBuilder.addTextField(placeholder: "Почта")
    private lazy var textFieldPassword: UITextField = appBuilder.addTextField(placeholder: "Пароль", secure: true)
    private lazy var textFieldPasswordBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(.yeyIcon, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: - Handlers
    private lazy var handlerBtn: UIButton = appBuilder.addButton(text: "ВОЙТИ")
    private lazy var hStack: UIStackView = appBuilder.addStack(alignment: .fill, distribution: .fill)
    private lazy var hStackText: UILabel = appBuilder.addLabel(text: "У вас нет аккаунта?", fontS: 18, fontW: .regular)
    private lazy var hStackBtn: UILabel = appBuilder.addLabel(text: "РЕГИСТРАЦИЯ", fontS: 18, fontW: .bold, color: .appBlue)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Handler to Showing Password Field
        textFieldPasswordBtn.addTarget(self, action: #selector(handleShowsPassword), for: .primaryActionTriggered)
        
        // MARK: - Handler to Tab Bar VC
        handlerBtn.addTarget(self, action: #selector(handleTabBarVC), for: .primaryActionTriggered)
        
        // MARK: - Handler to AuthViewController
        let tap = UITapGestureRecognizer(target: self, action: #selector(AuthViewController.handleRegistrVC))
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

        containerView.addSubviews(titleLabel, textFieldEmail, textFieldPassword, textFieldPasswordBtn, handlerBtn, hStack)

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
            textFieldEmail.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textFieldEmail.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textFieldEmail.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 10),
            textFieldPassword.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textFieldPassword.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0),
            
            textFieldPasswordBtn.centerYAnchor.constraint(equalTo: textFieldPassword.centerYAnchor, constant: 0),
            textFieldPasswordBtn.trailingAnchor.constraint(equalTo: textFieldPassword.trailingAnchor, constant: -22),
            
            // MARK: - Handlers
            handlerBtn.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 40),
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
    
    // MARK: - Handler to RegisterViewController
    @objc func handleRegistrVC(sender: UITapGestureRecognizer) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Gesture's
    @objc func tapGestureForHideKeyBoard() {
        textFieldEmail.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
    }
    
    
    // MARK: - Hide Nav Bar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}
