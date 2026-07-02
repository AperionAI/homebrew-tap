class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.0/aperion-shield-shield-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "d24de9392871daf4c1c12d2abdfcb75b961fc1bb9119fb072bb4373356fafc81"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.0/aperion-shield-shield-v1.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "76a08f3e406be42460e7fbce8c7b1e3e51a2a9818ce3414f057748995aa3241e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.0/aperion-shield-shield-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce399f4526290882a098392f5c5d67f8a739e224ce1fc33cf0cbd7e16ae701fa"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.0/aperion-shield-shield-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5eab778b935d4bf34079eba8ab1a2ef047de0c7846205c930c5bb1a521888c0"
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
