//
//  PostView.swift
//  NetworkingLayer
//
//  Created by pepe on 23/12/20.
//

import Foundation

protocol PostViewDelegate {
    
    func onGetPostsSuccess( posts: [Post] )
    func onGetPostsError( msg: String )
 
}
