class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.27.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.0/aperion-shield-shield-v1.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "80cdbf44ccb9701a590460b45c35038e8e4bca0f9034d77c14055ba91931c0db"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.0/aperion-shield-shield-v1.27.0-x86_64-apple-darwin.tar.gz"
      sha256 "f5420629b4e4a99aa3fe0d0ad7e790a07e0d04fe10b12a6ff607391eaeb3637a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.0/aperion-shield-shield-v1.27.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf9b973ed41630e09e33dbe15b19cd4f1840fafc9a42b94a48dbf8c61ee5b34f"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.0/aperion-shield-shield-v1.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98e2fa1da3f5cfb78d8604a25b57c792453781e4caccd0f9380f5c96eb8cc064"
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
