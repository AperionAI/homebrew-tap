class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.23.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.0/aperion-shield-shield-v1.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "570c0b820f7d6e1a4eef9d5b0e8e41209136bf1243e357ed899692248680c77d"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.0/aperion-shield-shield-v1.23.0-x86_64-apple-darwin.tar.gz"
      sha256 "b63fe12c9e8c577241627f0fdfe47bee278ad7800f3d765604e1f8a421a431b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.0/aperion-shield-shield-v1.23.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5161871c8b407f278a73b1ba39ed91be34071c5e4dbde5458dbd083a9584338d"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.0/aperion-shield-shield-v1.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d06320a74166c9653e8d78a05b45523c0f50a6bdf79e4f935e9540d581a90eb"
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
