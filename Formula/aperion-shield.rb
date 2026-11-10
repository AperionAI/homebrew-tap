class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.25.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.0/aperion-shield-shield-v1.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "407004d4d0173679d08ed6d8848d1abdfe8f4ae838fec253dc03b75419074cdb"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.0/aperion-shield-shield-v1.25.0-x86_64-apple-darwin.tar.gz"
      sha256 "c63772cee81c64d37acb490dfc236eb339710324bd294701d7d0694d0481bf2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.0/aperion-shield-shield-v1.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81fa64b74db3e1be3ae1672b0eb972b4aded12d0a75655f35fdc94cd13430034"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.0/aperion-shield-shield-v1.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d17bc8028980c63f4a3bc31a82fc3330e984841365019299ce211c0b090a88c"
    end
  end

  def install
    bin.install "aperion-shield"
    (etc/"aperion-shield").install "shield.example.yaml" if File.exist?("shield.example.yaml")
    doc.install "README.md" if File.exist?("README.md")
    doc.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    assert_match "Aperion Shield", shell_output("#{bin}/aperion-shield --help 2>&1")
    assert_match version.to_s, shell_output("#{bin}/aperion-shield --version 2>&1")
    pipe_output("#{bin}/aperion-shield --check", "", 0)
  end
end
