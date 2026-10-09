cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.8.0"
  sha256 arm:   "6dd8640b2a84876cb2ee5a83324a996890e0395c8b80500f9ad23f413733f979",
         intel: "a843eebcc55be79c2303a211e1830b80d0521e4ebbe0595575a677860fba1a3e"

  url "https://github.com/WellWells/yobi/releases/download/v#{version}/Yobi-#{version}-mac-#{arch}.dmg"
  name "Yobi"
  desc "AI automation for the desktop that needs no AI API key"
  homepage "https://github.com/WellWells/yobi"

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
