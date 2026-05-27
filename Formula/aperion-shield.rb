class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.8.0/aperion-shield-shield-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "9294e18df50224dfc4b4ad28662a3f5ce5c101c9ea2a42109d2d8dc19d8872a0"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.8.0/aperion-shield-shield-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "54f7d7d0e9ccfd0b2e22d12a262504a6a6d126f86eb6ce4c1154ab0b2c016210"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.8.0/aperion-shield-shield-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efb7bf65180b43e520ab3751a2731cab49b079ec9da1383a0eb8abd9691029b5"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.8.0/aperion-shield-shield-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfa9f88cba9bd485b1e2edb32b79111c51093b50b4eb99d4f60fe5e06a80ee83"
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
