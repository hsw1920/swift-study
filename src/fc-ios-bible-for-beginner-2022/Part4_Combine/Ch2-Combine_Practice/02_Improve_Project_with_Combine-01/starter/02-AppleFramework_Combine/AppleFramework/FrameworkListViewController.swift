//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit
import Combine

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AppleFramework
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
//    let list: [AppleFramework] = AppleFramework.list
    
    // Combine
    var subscriptions = Set<AnyCancellable>()
    let didSelect = PassthroughSubject<AppleFramework, Never>()
    
    // @Published는 var로 바꿔서 선언해줘야함.
    //@Published var list: [AppleFramework] = AppleFramework.list
    
    // @Published 대신 CurrentValueSubject를 이용
    let items = CurrentValueSubject<[AppleFramework], Never>(AppleFramework.list)
    
    
    // Data, Presentation, Layout
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CollectionView Presentation, Layout 설정해주는 것
        // CollectionView 그리는데 필요한 Data를 설정해주는 것
        configureCollectionView()
        bind()
    }
    
    private func bind() {
        // input: 사용자 input을 받아서 처리해야할 것
        // - item 선택되었을 때 처리
        // didselect되었을 때 framework를 받아서 처리함
        didSelect
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
//                vc.framework = framework
                vc.framework.send(framework)
            self.present(vc, animated: true)
        }.store(in: &subscriptions)
        
        // output: data, state 변경에 따라서 UI 업데이트할 것
        // - items 세팅이 되었을 때 view(collectionView)를 업데이트

//        $list
//            .receive(on: RunLoop.main)
//            .sink { [unowned self] list in
//            applySectionItems(list)
//        }.store(in: &subscriptions)
        
        items
            .receive(on: RunLoop.main)
            .sink { [unowned self] items in
            applySectionItems(items)
        }.store(in: &subscriptions)
    }
    
    private func applySectionItems(_ items: [Item], to section: Section = .main) {
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([section])
        snapshot.appendItems(items, toSection: section)
        dataSource.apply(snapshot)
    }
    
    private func configureCollectionView() {
        // presentation
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // layer
        collectionView.collectionViewLayout = layout()
        
        collectionView.delegate = self
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        let spacing: CGFloat = 10
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemLayout, count:   3)
        groupLayout.interItemSpacing = .fixed(spacing)
        
        // Section
        let section = NSCollectionLayoutSection(group: groupLayout)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        section.interGroupSpacing = spacing
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let framework = list[indexPath.item]
        let framework = items.value[indexPath.item]
        
        print(">>> selected: \(framework.name)")
        didSelect.send(framework)
//        let sb = UIStoryboard(name: "Detail", bundle: nil)
//        let vc = sb.instantiateViewController(withIdentifier: "FrameworkDetailViewController") as! FrameworkDetailViewController
//        vc.framework = framework
//
//        present(vc, animated: true)
    }
}
