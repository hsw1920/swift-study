//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/06/05.
//

import Foundation
import UIKit
import Combine

class MyPointViewController: UIViewController {
    
    @IBOutlet weak var pointLabel: UILabel!

    //    var point: MyPoint = .default
    var viewModel: MyPointViewModel!
    var subscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
    }
    
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bind() {
        viewModel.$point
            .receive(on: RunLoop.main)
            .sink { point in
                self.pointLabel.text = "\(point.point) 원"
            }.store(in: &subscription)
    }
    
}
