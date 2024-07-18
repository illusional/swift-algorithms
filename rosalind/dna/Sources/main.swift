// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
import ArgumentParser

@main 
struct Dna: ParsableCommand {

    @Argument(help: "Input file")
    public var inputFile: String

    public func run() throws {
        // open file
        let file = FileHandle(forReadingAtPath: self.inputFile)
        let data = file?.readDataToEndOfFile()
        guard let dna =  String(data: data!, encoding: .utf8) else {
            print("Error reading file")
            return
        }

        let a = dna.filter { $0 == "A" }.count
        let c = dna.filter { $0 == "C" }.count
        let g = dna.filter { $0 == "G" }.count
        let t = dna.filter { $0 == "T" }.count
        print("\(a) \(c) \(g) \(t)")
    }
}
