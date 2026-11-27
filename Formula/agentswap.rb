class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.0/agentswap_darwin_arm64.tar.gz"
      sha256 "d6cc693de74a50fda5d4ae5e44e281e775e0f2329ac79bad794e2513819f1d4e"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.0/agentswap_darwin_amd64.tar.gz"
      sha256 "6fb48a1ad9c8f7c40dd2d15bfeac3ba07258c3946ac3c2203f7cfa7c0b825c18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.0/agentswap_linux_arm64.tar.gz"
      sha256 "590158963122686af743059b5546fb0e077f72a36c863f0790aaf6d8936b2efe"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.0/agentswap_linux_amd64.tar.gz"
      sha256 "66ec783f737d9ddec964b6dd50bdf38d3b0891997e0910bad3621f8f0497f465"
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
