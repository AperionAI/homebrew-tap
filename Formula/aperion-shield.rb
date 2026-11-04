class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.23.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.1/aperion-shield-shield-v1.23.1-aarch64-apple-darwin.tar.gz"
      sha256 "e05ac12838157f732d6c51972666395b2759f8d3ae2006d03d02ec1b295dd40c"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.1/aperion-shield-shield-v1.23.1-x86_64-apple-darwin.tar.gz"
      sha256 "994cfa65ea127792ec1f8b36ca7932c4bf7c469c09326f376953082ac6536078"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.1/aperion-shield-shield-v1.23.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efa3f43fa380b53dc1d05668afa7a425b64602891d91480a9f1138f3e0fbf293"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.23.1/aperion-shield-shield-v1.23.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bb44196af5d8dc82166a5d3808eabff53371102ca9fe598a712efbab5b2d0bb6"
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
