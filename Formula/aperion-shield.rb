class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.0.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.0.1/aperion-shield-shield-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "3f462bfb1ee25c3acd4f927fb0fa023a2be6696348392110b0d13d43e9ffef02"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.0.1/aperion-shield-shield-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "09cfca9c6f99a9063ed480b798b81f17ea999b0cb39307948e47cca87a8d7187"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.0.1/aperion-shield-shield-v1.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7da0428004f4d319cda67cca122d1a897927e8f97f9f9a525ec79671a124f121"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.0.1/aperion-shield-shield-v1.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b24f5411625051bb8456152492898bd563d29d2b06bbad71db1ccfb15307a23"
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
