cask "yobi" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "d43eb512d625e4d84067b6ea3a7646a6b51085315a019edb4b8a1592674032a7",
         intel: "c2bed4879fd833d879c43ef21f4b950031022980fd37c3eb43ff9ee481fb3486"

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
