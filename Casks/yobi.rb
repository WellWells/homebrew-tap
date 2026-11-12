cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.12.0"
  sha256 arm:   "00af25d604e56152c50f143eefe28e24bcc515fe5a040bc9f702a7d54e4c6ce8",
         intel: "756677ed2ee9cbeb13d60786f732e6dfb38bda6a50fcbdc97f5a76ffdfab2e4d"

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
