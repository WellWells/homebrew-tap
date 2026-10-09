class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.0.0/agentswap_darwin_arm64.tar.gz"
      sha256 "0739109cea5c863d1ee2394878bd7b3aa1e795d37a3c2b3b1e92848da183e043"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.0.0/agentswap_darwin_amd64.tar.gz"
      sha256 "1b7ed6cc3d5963478890e48cc59a2ca53397b06f21dfacd49e2e141ad6cf6677"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.0.0/agentswap_linux_arm64.tar.gz"
      sha256 "bdc0e95facfc9dfe935ee2c271eb9cfddd181a417f74f5e33f31ecca1ef17b08"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.0.0/agentswap_linux_amd64.tar.gz"
      sha256 "65a71e4f1d729fcce16c39fd4bf209299dfc2ccf0d29c67ba875af2f14daab58"
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
