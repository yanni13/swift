//
//  ViewController.swift
//  PhotoSearch
//
//  Created by 아우신얀 on 11/5/23.
//

import UIKit
import SnapKit

struct APIResponse: Codable { //API응답에 대한 Codable프로토콜을 준수하는 구조체 정의
    let total: Int
    let total_pages: Int
    let result: [Result]
}

struct Result: Codable { //API응답에서 이미지 정보를 저장하기 위한 구조체 정의
    let id: String
    let urls: URLS
}

struct URLS: Codable { //이미지 URL정보를 저장하기 위한 구조체 정의
    let full: String
}

class ViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate{
    
    private var collectionView: UICollectionView?
    
    var results: [Result] = []
    
    let searchbar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        view.addSubview(searchbar)
        
        //UICollectionView의 레이아웃을 설정하고 생성
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2, height: view.frame.size.width/2)
        
        //UICollectionView를 생성하고 register 및 데이터 소스 결정
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        
        //UICollectionView를 뷰에 추가
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
    }
    
    //뷰가 레이아웃 될 때 호출되는 메서드
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchbar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: 50)
        collectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
    }
    
    //검색 버튼이 클릭될 때 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        if let text = searchbar.text {
            results = []
            collectionView?.reloadData()
            fetchPhotos(query: text)
        }
    }
    
    //지정된 키워드로 Unsplash API에서 이미지를 가져오는 메서드
    func fetchPhotos(query: String) {
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=cNtxMzMLT8_GFa8TE8ACB5MWVJFOILOE57YRviGQxuI"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.result
                    self?.collectionView?.reloadData()
                }
            } 
            catch  {
                print(error)
            }
        }
        
        task.resume()
    }
    
    //UICollectionView 데이터 소스 메서드 - 섹션내의 항목 수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    //UICollectionView 데이터 소스 메서드 - 각 항목의 셀 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.full
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ImageCollectionViewCell.identifier,
            for: indexPath
        ) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: imageURLString)
        return cell
    }
}
