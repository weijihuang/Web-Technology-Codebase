//
//  File.swift
//  newsApp
//
//  Created by Stephen Huang on 4/19/20.
//  Copyright © 2020 Stephen Huang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class NewsCellArray {
    var newsArray: [NewsCell] = [NewsCell]()
    var size: Int = 0
    
    init(tab: String, tableViewController: UITableViewController, animated: Bool = true) {
        loadNews(tab: tab, tableViewController: tableViewController, animated: animated)
    }
    
    init() {
        let savedNewsID: [String]? = UserDefaults.standard.object(forKey: "id") as? [String]
        for newsID in savedNewsID ?? [] {
            if let savedNews = UserDefaults.standard.object(forKey: newsID) as? Data {
                let decoder = JSONDecoder()
                if let loadedNews = try? decoder.decode(NewsCell.self, from: savedNews) {
                    newsArray.append(loadedNews)
                }
            }
        }
        
        size = newsArray.count
    }
    
    func getSize() -> Int {
        return newsArray.count
    }
    
    func get(index: Int) -> NewsCell {
        return newsArray[index]
    }
    
    private func loadNews(tab: String, tableViewController: UITableViewController, animated: Bool) {
        if animated {
            if tab.lowercased() == "home"{
                SwiftSpinner.show("Loading Home Page..")
                print("LOADING NEWS FROM NEWS_ARRAY")
            } else if ["world", "business", "politics", "sport", "technology", "science"].contains(tab.lowercased())  {
                SwiftSpinner.show("Loading \(tab) Headlines..")
            } else {
                SwiftSpinner.show("Loading Search results..")
            }
        }
        var section = tab.lowercased()
        if section == "sports" {
            section = "sport"
        }
        var weatherParams = "https://weijihua-hw9-api.wl.r.appspot.com/section/\(section)"
        
        if !["world", "business", "politics", "sport", "technology", "science", "home"].contains(section) {
            weatherParams = "https://weijihua-hw9-api.wl.r.appspot.com/search/\(section)"
        }
        
        let url = weatherParams.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request(url!, method: .get).validate().responseJSON(completionHandler: {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)["response"]
                print("News loaded from \(url!)")
                for (_, subJson):(String, JSON) in json {
                    let news = NewsCell(imageUrl: subJson["image"].string ?? "", title: subJson["title"].string!, time: subJson["time"].string!, source: subJson["section"].string!, tagged: false, id: subJson["id"].string!, articleUrl: subJson["articleURL"].string!)
                    self.newsArray.append(news)
                    self.size += 1
                }
//                print(json)
                tableViewController.tableView.reloadData()
                if animated {
                    SwiftSpinner.hide()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
}
