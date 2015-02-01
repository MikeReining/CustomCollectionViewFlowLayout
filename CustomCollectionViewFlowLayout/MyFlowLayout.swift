//
//  MyFlowLayout.swift
//  CustomCollectionViewFlowLayout
//
//  Created by Michael Reining on 1/31/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {
    var currentCellPath: NSIndexPath?
    var currentCellCenter: CGPoint?
    var currentCellScale: CGFloat?
    
    func setCurrentCellScale(scale: CGFloat) {
        currentCellScale = scale
        self.invalidateLayout()
    
    }
    
    func setCurrentCellCenter(origin: CGPoint) {
        currentCellCenter = origin
        self.invalidateLayout()
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) ->
        [AnyObject] {
            
            let allAttributesInRect =
            super.layoutAttributesForElementsInRect(rect)
            
            for cellAttributes in allAttributesInRect! {
                self.modifyLayoutAttributes(cellAttributes as
                    UICollectionViewLayoutAttributes)
            }
            return allAttributesInRect!
    }
    
    func modifyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        if layoutAttributes.indexPath == currentCellPath? {
            layoutAttributes.transform3D = CATransform3DMakeScale(currentCellScale!, currentCellScale!, 1.0)
            layoutAttributes.center = currentCellCenter!
            layoutAttributes.zIndex = 1
        }
    }
    
}
