//
//  MyCollectionViewController.swift
//  CustomCollectionViewFlowLayout
//
//  Created by Michael Reining on 1/31/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

let reuseIdentifier = "MyCell"

class MyCollectionViewController: UICollectionViewController {
    var abcImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myLayout = MyFlowLayout()
        self.collectionView?.setCollectionViewLayout(myLayout, animated: true)
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "handlePinch:")
        collectionView?.addGestureRecognizer(pinchRecognizer)

        abcImages = ["a.jpg",
            "b.jpg",
            "c.jpg",
            "d.jpg",
            "e.jpg",
            "f.jpg",
            "g.jpg",
            "h.jpg",
            "i.jpg",
            "j.jpg",
            "k.jpg",
            "l.jpg",
            "m.jpg",
            "n.jpg",
            "o.jpg",
            "p.jpg",
            "q.jpg",
            "r.jpg",
            "s.jpg",
            "t.jpg",
            "u.jpg",
            "v.jpg",
            "w.jpg",
            "x.jpg",
            "y.jpg",
            "z.jpg",]
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return abcImages.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as MyCollectionViewCell
    
        // Configure the cell
        let image = UIImage(named: abcImages[indexPath.row])
        cell.imageView.image = image
        return cell
    }
    
    // MARK: UICollectionViewFlowLayoutDelegate
    // return images in their original size
    func collectionView(collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    let image = UIImage(named: abcImages[indexPath.row])
    let newImageSize = CGSizeMake(100, 100) // To create an item with a given size use CGSizeMake
    return newImageSize
    }
    
//    // MARK: UICollectionViewDelegate
//
//    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//            let myLayout = UICollectionViewFlowLayout()
//            myLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
//            collectionView.setCollectionViewLayout(myLayout, animated: true)
//        
//    }
    
    // MARK: Supplementary View Protocol Methods
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var header: MySupplementaryReusableView?
        
        if kind == UICollectionElementKindSectionHeader {
            header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "MyHeader", forIndexPath: indexPath) as? MySupplementaryReusableView
            
            header?.headerLabel.text = "ABC Alphabet"
        }
        return header!
    }
    
    // MARK: Pinch Recognizer
    
    func handlePinch(gesture: UIPinchGestureRecognizer) {
        let layout = collectionView?.collectionViewLayout as MyFlowLayout
        if gesture.state == UIGestureRecognizerState.Began {
            
            // Get initial pinch location
            let initialPinchPoint = gesture.locationInView(collectionView)
            
            // Convert pinch location into a specific cell
            let pinchedCellPath = collectionView?.indexPathForItemAtPoint(initialPinchPoint)
            
            // Store the indexPath to cell
            layout.currentCellPath = pinchedCellPath
            
        }
        
        else if gesture.state == UIGestureRecognizerState.Changed {
            // Store the new center location
            layout.currentCellCenter = gesture.locationInView(collectionView)
            
            // Store the scale value
            layout.setCurrentCellScale(gesture.scale)
        } else {
            collectionView?.performBatchUpdates({
                layout.currentCellPath = nil
                layout.currentCellScale = 1.0
            }, completion: nil)
        }
        
    }
    
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
