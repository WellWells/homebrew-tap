cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.12.0"
  sha256 arm:   "2e178e470037acd835316ffdf7ee5945e273b71d0f9e243e53799da3e4f83611",
         intel: "46164bafd89c1714a40e6897480a255bd4d9d1756eaf85c654d55393fb6bb65d"

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
