class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.1.0/aperion-shield-shield-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d3856d0005e92850b76aa5b2c2416f4b314a4efb3e6bfb6444c42641445573c3"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.1.0/aperion-shield-shield-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8c57ed3a6a5d00e854cfbd679460f5cc9103aabf4a44369553fd31119ad10a94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.1.0/aperion-shield-shield-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "399e8e7df6ccf12bc33bbadeacedbaab711b071383fc9d8d864fe3c70b3af3b3"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.1.0/aperion-shield-shield-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f7baf673a6db2d6580df28cfaca5615926c7a8ea909c444e7807acdfbbb5b76"
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
