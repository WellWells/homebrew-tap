class Agentswap < Formula
  desc "Switch between multiple accounts of AI coding agents"
  homepage "https://github.com/WellWells/agentswap"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.2/agentswap_darwin_arm64.tar.gz"
      sha256 "e51dd2665f87015656e6d28ca2605a701cb978f8f15659f921d429b49c6784a2"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.2/agentswap_darwin_amd64.tar.gz"
      sha256 "231bf1c4578d75a1ac454796b66d3912876df73427a49c99ae8d8fb2ead3c361"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.2/agentswap_linux_arm64.tar.gz"
      sha256 "c3937211f914cb904ba40d46f8ce638e1778a9833db8a8d5c386b60515036878"
    end

    on_intel do
      url "https://github.com/WellWells/agentswap/releases/download/v1.2.2/agentswap_linux_amd64.tar.gz"
      sha256 "39feab24c92eff4f468168d7fed42ec0fddd15200bc8ba01e3aba3b4639eb7e0"
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
