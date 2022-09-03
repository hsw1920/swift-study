//
//  DetailViewController.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import UIKit

// selection과 seperator None으로 바꿔줌

class DetailViewController: UIViewController {
    
    // 편집 후 reload하기 위해 아울렛 선언
    @IBOutlet weak var memoTableView: UITableView!
    
    // 이전화면에서 전달한 메모가 저장됨 -> 저장된 메모를 보기화면에 표시해야함
    var memo: Memo?
    
    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        // 22년9월2일 => locale 설정 안해도 한국어로 뜨네요
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    // 툴바의 버튼을 탭하면 실행됨 -> 세그웨이로 버튼이 전달됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 타입캐스팅하여 nav컨트롤러가 관리하는 첫번째vc(compose VC)로 메모가 전달됨
        if let vc = segue.destination.children.first as? ComposeViewController {
            vc.editTarget = memo
        }
    }
    
    //Notification token을 저장
    var token: NSObjectProtocol?
    // 먼저 옵저버 해제 구현
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 편집된 메모를 보기화면에서 바로 reload 업데이트 해줌
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self](noti) in
            self?.memoTableView.reloadData()
        })
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDataSource {
    // tableView가 표시할 cell 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // 어떤 cell을 호출 할 것인가?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath.row로 몇 번째 cell인지 확인
        // row는 0부터 시작
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            // 메모를 표시
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)
            // 날짜를 표시 -> DateFormatter 활용
            cell.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    
    }
    
    
}
