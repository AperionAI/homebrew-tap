class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.1/aperion-shield-shield-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "f4f33412c1897b6f02ac4f3a80c5de3fec8fe5ad40b76085f59b551706062b63"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.1/aperion-shield-shield-v0.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "1bc21254a543e37e7861b61a79790a617437ffb74f783e5542583844db3e7625"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.1/aperion-shield-shield-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54f226f4ed96de069bb3f2f538347cf42323e98f964544409ea937c7635380b4"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.9.1/aperion-shield-shield-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46a56190f5b8f14a0c3c330933e2c7ee8e69777762d81b7f3db5c7f1b46458ca"
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
