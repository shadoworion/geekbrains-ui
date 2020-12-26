//
//  PostCell.swift
//  hw1
//
//  Created by David Dakhovich on 26/12/2020.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    
    func setData(title: String, poster: UIImage?, likes: Int){
        titleLabel.text = title
        if poster == nil {
            posterImage.image = UIImage(systemName: "moon.stars")
        } else {
            posterImage.image = poster
        }
        likeCount.text = String(likes)

        likes > 0 ? buttonLikedState(state: true) : buttonLikedState(state: false)
    }
    
    @IBAction func likePost(_ sender: Any) {
        if likeCount.text != "0" {
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
        let index = newsData.firstIndex(where: {$0.title == titleLabel.text})
        likeState ? newsData[index!].likePost() : newsData[index!].dissLikePost()
        likeCount.text = String(newsData[index!].likes)
    }
    
}
