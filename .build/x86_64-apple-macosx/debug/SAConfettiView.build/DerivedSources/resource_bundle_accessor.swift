import class Foundation.Bundle

extension Foundation.Bundle {
    static var module: Bundle = {
        let mainPath = Bundle.main.bundlePath + "/" + "SAConfettiView_SAConfettiView.bundle"
        let buildPath = "/Users/mohit/Desktop/SAConfettiView/.build/x86_64-apple-macosx/debug/SAConfettiView_SAConfettiView.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle != nil ? preferredBundle : Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}