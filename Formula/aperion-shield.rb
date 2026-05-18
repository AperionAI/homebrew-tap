class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.6.0/aperion-shield-shield-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "e25aa279a477df9dc3251ba300d48d45e7b91b403f1ffe3f0f4d199676d50be7"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.6.0/aperion-shield-shield-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "22ac1773e76f2ae756c00d413c043141c7b4d9199f26ea1f9ee132296bb3952c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.6.0/aperion-shield-shield-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3604f5e713bb45f7e808903cce818c8c2aee2b1a2a9df5caa85f2d75c31f3278"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.6.0/aperion-shield-shield-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b55235fca944fb08fffea4c3a1a9c050fa862f6e89631ab4cc505f072f121d9"
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
