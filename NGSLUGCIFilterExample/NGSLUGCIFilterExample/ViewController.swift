//
//  ViewController.swift
//  NGSLUGCIFilterExample
//
//  Created by Noah Gilmore on 3/27/19.
//  Copyright © 2019 Noah Gilmore. All rights reserved.
//

import UIKit
import CoreImage

extension CIImage {
    func checkerboarded() -> CIImage {
        let checkerboardFilter = CIFilter(name: "CICheckerboardGenerator", parameters: [
            "inputWidth": 40,
            "inputColor0": CIColor.white,
            "inputColor1": CIColor(color: UIColor.lightGray),
            "inputCenter": CIVector(x: 0, y: 0),
            "inputSharpness": 1
            ])!
        let sourceOverCompositingFilter = CIFilter(name: "CISourceOverCompositing")!
        sourceOverCompositingFilter.setValue(checkerboardFilter.outputImage!, forKey: kCIInputBackgroundImageKey)
        sourceOverCompositingFilter.setValue(self, forKey: kCIInputImageKey)
        return sourceOverCompositingFilter.outputImage!
    }
}

class ViewController: UIViewController {
    private let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 237/256, green: 213/256, blue: 212/256, alpha: 1)
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.layer.borderWidth = 1

        let swiftImage = UIImage(named: "swift")!
        imageView.image = swiftImage
    }


}

