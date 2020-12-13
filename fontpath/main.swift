//
//  main.swift
//  fontpath
//
//  Created by Florian Pircher on 2020-12-07.
//

import Foundation

let defaultFontSize: Double = 16

func argument(at position: Int) -> String? {
    CommandLine.arguments.dropFirst(position).first
}

func urlForFont(named name: String, size: CGFloat) -> URL? {
    let descriptor = CTFontDescriptorCreateWithNameAndSize(name as CFString, size)
    guard let url = CTFontDescriptorCopyAttribute(descriptor, kCTFontURLAttribute) as? NSURL else {
        return nil
    }
    return url as URL
}

if let fontName = argument(at: 1) {
    let fontSize = CGFloat(argument(at: 2).flatMap { Double($0) } ?? defaultFontSize)
    
    if let url = urlForFont(named: fontName, size: fontSize) {
        print(url.path)
    }
}
else {
    while let line = readLine(strippingNewline: true) {
        let fontName: String
        let fontSize: Double
        
        if let splitIndex = line.firstIndex(of: "@") {
            fontName = String(line[..<splitIndex])
            fontSize = Double(line[line.index(after: splitIndex)...]) ?? defaultFontSize
        }
        else {
            fontName = line
            fontSize = defaultFontSize
        }
        
        if let url = urlForFont(named: fontName, size: CGFloat(fontSize)) {
            print(url.path)
        }
    }
}
