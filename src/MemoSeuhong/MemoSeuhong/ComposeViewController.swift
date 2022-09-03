//
//  ComposeViewController.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        guard let memo = memoTextView.text, memo.count > 0 else {
            // 메모를 입력하란 경고창 -> 따로 파일 만듦
            alert(message: "메모를 입력하세요")
            return
        }
        /* <<< Core Data 사용하지 않을 때의 경우임 >>>
         
        // memo에 제대로 저장됐을 경우 guard문 다음의 코드가 실행됨
        //let newMemo = Memo(content: memo)        
        // 이때 메모가 배열에 정상적으로 저장되지만 tableView가 자동으로 인식하지 못하므로 업데이트 해주어야함
        //Memo.dummyMemoList.append(newMemo)
        */
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        // modal 화면(새 메모)을 닫아줌
        dismiss(animated: true, completion: nil)
        
        // 언제 업데이트?
        // -> viewWillAppear 할 때 업데이트 해주면 좋음
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

// Notification 추가
extension ComposeViewController {
    // Notification 추가
    
    static let newMemoDidInsert = Notification.Name("newMemoDidInsert")
    
}
