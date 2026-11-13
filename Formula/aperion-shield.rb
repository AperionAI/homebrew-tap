class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.27.2"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.2/aperion-shield-shield-v1.27.2-aarch64-apple-darwin.tar.gz"
      sha256 "2ef0d0dea16dd704e41f24b5814aef378126fa2c38fec67073539dd0741e4912"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.2/aperion-shield-shield-v1.27.2-x86_64-apple-darwin.tar.gz"
      sha256 "f17798b35d3960d596e5871878583135e6b37ea6700945cb9968a6ba25416bfa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.2/aperion-shield-shield-v1.27.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fc53350c696522fe928761ce125e860f874198c613938dfd336444f74da84c0"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.27.2/aperion-shield-shield-v1.27.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c160199cf5657ba1c7bb02a1835297dd73f21a006c0cfaa637798ebd3be5444"
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
