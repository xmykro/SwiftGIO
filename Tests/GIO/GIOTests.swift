import XCTest
@testable import GIO

class GIOTests: XCTestCase {

    /// test lookup and creation of App Infos
    func testAppInfoAndFile() {
        let nonexistent = AppInfo.get_default_for_uri_scheme(uri_scheme: "nonexistent_uri_scheme")
        XCTAssertNil(nonexistent)
        do {
            let ls = "/bin/ls"
            guard let file = File.new_for_path(path: ls) else { XCTFail(ls) ; return }
            guard let base = file.basename else { XCTFail() ; return }
            guard let ai = try AppInfo.create_from_commandline(commandline: ls, application_name: base, flags: .needs_terminal) else {
                XCTFail("Cannot creat AppInfo") ; return
            }
            XCTAssertNotNil(ai.commandline)
            XCTAssertTrue(ai.supports_files())
            XCTAssertFalse(ai.supports_uris())
            XCTAssertFalse(ai.should_show())
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
