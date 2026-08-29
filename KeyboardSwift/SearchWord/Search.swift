//
//  Search.swift
//  KeyboardSwift
//
//  Created by Jamil on 29/8/26.
//

import UIKit

//most used 5k words for 190 languages
//https://github.com/frekwencja/most-common-words-multilingual


class Search: NSObject {
    
    var wordsArray:[String] = []
    static let Shared = Search()
    
    func start(){
        // Move heavy lifting off the main thread
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in //.userInitiated
            guard let self = self else { return }
            
            // Perform heavy file reading here
            let wordString = "bangla.txt".readBundleFile()
            let wordArray = wordString.toArray("\n")
            
            let sortedArray = wordArray.sorted {
                $0.localizedCaseInsensitiveCompare($1) == .orderedAscending
            }
            
            let arrayDic = Array(Set(sortedArray))
            let arrString = arrayDic.joined(separator: "\n")
            
            
            // Update UI back on the main thread
            DispatchQueue.main.async {
                //
                if self.wordsArray.count == 0 {
                    self.wordsArray = wordArray
                    print("wordArray::\n\n\n\(arrString)\n\nend")
                }
            }
        }
    }
    
    
    func searchWords(query: String, completion: @escaping ([String]) -> Void) {
        let words = wordsArray
        Task.detached(priority: .background) {
            let lowercaseQuery = query.lowercased()
            //var results = words.filter { $0.lowercased().contains(lowercaseQuery) }
            let results = words.filter { $0.hasPrefix(lowercaseQuery) }
            //prefixArray.reversed().first(where: searchString.hasPrefix)
            // Switch back to the main thread to update UI if needed
            await MainActor.run {
                if results.count >= 2 {
                    let tempResult = [results[0],results[1]]
                    completion(tempResult)
                }else{
                    completion(results)
                }
                
            }
        }
    }
}


/*
func loadWordsIntoTrie(trie: Trie) {
    guard let fileURL = Bundle.main.url(forResource: "words_en.txt", withExtension: nil) else {
        print("Error: File not found in bundle.")
        return
    }
    
    do {
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        content.enumerateSubstrings(in: content.startIndex..., options: .byWords) { (substring, _, _, _) in
            if let word = substring {
                trie.insert(word: word)
                print("\(word)")
            }
        }
    } catch {
        print("Error reading file: \(error)")
    }
}

*/

/*
 class TrieNode {
     var children: [Character: TrieNode] = [:]
     var isEndofWord: Bool = false
 }

 class Trie {
     let root = TrieNode()
     
     func insert(_ word: String) {
         var current = root
         for char in word.lowercased() {
             if current.children[char] == nil {
                 current.children[char] = TrieNode()
             }
             current = current.children[char]!
         }
         current.isEndofWord = true
     }
     
     func search(_ word: String) -> Bool {
         var current = root
         for char in word.lowercased() {
             guard let nextNode = current.children[char] else { return false }
             current = nextNode
         }
         return current.isEndofWord
     }
     
     func loadAndSearch(fileURL: URL, targetWord: String, completion: @escaping (Bool) -> Void) {
         DispatchQueue.global(qos: .userInitiated).async {
             let trie = Trie()
             
             // Read large file line by line or chunk by chunk
             do {
                 let content = try String(contentsOf: fileURL, encoding: .utf8)
                 content.enumerateLines { line, _ in
                     let words = line.split(separator: " ")
                     for w in words {
                         trie.insert(String(w))
                     }
                 }
             } catch {
                 print("Error reading file: \(error)")
             }
             
             let found = trie.search(targetWord)
             DispatchQueue.main.async {
                 print(targetWord)
                 completion(found)
             }
         }
     }
 }
 */


/*
class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord: Bool = false
}

class Trie {
    private let root = TrieNode()
    
    func insert(_ word: String) {
        var current = root
        for char in word.lowercased() {
            if current.children[char] == nil {
                current.children[char] = TrieNode()
            }
            current = current.children[char]!
        }
        current.isEndOfWord = true
    }
    
    func search(prefix: String, completion: @escaping ([String]) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            var current = self.root
            for char in prefix.lowercased() {
                guard let nextNode = current.children[char] else {
                    completion([])
                    return
                }
                current = nextNode
            }
            var results: [String] = []
            self.collectWords(from: current, prefix: prefix, results: &results)
            DispatchQueue.main.async {
                completion(results)
            }
        }
    }
    
    private func collectWords(from node: TrieNode, prefix: String, results: inout [String]) {
        if node.isEndOfWord {
            results.append(prefix)
        }
        for (char, childNode) in node.children {
            collectWords(from: childNode, prefix: prefix + String(char), results: &results)
        }
    }
}

*/
