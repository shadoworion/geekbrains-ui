//
//  CustomLikeButton.swift
//  hw4
//
//  Created by David Dakhovich on 19/12/2020.
//

import UIKit

class CustomLikeButton: UIViewController {

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCounter: UILabel!
    
    var likesCount: Int = 0
    var isLiked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        likeCounter.text = String(likesCount)
        isLiked ? buttonLikedState(state: true) : buttonLikedState(state: false)
    }
    
    @IBAction func onClickLike(_ sender: Any) {
        if isLiked {
            likeAction(likeState: false)
            buttonLikedState(state: false)
        } else {
            likeAction(likeState: true)
            buttonLikedState(state: true)
        }
    }
    
    func buttonLikedState(state: Bool){
        if state {
            likeButton.tintColor = .systemRed
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        } else {
            likeButton.tintColor = .systemBlue
            likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
    }
    
    func likeAction(likeState: Bool){
        isLiked = likeState
        likesCount = likeState ? likesCount + 1 : likesCount - 1
        likeCounter.text = String(likesCount)
    }
}
