class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.7.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.0/aperion-shield-shield-v1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "40f1b010494722719cd76761bb70881a28774b2d8fa4a98a38a44ba013791442"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.0/aperion-shield-shield-v1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf2b57446bf92cfe2c4398ffa5b48298d009c97b6fcfe6054756ad242481b96a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.0/aperion-shield-shield-v1.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e715fb832a8547e6f9d6ffd0265cd623d7e5d8d253d496eddfcc1e751a37857e"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.7.0/aperion-shield-shield-v1.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62867d2c197d1e7713aa9b1fa9f3dbabc83c61ca5edf2ca0cf8bc4a0360a6c2d"
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
