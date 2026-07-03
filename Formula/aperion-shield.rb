class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.1/aperion-shield-shield-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "602f20f9a9226b216213d20e6c45453565573ce06ed7333af18eb87423165db2"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.1/aperion-shield-shield-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "eb17d2115de7d2e2a89400d6f085478a791e681f2b0f16c804699239aa4bf57c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.1/aperion-shield-shield-v1.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bfd12a6867c5b9f90445d8dcc154013221036864df4c484405601de1921ede5"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.2.1/aperion-shield-shield-v1.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fc544d109b1d8e5bcd36c9151f81b5e9500530397732c2f248882d5fb5c1e76"
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
