class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.24.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.1/aperion-shield-shield-v1.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c52b8e86ad388adcd188bd5c8bec6617650d4663aac4fac3140803a7dfc4e06"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.1/aperion-shield-shield-v1.24.1-x86_64-apple-darwin.tar.gz"
      sha256 "aaab0bcd2a774a20c79465f0cb86ffb4f49e52d0207188c4fc7812c0b6c2e054"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.1/aperion-shield-shield-v1.24.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d76d115bada3d3f0c69519112737532f01aa761dcbc818fcba23245caadf6bb4"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.24.1/aperion-shield-shield-v1.24.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e8f536c92f2bd63bfa90d32eaa766bb4c0a4ee9ad10f40bddb145351a77edfb0"
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
