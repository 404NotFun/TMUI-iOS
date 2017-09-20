//
//  TMUIFavoritesSelectionViewController.swift
//  TMUI
//
//  Created by Jason Tsai on 2017/4/24.
//  Copyright © 2017年 YomStudio. All rights reserved.
//

import UIKit

public class TMUIFavoritesSelectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let UNSELECTED_GRAY = UIColor.init(red: 215, green: 216, blue: 216, alpha: 0.5)
    let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    
    var cellBackgroundImages = [UIImage]()
    var cellTitles = [String]()
    var selectedIndexs = [Int]()
    var favoriteCheckAry = [Int]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(TMUIFavoritesSelectionCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension TMUIFavoritesSelectionViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellTitles.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TMUIFavoritesSelectionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! TMUIFavoritesSelectionCollectionViewCell
//        cell.titleLbl.text = cellTitles[indexPath.item]
//        updateCellTitleLabel(lbl: cell.titleLbl, checkValue: self.favoriteCheckAry[indexPath.item])
        DispatchQueue.main.async {
//            cell.backgroundImageView.image = self.cellBackgroundImages[indexPath.item]
            cell.layer.shouldRasterize = true;
            cell.layer.rasterizationScale = UIScreen.main.scale;
        }
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        favoriteCheckAry[indexPath.item] = favoriteCheckAry[indexPath.item] == 4 ? 0 : 4
        let cell = collectionView.cellForItem(at: indexPath) as! TMUIFavoritesSelectionCollectionViewCell
        
//        updateCellTitleLabel(lbl: cell.titleLbl, checkValue: self.favoriteCheckAry[indexPath.item])
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: collectionView.frame.size.width - 2, height: SCREEN_HEIGHT/3)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func updateCellTitleLabel(lbl: UILabel, checkValue: Int){
        if checkValue == 4 {
            lbl.textColor = .black
            lbl.layer.borderColor = UIColor.white.cgColor
            lbl.layer.borderWidth = 2
            lbl.layer.masksToBounds = true
            lbl.backgroundColor = UNSELECTED_GRAY
        }else {
            lbl.textColor = .white
            lbl.layer.borderWidth = 0
            lbl.layer.masksToBounds = true
            lbl.backgroundColor = .clear
        }
    }
    
}
