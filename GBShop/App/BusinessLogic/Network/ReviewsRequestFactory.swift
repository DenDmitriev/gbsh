//
//  ReviewsRequestFactory.swift
//  GBShop
//
//  Created by Denis Dmitriev on 09.03.2022.
//

import Foundation
import Alamofire

protocol ReviewsRequestFactory {
    
    func getReviews(productId: Int, completionHandler: @escaping (AFDataResponse<ReviewsResult>) -> Void)
    func addReview(productId: Int, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
    func deleteReview(reviewId: Int, completionHandler: @escaping (AFDataResponse<DeleteReviewResult>) -> Void)
}
