class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.20.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.1/aperion-shield-shield-v1.20.1-aarch64-apple-darwin.tar.gz"
      sha256 "05db0e27b0413fa978953c0454d1514aa77c110e52cd2b0278aff43fe7a62448"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.1/aperion-shield-shield-v1.20.1-x86_64-apple-darwin.tar.gz"
      sha256 "8802203adcdb8538608431678e3da9c02bd5a64634732edbf3a9722cd7dd94ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.1/aperion-shield-shield-v1.20.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33097712920a4bfe19460aa52bce534fbebb69f6da77b1371de9ab6095d33339"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.1/aperion-shield-shield-v1.20.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de5100496dd3dc8c9589ad52b170972dab616485dbe99638e0a4d3234bc1fc51"
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
