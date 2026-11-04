class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.21.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.21.0/aperion-shield-shield-v1.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "b3e8b44ddaf45188220e35f3ac0b935ada46c828ff31f35392bd340e646284bc"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.21.0/aperion-shield-shield-v1.21.0-x86_64-apple-darwin.tar.gz"
      sha256 "74299532f0cc3fa4d0eb99f96d52e7cb8e4b7fcd4a2458657217293df2f55bdb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.21.0/aperion-shield-shield-v1.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bf6a293aa9267aaf3ed371cd52aa0e978dc7bcf0fff1a365853905a6cb6906c"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.21.0/aperion-shield-shield-v1.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1ee802f3ae67af178f089d0224ed00355a5609c39be68e76e978f58bd2a0c2d"
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
