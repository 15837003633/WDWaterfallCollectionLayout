
import UIKit

/*
 自定义layout三部曲：
 1.prepar 用于提前准备好数据
 2.collectionViewContentSize 返回可滚动的大小
 3.layoutAttributesForElements 返回cell的布局
 */
open class WDWaterfallCollectionLayout: UICollectionViewFlowLayout {
    
    var itemAttrs = [UICollectionViewLayoutAttributes]()
    
    public var col: Int = 3
    
    open override func prepare() {
        super.prepare()
        let width = collectionView!.bounds.width - sectionInset.left - sectionInset.right - minimumInteritemSpacing * (col - 1)

        let itemCount = collectionView!.numberOfItems(inSection: 0)
        for i in 0..<itemCount {
            let attrs = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            let x = 0
            let y = 0
            let height = 0
            attrs.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            itemAttrs.append(attrs)
        }
        
    }
    
    open override var collectionViewContentSize: CGSize {
        return .zero
    }
    
    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return itemAttrs
    }
}
