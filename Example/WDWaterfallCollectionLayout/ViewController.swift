//
//  ViewController.swift
//  WDWaterfallCollectionLayout
//
//  Created by scott on 12/07/2024.
//  Copyright (c) 2024 scott. All rights reserved.
//

import UIKit
import WDWaterfallCollectionLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = WDWaterfallCollectionLayout()
        layout.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.dataSource = self
        let collectionView = UICollectionView(frame: view!.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

}

extension ViewController: UICollectionViewDataSource ,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .randomColor
        return cell
    }
}


extension ViewController: WDWaterfallCollectionLayoutDataSource{
    func heightForItems(in waterfallCollectionLayout: WDWaterfallCollectionLayout) -> CGFloat {
        return CGFloat(arc4random_uniform(150)+50)
    }
}
