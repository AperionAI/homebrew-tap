class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.27.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.1/aperion-shield-shield-v1.27.1-aarch64-apple-darwin.tar.gz"
      sha256 "3f88e3afff0ba1daf74679fc8e48e65d7b83ab4f273f6ffbb40085346f1667fb"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.1/aperion-shield-shield-v1.27.1-x86_64-apple-darwin.tar.gz"
      sha256 "35957e37486ceee16b516c6023cbfa3360d58a5ac625df27bdb0d840f72ccf83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.1/aperion-shield-shield-v1.27.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa97a35e9f3dd6b87cd8f2cdc1b2a9a86367d63e3931f57ad756b3fa5420be7f"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.1/aperion-shield-shield-v1.27.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6234f2f180108a12e48b986821bcf67c4594fc81eee4e6f18def2dc42680eee5"
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
