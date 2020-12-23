//
//  ViewController.swift
//  NetworkingLayer
//
//  Created by pepe on 23/12/20.
//

import UIKit

class ViewController: UIViewController {

    //MARK: -- IBoutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    //MARK: -- variables
    var presenter: PostPresenter!
    //MARK: -- life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PostPresenter(view: self)
        tableView.delegate = self
        tableView.dataSource = self
        loading.startAnimating()
        presenter.getPosts()
    }
    

}
//MARK: -- table view implementation
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter.model.posts[indexPath.row].title
        cell.detailTextLabel?.text = presenter.model.posts[indexPath.row].body
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    

}

//MARK: -- MVP implementation
extension ViewController: PostViewDelegate{
    func onGetPostsSuccess(posts: [Post]) {
        tableView.reloadData()
        loading.stopAnimating()
    }
    
    func onGetPostsError(msg: String) {
        loading.stopAnimating()
        print("error al traer los posts")
    }
}

