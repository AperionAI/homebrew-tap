class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.27.3"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.3/aperion-shield-shield-v1.27.3-aarch64-apple-darwin.tar.gz"
      sha256 "a92efff3b0a27448f24c8413c1a925ab77de2de935c2bb9c915ebdcbfc529b6a"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.3/aperion-shield-shield-v1.27.3-x86_64-apple-darwin.tar.gz"
      sha256 "adfa626369ceeb51f0f313ce5350fc7399270c5e99dd12ef57cf69f5b7aae3d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.3/aperion-shield-shield-v1.27.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da1cea66b80c939dd62a444a0d1a2785f71709716cd90feaefc9185b8d22b751"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.3/aperion-shield-shield-v1.27.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "470540a6bb986d275e6a3be1350d02180caa9a0c21d4cc818ee95362f6c0e951"
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
