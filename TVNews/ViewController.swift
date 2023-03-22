//
//  ViewController.swift
//  TVNews
//
//  Created by VIJAY M on 28/02/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailsCollection: UICollectionView!
    
    var apiKey = "4adc9aa3-d912-42fc-bc25-aafc665627e2"
    var articles = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        detailsCollection.register(UINib(nibName: "NewsDetailCell", bundle: nil), forCellWithReuseIdentifier: "NewsDetailCell")
        detailsCollection.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 375, height: 375)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsDetailCell", for: indexPath) as? NewsDetailCell {
            
            let thumpImg = articles[indexPath.row].fields.thumbnail
            let titleStr = articles[indexPath.row].fields.body
            
            cell.detailLbl.text = titleStr
            if let imgURL = URL(string: thumpImg) {
                cell.imgView.load(imgURL)
            }
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func fetch(_ url: URL) {
        do {
            let data = try Data(contentsOf: url)
            let response = try JSONDecoder().decode(NewsResponse.self, from: data)
            articles = response.response.results
            self.detailsCollection.reloadData()
        } catch {
            debugPrint("data not occurred \(error.localizedDescription)")
        }
    }
}

//extension ViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//
//        if text.isEmpty {
//            guard let title = title else {return}
//            guard let url = URL(string: "https://content.guardianapis.com/\(title)?api-key=\(apiKey)&show-fields=thumbnail,headline,standfirst,body") else {return}
//            DispatchQueue.global(qos: .userInteractive).async {
//                self.fetch(url)
//            }
//        } else {
//            guard let url = URL(string: "https://content.guardianapis.com/search?api-key=\(apiKey)&q=\(text)&show-fields=thumbnail,headline,standfirst,body") else { return }
//
//            DispatchQueue.global(qos: .userInteractive).async {
//                self.fetch(url)
//            }
//        }
//    }
//}
