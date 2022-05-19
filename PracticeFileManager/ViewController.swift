//
//  ViewController.swift
//  PracticeFileManager
//
//  Created by Apple New on 2022-05-19.
//

import UIKit
import Elements

class ViewController: UIViewController {
    
    lazy var firstButton: BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Push Me!", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 2
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(firBTNHandler), for: .touchUpInside)
        return button
    }()
    
    lazy var secondButton: BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Push Me!", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 2
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(secBTNHandler), for: .touchUpInside)
        return button
    }()
    
    lazy var thirdButton: BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Push Me!", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 2
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.addTarget(self, action: #selector(thrBTNHandler), for: .touchUpInside)
        return button
    }()
    
    lazy var content: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(firstButton)
        stack.addArrangedSubview(secondButton)
        stack.addArrangedSubview(thirdButton)
        stack.spacing = 10
        return stack
    }()
    
    let manager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(content)
        
        NSLayoutConstraint.activate([
            content.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            content.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        
    }

    
    @objc func firBTNHandler(){
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        print(url)
        
        let newFolder = url.appendingPathComponent("FirstFile")
        
        do{
            try manager.createDirectory(at: newFolder, withIntermediateDirectories: true, attributes: [:])
        }catch{
            print("Error first BTN: \(error.localizedDescription)")
        }
    }
    
    @objc func secBTNHandler(){
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        print(url)
        let newFolder = url.appendingPathComponent("SecondFile").appendingPathComponent("SecondLayer").appendingPathComponent("ThirdLayer")
        
        do{
            try manager.createDirectory(at: newFolder, withIntermediateDirectories: true, attributes: [:])
        }catch{
            print("Error second BTN: \(error.localizedDescription)")
        }
    }

    @objc func thrBTNHandler(){
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        print(url)
        let newFolder = url.appendingPathComponent("ThirdFile")

            let fileUrl = newFolder.appendingPathComponent("logs.txt")
            let dataS = "WRITING TEST".data(using: .utf8)
        manager.createFile(atPath: fileUrl.path, contents: dataS, attributes: [FileAttributeKey.creationDate : Date()])
       print("fsdfdsfsd")
//            print("Error third BTN: \(error.localizedDescription)")
        
    }
}

