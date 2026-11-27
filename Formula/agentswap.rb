class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.1/agentswap_darwin_arm64.tar.gz"
      sha256 "3032904bb06e791791c0cdda4f1dcd0a5ba369e3039f50fd578a57db626b4310"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.1/agentswap_darwin_amd64.tar.gz"
      sha256 "c6f7f0a22178d21f8b78ad5603106984e56347b6ae1cf7404e833d7c143df208"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.1/agentswap_linux_arm64.tar.gz"
      sha256 "9544a8db1962cfcd425e6dffe93f740910d579e0001425654f43bf3db64385cc"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.1/agentswap_linux_amd64.tar.gz"
      sha256 "1a632710b9f114344b144b5bf5510ed6786e564c245cd338c974321f12eda0d4"
    end
  end

  def install
    bin.install "agentswap"
    system bin/"agentswap", "link"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agentswap version")
  end
end
