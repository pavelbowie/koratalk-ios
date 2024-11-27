//
//  KoraTalkChat
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import Foundation

public class Lorem {
    private static let wordList = [
        "alias", "consequatur", "aut", "perferendis", "sit", "voluptatem",
        "accusantium", "doloremque", "aperiam", "eaque", "ipsa", "quae", "ab",
        "illo", "inventore", "veritatis", "et", "quasi", "architecto",
        "beatae", "vitae", "dicta", "sunt", "explicabo", "aspernatur", "aut",
        "odit", "aut", "fugit", "sed", "quia", "consequuntur", "magni",
        "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt",
        "neque", "dolorem", "ipsum", "quia", "dolor", "sit", "amet",
        "consectetur", "adipisci", "velit", "sed", "quia", "non", "numquam",
        "eius", "modi", "tempora", "incidunt", "ut", "labore", "et", "dolore",
        "magnam", "aliquam", "quaerat", "voluptatem", "ut", "enim", "ad",
        "minima", "veniam", "quis", "nostrum", "exercitationem", "ullam",
        "corporis", "nemo", "enim", "ipsam", "voluptatem", "quia", "voluptas",
        "sit", "suscipit", "laboriosam", "nisi", "ut", "aliquid", "ex", "ea",
        "commodi", "consequatur", "quis", "autem", "vel", "eum", "iure",
        "reprehenderit", "qui", "in", "ea", "voluptate", "velit", "esse",
        "quam", "nihil", "molestiae", "et", "iusto", "odio", "dignissimos",
        "ducimus", "qui", "blanditiis", "praesentium", "laudantium", "totam",
        "rem", "voluptatum", "deleniti", "atque", "corrupti", "quos",
        "dolores", "et", "quas", "molestias", "excepturi", "sint",
        "occaecati", "cupiditate", "non", "provident", "sed", "ut",
        "perspiciatis", "unde", "omnis", "iste", "natus", "error",
        "similique", "sunt", "in", "culpa", "qui", "officia", "deserunt",
        "mollitia", "animi", "id", "est", "laborum", "et", "dolorum", "fuga",
        "et", "harum", "quidem", "rerum", "facilis", "est", "et", "expedita",
        "distinctio", "nam", "libero", "tempore", "cum", "soluta", "nobis",
        "est", "eligendi", "optio", "cumque", "nihil", "impedit", "quo",
        "porro", "quisquam", "est", "qui", "minus", "id", "quod", "maxime",
        "placeat", "facere", "possimus", "omnis", "voluptas", "assumenda",
        "est", "omnis", "dolor", "repellendus", "temporibus", "autem",
        "quibusdam", "et", "aut", "consequatur", "vel", "illum", "qui",
        "dolorem", "eum", "fugiat", "quo", "voluptas", "nulla", "pariatur",
        "at", "vero", "eos", "et", "accusamus", "officiis", "debitis", "aut",
        "rerum", "necessitatibus", "saepe", "eveniet", "ut", "et",
        "voluptates", "repudiandae", "sint", "et", "molestiae", "non",
        "recusandae", "itaque", "earum", "rerum", "hic", "tenetur", "a",
        "sapiente", "delectus", "ut", "aut", "reiciendis", "voluptatibus",
        "maiores", "doloribus", "asperiores", "repellat"
    ]

    private static var markdownSymbols = ["*", "_", "**", "**"]
    
    public class func word() -> String {
        return wordList.random()!
    }
    
    public class func words(nbWords: Int = 3) -> [String] {
        return wordList.random(nbWords)
    }
    
    public class func words(nbWords: Int = 3, useMarkdown: Bool = false) -> String {
        words(nbWords: nbWords)
            .map {
                guard useMarkdown, Int.random(min: 0, max: 10) == 0 else {
                    return $0
                }
                let symbol = markdownSymbols.random()!
                return symbol + $0 + symbol
            }
            .joined(separator: " ")
    }
    
    public class func sentence(nbWords: Int = 6, variable: Bool = true, useMarkdown: Bool = false) -> String {
        if nbWords <= 0 {
            return ""
        }
        
        let result: String = words(
            nbWords: variable ? nbWords.randomize(variation: 40) : nbWords,
            useMarkdown: useMarkdown
        )
        
        return result.firstCapitalized + "."
    }
    
    public class func sentences(nbSentences: Int = 3) -> [String] {
        return (0..<nbSentences).map { _ in sentence() }
    }
    
    public class func paragraph(nbSentences: Int = 3, variable: Bool = true) -> String {
        if nbSentences <= 0 {
            return ""
        }
        
        return sentences(nbSentences: variable ? nbSentences.randomize(variation: 40) : nbSentences).joined(separator: " ")
    }
    
    public class func paragraphs(nbParagraphs: Int = 3) -> [String] {
        return (0..<nbParagraphs).map { _ in paragraph() }
    }
    
    public class func paragraphs(nbParagraphs: Int = 3) -> String {
        return paragraphs(nbParagraphs: nbParagraphs).joined(separator: "\n\n")
    }
    
    public class func text(maxNbChars: Int = 200) -> String {
        var result: [String] = []
        
        if maxNbChars < 5 {
            return ""
        } else if maxNbChars < 25 {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let w = (size != 0 ? " " : "") + word()
                    result.append(w)
                    size += w.count
                }
                
                _ = result.popLast()
            }
        } else if maxNbChars < 100 {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let s = (size != 0 ? " " : "") + sentence()
                    result.append(s)
                    size += s.count
                }
                
                _ = result.popLast()
            }
        } else {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let p = (size != 0 ? "\n" : "") + paragraph()
                    result.append(p)
                    size += p.count
                }
                
                _ = result.popLast()
            }
        }
        
        return result.joined(separator: "")
    }
}

extension String {
    var firstCapitalized: String {
        var string = self
        string.replaceSubrange(string.startIndex...string.startIndex, with: String(string[string.startIndex]).capitalized)
        return string
    }
}

public extension Array {
    mutating func shuffle() {
        if count == 0 {
            return
        }

        for i in 0..<(count - 1) {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            if j != i {
                self.swapAt(i, j)
            }
        }
    }
    
    func shuffled() -> [Element] {
        var list = self
        list.shuffle()
        
        return list
    }
    
    func random() -> Element? {
        return (count > 0) ? self.shuffled()[0] : nil
    }
    
    func random(_ count: Int = 1) -> [Element] {
        let result = shuffled()
        
        return (count > result.count) ? result : Array(result[0..<count])
    }
}

extension Int {
    public static func random(min: Int = 0, max: Int = Int.max) -> Int {
        precondition(min <= max, "attempt to call random() with min > max")
        
        let diff   = UInt(bitPattern: max &- min)
        let result = UInt.random(min: 0, max: diff)
        
        return min + Int(bitPattern: result)
    }
    
    public func randomize(variation: Int) -> Int {
        let multiplier = Double(Int.random(min: 100 - variation, max: 100 + variation)) / 100
        let randomized = Double(self) * multiplier
        
        return Int(randomized) + 1
    }
}

private extension UInt {
    static func random(min: UInt, max: UInt) -> UInt {
        precondition(min <= max, "attempt to call random() with min > max")
        
        if min == UInt.min && max == UInt.max {
            var result: UInt = 0
            arc4random_buf(&result, MemoryLayout.size(ofValue: result))
            
            return result
        } else {
            let range         = max - min + 1
            let limit         = UInt.max - UInt.max % range
            var result: UInt = 0
            
            repeat {
                arc4random_buf(&result, MemoryLayout.size(ofValue: result))
            } while result >= limit
            
            result = result % range
            
            return min + result
        }
    }
}
