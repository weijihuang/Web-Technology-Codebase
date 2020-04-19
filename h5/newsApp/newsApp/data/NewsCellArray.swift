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
    
    init(tab: String, tableViewController: UITableViewController) {
        loadNews(tab: tab, tableViewController: tableViewController)
    }
    
    func getSize() -> Int {
        return newsArray.count
    }
    
    func get(index: Int) -> NewsCell {
        return newsArray[index]
    }
    
    private func loadNews(tab: String, tableViewController: UITableViewController) {
        SwiftSpinner.show("Loading Home Page..")
        let weatherParams = "https://weijihua-hw9-api.wl.r.appspot.com/\(tab)"
        let url = weatherParams.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        Alamofire.request(url!, method: .get).validate().responseJSON(completionHandler: {response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)["response"]
                for (_, subJson):(String, JSON) in json {
                    let news = NewsCell(imageUrl: subJson["image"].string ?? "", title: subJson["title"].string!, time: subJson["time"].string!, source: subJson["section"].string!, tagged: false, id: subJson["id"].string!)
                    self.newsArray.append(news)
                    self.size += 1
                }
//                print(json)
                tableViewController.tableView.reloadData()
                SwiftSpinner.hide()
            case .failure(let error):
                print(error)
            }
        })
    }
}
