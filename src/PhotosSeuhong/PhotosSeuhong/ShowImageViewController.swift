//
//  ShowImageViewController.swift
//  PhotosSeuhong
//
//  Created by 홍승완 on 2022/09/06.
//

import UIKit

class ShowImageViewController: UIViewController {
    @IBOutlet weak var detailImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
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
