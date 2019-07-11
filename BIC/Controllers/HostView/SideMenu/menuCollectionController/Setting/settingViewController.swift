//
//  settingViewController.swift
//  BIC
//
//  Created by Iwan Siauw on 5/9/19.
//  Copyright © 2019 Iwan Siauw. All rights reserved.
//

import UIKit

class settingViewController: UIViewController{

    lazy var tableView: UITableView = {
        
        let tv = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tv.register(settingTableViewCell.self, forCellReuseIdentifier: "cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.estimatedRowHeight = 250
        tv.rowHeight = UITableView.automaticDimension
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)

    }
}

extension settingViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  settingTableViewCell else {
            preconditionFailure("Unregistered table view cell")
        }
        
        return cell
        
    }
    
    
    
    
    
}
