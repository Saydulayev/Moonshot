//
//  AnimatedImage.swift
//  Moonshot
//
//  Created by Akhmed on 19.09.23.
//

import SwiftUI
import SwiftyGif

struct AnimatedImage: UIViewRepresentable {
    let imageName: String

    func makeUIView(context: UIViewRepresentableContext<AnimatedImage>) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if let gif = try? UIImage(gifName: imageName) {
            imageView.setGifImage(gif)
        }
        return imageView
    }



    func updateUIView(_ uiView: UIImageView, context: UIViewRepresentableContext<AnimatedImage>) {
    }
}


//struct AnimatedImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimatedImage(imageName: "")
//    }
//}
