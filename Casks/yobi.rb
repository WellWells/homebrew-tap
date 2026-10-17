cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.9.0"
  sha256 arm:   "db2d73729fab0bc1f1f29240d5199d35c702f9d79ebb82b7c905f810aebd4ef3",
         intel: "2b9044d938c8c0977a3384e609608209087ea85e47dd27808a3160ed33b8aebc"

  url "https://github.com/WellWells/yobi/releases/download/v#{version}/Yobi-#{version}-mac-#{arch}.dmg"
  name "Yobi"
  desc "AI automation for the desktop that needs no AI API key"
  homepage "https://github.com/WellWells/yobi"

  depends_on macos: :ventura

  app "Yobi.app"

  # Yobi is not notarized; without this Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Yobi.app"], must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Yobi",
    "~/Library/Logs/Yobi",
    "~/Library/Preferences/com.wellstsai.yobi.plist",
    "~/Library/Saved Application State/com.wellstsai.yobi.savedState",
  ]
end
