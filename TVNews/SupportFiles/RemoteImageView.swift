//
//  RemoteImageView.swift
//  TVNews
//
//  Created by VIJAY M on 01/03/23.
//

import Foundation
import UIKit

class RemoteImageView: UIImageView {
    var url: URL?
    
    func getCachesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func load(_ url: URL) {
        
        self.url = url
        
        // create a safe-to-safe version of this URL that will be our cache filename
        guard let savedFilename = url.absoluteString.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {return}
        
        let fullPath = getCachesDirectory().appending(component: savedFilename)
        
        if FileManager.default.fileExists(atPath: fullPath.absoluteString) {
            image = UIImage(contentsOfFile: fullPath.absoluteString)
            return
        }
        
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                let imageData = try Data(contentsOf: fullPath)
                try imageData.write(to: fullPath)
                DispatchQueue.main.async {
                    self.image = UIImage(data: imageData)
                }
            } catch {
                print("\(error.localizedDescription)")
            }
        }
    }
}
