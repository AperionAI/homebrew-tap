class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.22.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.22.0/aperion-shield-shield-v1.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "82ffde66dcdfd455524a9f60770633e1d02682df4d9510128d6541c9e89e90e8"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.22.0/aperion-shield-shield-v1.22.0-x86_64-apple-darwin.tar.gz"
      sha256 "2ce23f3a7477bca466cbc23e8d2ce2e530c64ecfe0b35506bf3f48f8d6a80f2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.22.0/aperion-shield-shield-v1.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c58e91eab4870093d653e8bfe0f4ee5c25da5ed64b599b41aac1c54cac15ceaa"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.22.0/aperion-shield-shield-v1.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8848819f1f05f46bc6c01b6aea9830e4956bb9f44e42017d62e5f022b956d4a9"
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
