cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "895e55b3b3e1f210d596b155ba1bf809e9b079bbe2cd5ccfd75a27c4ee49e8e2",
         intel: "635e85ad3a31c5a24ef17fbec858c0374186af656dbeaceed479d9b3936f95cd"

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
