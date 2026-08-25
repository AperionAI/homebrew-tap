class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.5.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.5.0/aperion-shield-shield-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "00993a8413d0004a957e7de3e0e1e6d610c178b14cdeabe6e9adada218f46fdc"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.5.0/aperion-shield-shield-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ba3e6619e488619c143463b1d5d5d1c1f3bf08d8d25e46f86b0a190eb1f2f9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.5.0/aperion-shield-shield-v1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ea50b56e8880a0deb30ee0506bc14b9ba63b965381fa09486c33a8bfd837f8c"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.5.0/aperion-shield-shield-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79dfeb5a3e9d71e8ab5554faacf3eb14b6929bd6f78be549d0f2a9a7a3433565"
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
