//
//  MemoListTableViewController.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import UIKit

// TableView 구현방식
// 1. 테이블뷰 배치
// 2. 프로토타입 셀 디자인, 셀 identifier 지정
// 3. datasource, delegate 연결
// 4. datasource 구현
// 5. delegate 구현


class MemoListTableViewController: UITableViewController {

    let formatter: DateFormatter = {
       let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        // 22년9월2일 => locale 설정 안해도 한국어로 뜨네요
        f.locale = Locale(identifier: "Ko_kr")
        return f
    }()
    
    // view가 나타날때마다 실행됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        // tableView에 data를 reload
//        tableView.reloadData()
//
//        // 제대로 실행되고 있는지 log print
//        //print(#function)
    }
    
    var token: NSObjectProtocol?
    // deinit 이란? (소멸자)  + 구조체가 아닌 class 타입에서만 작성가능하다.
    // -> 특정 인스턴스가 더이상 필요없을때 메모리 공간 확보를 위해 해당 인스턴스를 자동적으로 메모리 해제함.
    // 클래스의 소멸자는 하나의 클래스 인스턴스 당 최대 하나씩 존재함.
    // 별도의 매개변수나 괄호를 명시하지 않음.
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    // View Life Cycle 중 단 한번만 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 옵저버 추가
        // UI 업데이트? -> main 스레드에서 처리해야함
        // -> DispatchQueue나 OperationQueue에서 담당함
        
        // addObserver는 토큰으로 사용됨
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue: OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
       
        // 노티피케이션에서 가장 중요한것은 옵저버를 해제하는것
        // -> 앱은 정상실행 되지만 내부에서는 메모리가 낭비되고 있음
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Memo.dummyMemoList.count
    }

    
    // 개별 cell을 표시할 때마다 반복적으로 호출 됨
    // indexPath : 특정 cell 위치를 표현할 때 사용됨
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // identifier가 "cell"인 Cell을 자동으로 생성하여 cell에 저장함
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        let target = Memo.dummyMemoList[indexPath.row]
        // SubTitle 스타일을 사용하였음.
        // SubTitle : 2개의 Label 존재함
        // => textLabel, detailTextLabel을 configure함
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(from: target.insertDate)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
