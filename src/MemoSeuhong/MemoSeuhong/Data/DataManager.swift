//
//  DataManager.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/03.
//

import Foundation
import CoreData

// DataManager class는 싱글톤으로 구현함
class DataManager {
    // 공유 인스턴스를 저장할 타입프로퍼티 추가
    static let shared = DataManager()
    // 앱 전체에서 하나의 인스턴스를 공유할 수 있음
    // 싱글톤은 ios에서 자주 활용되는 패턴임 -> Singleton 찾아보기
    private init() {
        
    }
    // Core Data에서 실행하는 대부분 작업은 context 객체가 담당하게된다. -> 이번엔 기본적인 context를 사용할것임
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // memo를 DB에서 읽어오는 코드
    // memo를 저장할 배열을 선언하고 빈 배열로 초기화
    var memoList = [Memo]()
    
    // data를 DB에서 읽어오는 용어? -> iOS에서는 이를 "fetch"라고 함
    func fetchMemo() {
        // DB에서 data를 읽어올때는 먼저 fetchRequest를 만들어야함
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        // 기본적으로 Core Data가 리턴해주는 data는 정렬되어있지 않으므로
        // sortDescriptors를 통하여 정렬을 따로 처리해줘야함
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        // 우리가 만든 fetchRequest를 실행하고 data를 가져오는 코드
        do {
            // fetch메소드는 throw이므로(예외가 있을 수 있음)
            // do catch문의 "do"에서 "try"를 통해서 사용해야함
            // DB의 메모가 날짜를 기준으로 내림차순 후 최종결과가 memoList배열에 저장된다.
            memoList = try mainContext.fetch(request)
            // 이후 tableView가 memoList에 저장된 메모를 표시하도록 수정해야함
        } catch {
            print(error)
        }
        
    }
    
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "MemoSeuhong")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
