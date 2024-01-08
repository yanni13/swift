//
//  WikiFace.swift
//  WIKIFACE
//
//  Created by 아우신얀 on 1/4/24.
//

import UIKit

struct WikiFace {
    let imageName: String
    let image: UIImage
}

extension WikiFace {
    static let list: [WikiFace] = [
        WikiFace(imageName: "dog", image: UIImage(named: "dog")!),
        WikiFace(imageName: "karina", image: UIImage(named: "karina")!),
        WikiFace(imageName: "Lany", image: UIImage(named: "Lany")!),
        WikiFace(imageName: "maru", image: UIImage(named: "maru")!),
        WikiFace(imageName: "oasis", image: UIImage(named: "oasis")!),
        WikiFace(imageName: "yerinbaek", image: UIImage(named: "yerinbaek")!)
    ]
}
