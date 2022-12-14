//
//  ComposeViewController.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import UIKit

class ComposeViewController: UIViewController {
    
    // 편집한 메모를 저장하는 변수 선언 (detailVC의 메모가 editTarget 변수로 전달됨)
    var editTarget: Memo?
    // 편집이전의 메모내용을 저장
    var originalMemoContent: String?
    
    
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
        
        if let target = editTarget { // 편집모드
            target.content = memo
            DataManager.shared.saveContext()
            // 메모를 편집한 후에 보기화면이 바로 업데이트 되어야함
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
        } else { // 쓰기모드
            //DB에 입력한 메모를 저장
            DataManager.shared.addNewMemo(memo)
            // 메모를 편집한 후에 보기화면이 바로 업데이트 되어야함
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        }
        
        
        
        // modal 화면(새 메모)을 닫아줌
        dismiss(animated: true, completion: nil)
        
        // 언제 업데이트?
        // -> viewWillAppear 할 때 업데이트 해주면 좋음
        
    }
    
    var willShowToken: NSObjectProtocol?
    var willHideToken: NSObjectProtocol?
    
    // 옵저버 해제
    deinit {
        if let token = willShowToken {
            NotificationCenter.default.removeObserver(token)
        }
        
        if let token = willHideToken {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    // VC가 생성된 후 호출됨 -> 한번만 실행되는 초기화코드는 여기서 구현함
    override func viewDidLoad() {
        super.viewDidLoad()
        if let memo = editTarget {
            // 전달된 메모가 있다면
            navigationItem.title = "메모 편집" // 편집모드일경우의 save와
            memoTextView.text = memo.content
            originalMemoContent = memo.content // 편집된 메모
        } else { // 전달된 메모가 없다면
            navigationItem.title = "새 메모" // 새메모일경우의 save가 달라야함
            memoTextView.text = ""
        }
        
        // VC를 textView의 delegate 설정
        memoTextView.delegate = self
        
        // 키보드 표시되기 전 notification
        willShowToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self](noti) in
            // 키보드 높이만큼 여백 추가
            guard let strongSelf = self else { return }
            // notification으로 전달된 값을 활용하여 높이를 구해야함
            if let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let height = frame.cgRectValue.height // 키보드 높이를 저장
                var inset = strongSelf.memoTextView.contentInset // contentInset-> 여백저장
                inset.bottom = height // bottom 속성을 키보드 높이로 변경
                strongSelf.memoTextView.contentInset = inset // bottom을 제외한 나머지 여백 유지
                
                // textView오른쪽에 표시되는 스크롤바에도 같은 크기의 여백을 추가해야함
                inset = strongSelf.memoTextView.scrollIndicatorInsets
                inset.bottom = height
                strongSelf.memoTextView.scrollIndicatorInsets = inset
            }
        })
        
        willHideToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            guard let strongSelf = self else { return }
            // 여백을 제거 -> 키보드 높이를 계산할 필요 없음
            var inset = strongSelf.memoTextView.contentInset // 현재 inset을 변수에 저장한 후
            inset.bottom = 0 // 변수(bottom)를 0으로 바꿔줌
            strongSelf.memoTextView.contentInset = inset // 그리고 실제 값을 변경
            
            inset = strongSelf.memoTextView.scrollIndicatorInsets
            inset.bottom = 0
            strongSelf.memoTextView.scrollIndicatorInsets = inset
            
        })

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // First Responder => 입력포커스를 가진 뷰
        // textView를 firstResponder로 만들면 textView가 선택된 후
        // 키보드가 자동으로 표시된다.
        memoTextView.becomeFirstResponder()
        // 화면닫을때 해제해주면 좋음 -> viewWillDisappear에서
        
        // 편집화면이 표시되기 직전에 delegate로 설정되었다가
        navigationController?.presentationController?.delegate = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // (firstResponder 해제)
        // view가 사라질때 입력포커스 제거되고 키보드사라짐
        memoTextView.resignFirstResponder()
        // 편집화면이 사라지기 직전에 delegate로 해제됨
        navigationController?.presentationController?.delegate = nil
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

extension ComposeViewController: UITextViewDelegate {
    // 이 메소드는 textView에서 text를 편집할 때마다 반복적으로 호출됨
    func textViewDidChange(_ textView: UITextView) {
        if let original = originalMemoContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                isModalInPresentation = original != edited
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

extension ComposeViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        // 경고창 생성
        let alert = UIAlertController(title: "알림", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        // 확인버튼 눌렀을 때 구현해놓은 save메소드를 클로저로 전달
        let okAction = UIAlertAction(title: "확인", style: .default) {
            [weak self](action) in
            self?.save(action)
        }
        // 확인버튼액션추가
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) {
            [weak self](action) in
            self?.close(action)
        }
        // 취소버튼액션추가
        alert.addAction(cancelAction)
        // present 메소드를 통해 경고창을 표시함
        present(alert, animated: true, completion: nil)
    }
}


// Notification 추가
extension ComposeViewController {
    // Notification 추가
    
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
