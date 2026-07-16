class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.4.0/aperion-shield-shield-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "074059915e935cd0d4ae4c347b812e4db0f906b00820abcea5c1b4451371f6a6"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.4.0/aperion-shield-shield-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "326bc5babbed4c9a73cca93818141a26579473f7ccdc68b357d7d7536fcc53b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.4.0/aperion-shield-shield-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "572246681b6e82cbd440af119ca2b9368f3ce8d78bb0cedde15300bf1a02fa36"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.4.0/aperion-shield-shield-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10970e7d72170e8040f740c66a5c898a8f2f20473dd3714d51c655cf42e4e633"
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
