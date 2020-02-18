//
//  Crawl.swift
//  MAWDSwift
//
//  Created by 佐藤美佳 on 2020/02/13.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import Foundation

let fm = FileManager.default
var countDirs = 0
var countFiles = 0

func crawl(path: String) {
    countDirs = 0
    countFiles = 0
    crawlHelper(pathStr: path, indent: "")
    print("\(countDirs) directories, \(countFiles) files")
}


func crawlHelper(pathStr: String, indent: String) {
    let TREE_BRANCH = "├─"
    let TREE_BRANCH_LAST = "└─"
    let TREE_LINE = "│ "
    
    if(!isPathExist(pathStr)) {
        print("Invalid path")
    }

    let fileURLs = getContents(pathStr)

    for i in 0..<fileURLs.count {
        // check the list of files and directories
        let url = fileURLs[i].path
        if isDirectory(url) {
            // folder
            //  print the folder name
            //  get into the folder (recursion)
            if let dir = getFileName(url) {
                countDirs += 1
                if i == fileURLs.count - 1 {
                    print(indent + TREE_BRANCH_LAST + dir)
                    crawlHelper(pathStr: url, indent: "\(indent)      ")
                } else {
                    print(indent + TREE_BRANCH + dir)
                    crawlHelper(pathStr: url, indent: "\(indent)\(TREE_LINE)    ")
                }
            }
        } else if let file = getFileName(url) {
            // print the file name
            countFiles += 1
            if i == fileURLs.count - 1 {
                print(indent + TREE_BRANCH_LAST + file)
            } else {
                print(indent + TREE_BRANCH + file)
            }
        }
    }
    
}


func getContents(_ pathStr: String) -> [URL] {

    guard let u = URL(string: pathStr) else {
        return [URL]()
    }

    do {
        let fileUrls = try fm.contentsOfDirectory(at: u, includingPropertiesForKeys: [])
        return fileUrls
    } catch  {
        print(error.localizedDescription)
    }
    return []

}

/*
    check if the path exists or not
*/
func isPathExist(_ pathStr:String) -> Bool {
    if let u = URL(string: pathStr) {
        return fm.fileExists(atPath: u.path)
    } else {
        return false
    }
}

/*
    check if the path is a file or a directory
*/
func isDirectory(_ pathStr: String) -> Bool {
    if let u = URL(string: pathStr) {
        var isDir : ObjCBool = false
        
        if fm.fileExists(atPath: u.path, isDirectory: &isDir) {
            return isDir.boolValue
        }

    }
    
    return false
}

/*
    get the name of a file
*/
func getFileName(_ pathStr: String) -> String? {
    if let u = URL(string: pathStr) {
        return u.lastPathComponent
    }
    return nil
}


