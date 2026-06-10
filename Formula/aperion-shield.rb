class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.0/aperion-shield-shield-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "325478ef78e35374dc8845aea54bd59b955006efc319e753f35bd9e8e88228c2"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.0/aperion-shield-shield-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "1a2cc08a77e5e7182b3681c5aa313f355d4960665db6a705b5a3759a93306584"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.0/aperion-shield-shield-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a974d9aaa91c772f98fb5c9585e0998af81f095c0b82b47ba92a4df1264abd6"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.0/aperion-shield-shield-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3bd6fb0d2ea300bab36412ba1cdce80c74934c4d21582b20f5cb128649c64ebe"
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
