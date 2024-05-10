//
//  ViewController.swift
//  machineTaskAssimentCoreBase
//
//  Created by Macintosh on 16/01/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var UserCollectionViewCell: UICollectionView!
    
    var url : URL?
    var urlRequest : URLRequest?
    var jsonDecoder : JSONDecoder?
    var user : [User] = []
    private let userCollectionViewCellIdentifier = "ProductCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        initializeCollectionView()
        registerXIBWithCollectionView()
    }
        func initializeCollectionView(){
        UserCollectionViewCell.dataSource = self
        UserCollectionViewCell.delegate = self
    }
        func registerXIBWithCollectionView(){
            let uiNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
            self.UserCollectionViewCell.register(uiNib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        }
    
    func fetchData(){
        var url = URL(string: "https://jsonplaceholder.typicode.com/users")
       var urlRequest = URLRequest(url: url!)
        var urlsession = URLSession(configuration: .default)
        var dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            self.user = try! JSONDecoder().decode([User].self, from: data!)
            print(self.user)
            DispatchQueue.main.async {
                self.UserCollectionViewCell.reloadData()
            }
        }
            
            
        dataTask.resume()
        
        
        
        }
    
    }



extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        user.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCollectionViewCell =
        self.UserCollectionViewCell.dequeueReusableCell(withReuseIdentifier: userCollectionViewCellIdentifier, for: indexPath) as! ProductCollectionViewCell
        userCollectionViewCell.userName.text = String(user[indexPath.item].name)
        userCollectionViewCell.userEmailId.text = String(user[indexPath.item].email)
        userCollectionViewCell.userId.text = String(user[indexPath.item].id)
//        userCollectionViewCell.userPhone.text(user[indexPath.item],phone)
        
        return userCollectionViewCell
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UserCollectionViewCell.frame.width)/2
        let height = 200.0
        return CGSize(width: width, height: height)
    }
}
extension ViewController : UICollectionViewDelegate{
    
}
