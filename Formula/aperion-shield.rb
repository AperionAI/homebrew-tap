class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.6.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.0/aperion-shield-shield-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "aa926b9a3b9644ff789752aef4e56b13bb1b0235f50efc045c0913ae3d604561"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.0/aperion-shield-shield-v1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "e23cf0341707df091b79eb767d80a0d1a77b4f67f4f8493924e6b32a2ed85a83"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.0/aperion-shield-shield-v1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb4101f0884a3cd6f74449f3b8212492f214b52dbf1547a839a9872565441597"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.0/aperion-shield-shield-v1.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5d159b96ef9b8f8ae886c0d7d350782ac1667dd1f098ea5fc6eabbe12f87cea"
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
