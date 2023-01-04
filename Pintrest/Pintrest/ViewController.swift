//
//  ViewController.swift
//  Pintrest
//
//  Created by trioangle on 29/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    private func setUpCollectionView() {
         gridCollectionView.register(UICollectionViewCell.self,forCellWithReuseIdentifier: "cell")
         gridCollectionView.delegate = self
         gridCollectionView.dataSource = self
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 15
         layout.minimumInteritemSpacing = 5
         gridCollectionView.setCollectionViewLayout(layout, animated: true)
       }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .randomColor()
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 250)
    }
}

extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomValue(),
           green: .randomValue(),
           blue:  .randomValue(),
           alpha: 1.0
        )
    }
}
