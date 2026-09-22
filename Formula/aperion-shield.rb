class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.7.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.1/aperion-shield-shield-v1.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "6eee1a8fb67ef5bc156bffb3f2ec02c5c516906758fabe66729c188db9679545"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.1/aperion-shield-shield-v1.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "6a33b9960e67d9884ebc00155cd8094476413dedc17823db2e82720c838abdd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.1/aperion-shield-shield-v1.7.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "532550f2e72c6c9368451890013546ffe4874513e251ed97c6705d8094b6a2ec"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.1/aperion-shield-shield-v1.7.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1917bba096822e73bc96338966e111b9bdea71e326d14dfbec1ec4521b03f7e5"
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
