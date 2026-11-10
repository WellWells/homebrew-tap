class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.1/agentswap_darwin_arm64.tar.gz"
      sha256 "8467a7302185ab048c7e6da47f88c428399758504d5ba365e6191f54c05e13c0"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.1/agentswap_darwin_amd64.tar.gz"
      sha256 "8c302de80261020a9af72758764b0d7a5834a574a9ed6766f0a61eff470a5280"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.1/agentswap_linux_arm64.tar.gz"
      sha256 "227ba4edc153ef182190523474db50183f3fb2faad3be3f8221f68c5d7a34bb3"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.1/agentswap_linux_amd64.tar.gz"
      sha256 "fa09cf09782982c99492dd70087f5f1a4ead63cc99d1d15982c5778b595225f4"
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
