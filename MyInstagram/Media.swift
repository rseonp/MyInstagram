//
//  Media.swift
//  Instagram2
//
//  Created by Victor Li Wang on 3/6/16.
//  Copyright © 2016 Victor Li Wang. All rights reserved.
//

import UIKit

class Media: NSObject {
    
    var dictionary: NSDictionary?
    var photoUrl: NSURL?
    var caption: String?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        
        let photoUrlString = dictionary["media"] as? String
        if let photoUrlString = photoUrlString {
            photoUrl = NSURL(string: photoUrlString)
        }
        caption = dictionary["caption"] as? String
    }

//    class func mediaWithArray(dictionaries: [NSDictionary]) -> [Media] {
//        var media = [Media]()
//        
//        for dictionary in dictionaries {
//            let oneMedia = Media(dictionary: dictionary)
//            
//            media.append(oneMedia)
//        }
//        
//        return media
//    }
}
