class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.24.2"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.2/aperion-shield-shield-v1.24.2-aarch64-apple-darwin.tar.gz"
      sha256 "c33d07c96a33561ebe3758df4563c768a40c215f1c27eea30f0f18e633382038"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.2/aperion-shield-shield-v1.24.2-x86_64-apple-darwin.tar.gz"
      sha256 "25e82809e585c3750523165955ad823c9d60677bb38559cd8e299c8e2d4e51ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.2/aperion-shield-shield-v1.24.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39c6b956f5b507860f1f2a806c8e51a46c5c3c1533c95e2d1b8de55d97f66fb6"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.2/aperion-shield-shield-v1.24.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a659519032caae246cd2735fa0ccd8e858f35429ec10316bfc72f704f12eefa5"
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
