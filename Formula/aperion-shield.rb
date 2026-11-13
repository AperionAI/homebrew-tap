class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.26.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.1/aperion-shield-shield-v1.26.1-aarch64-apple-darwin.tar.gz"
      sha256 "4966f5f64e9193a923bc269de0dcf9f1a55c538604444bbcbc17cb0f5f4150dc"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.1/aperion-shield-shield-v1.26.1-x86_64-apple-darwin.tar.gz"
      sha256 "f8031f35b86ca24712ec9b548016dab2f67071853733a8dfc4b37b9c697eb45c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.1/aperion-shield-shield-v1.26.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b80acfcd6eefd0e8a19f7bc3bbe69e16f4761ff46d8fd610aee1cdb72ba2a46"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.1/aperion-shield-shield-v1.26.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cf045689439ad766137da9d71753251481c8d1721c2cde641fcb909683a8eaf"
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
