
import Foundation
import AsyncDisplayKit

let screenMargin:CGFloat = 10

// 顶部标题的高度
let kTitlesViewH: CGFloat = 35

func setImageNode(frame:CGRect) -> ASImageNode{
    let imageNode = ASImageNode()
    
    imageNode.frame = frame
    return imageNode
}

func DTColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func DTGlobalColor() -> UIColor {
    return DTColor(240, g: 240, b: 240, a: 1)
}

func DTGlobalRedColor() -> UIColor {
    return DTColor(245, g: 80, b: 83, a: 1.0)
}
