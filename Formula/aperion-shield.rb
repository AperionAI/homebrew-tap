class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.6.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.1/aperion-shield-shield-v1.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "65226d779eca576ab1897a28553955e600b302feb6dbbf32edec4642983f01bf"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.1/aperion-shield-shield-v1.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "64e09886fb13a3d5b52276703fe8d20070b84b44f98cca17b86639d21de0995c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.1/aperion-shield-shield-v1.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e140636b7e7ab17dc805d1d6529b13630e9b8149b6e68843f1c094b65099e86"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.1/aperion-shield-shield-v1.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fdf7ee19294e4d2ffd3b7cc65e49998f2d8f35120fe88cb6295b0c106990174d"
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
