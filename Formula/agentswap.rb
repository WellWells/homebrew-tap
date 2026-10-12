class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.0/agentswap_darwin_arm64.tar.gz"
      sha256 "3f70cca0c74a708353f7dbd3c719180866bd887fe4d938065dfd4f8ebdd31610"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.0/agentswap_darwin_amd64.tar.gz"
      sha256 "cb2c877dd6ab2556db5407f80dcad15046963974a526ef12c5b3725bb645cbed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.0/agentswap_linux_arm64.tar.gz"
      sha256 "4e246b170562e96d998e5e5c1677e7dfedd674f0ee8bab9cc67228a773a96f8c"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.1.0/agentswap_linux_amd64.tar.gz"
      sha256 "2679cf0ec2d605e48b4f6f33a0262e18c1fe807e121b846ea87bad9f4d04a09b"
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
