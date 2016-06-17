import XCTest
@testable import GIO

class GIOTests: XCTestCase {

    /// test lookup and creation of App Infos
    func testAppInfoAndFile() {
        let nonexistent = AppInfo.getDefaultFor(uriScheme: "nonexistent_uri_scheme")
        XCTAssertNil(nonexistent)
        do {
            let ls = "/bin/ls"
            guard let file = File.newFor(path: ls) else { XCTFail(ls) ; return }
            guard let base = file.basename else { XCTFail() ; return }
            guard let ai = try AppInfo.createFrom(commandline: ls, applicationName: base, flags: .needs_terminal) else {
                XCTFail("Cannot creat AppInfo") ; return
            }
            XCTAssertNotNil(ai.commandline)
            XCTAssertTrue(ai.supportsFiles())
            XCTAssertFalse(ai.supportsUris())
            XCTAssertFalse(ai.shouldShow())
            guard let ap = ai.dup() else { XCTFail() ; return }
            let dup = AppInfo(ap)
            XCTAssertEqual(ai.commandline, dup.commandline)
        } catch {
            XCTFail("Error creating AppInfo")
        }
    }

}
extension GIOTests {
    static var allTests : [(String, (GIOTests) -> () throws -> Void)] {
        return [
            ("testAppInfoAndFile", testAppInfoAndFile),
        ]
    }
}
