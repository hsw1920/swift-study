//
//  ButtonBenefitViewController.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/06/05.
//

import UIKit
import Combine

class ButtonBenefitViewController: UIViewController {

    @IBOutlet weak var ctaButton: UIButton!
    @IBOutlet weak var vStackView: UIStackView!
    
    var viewModel: ButtonBenefitViewModel!
    var subscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
        viewModel.fetchDetails()
    }

    private func setupUI() {
        ctaButton.layer.masksToBounds = true
        ctaButton.layer.cornerRadius = 5
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bind() {
        // output: data
        
        viewModel.$benefit
            .receive(on: RunLoop.main)
            .sink { benefit in
                self.ctaButton.setTitle(benefit.ctaTitle, for: .normal)
            }.store(in: &subscription)
        
        // nil인 경우가 있을 수 있으므로 compactMap 사용함
        viewModel.$benefitDetails
            .compactMap { $0 }
            .receive(on: RunLoop.main)
            .sink { details in
                self.addGuides(details: details)
            }.store(in: &subscription)
        
        
    }
    
    private func addGuides(details: BenefitDetails) {

        // guard문을 통해서 guideViews는 최초 1회만 호출한다.
        let guidesView = vStackView.arrangedSubviews.filter { $0 is BenefitGuideView }
        guard guidesView.isEmpty else { return }
        
        let guideViews: [BenefitGuideView] = details.guides.map { guide in
            let guideView = BenefitGuideView(frame: .zero)
            guideView.icon.image = UIImage(systemName: guide.iconName)
            guideView.title.text = guide.guide
            return guideView
        }
        
        guideViews.forEach { view in
            self.vStackView.addArrangedSubview(view)
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    }
}
