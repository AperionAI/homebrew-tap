class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.20.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.0/aperion-shield-shield-v1.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "d97ac86500bdee5a27b7a9f4180f6f91b25f3d61a64b66d3ec28339e4f706548"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.0/aperion-shield-shield-v1.20.0-x86_64-apple-darwin.tar.gz"
      sha256 "90146ff1daccd4394de7725334a600536e5cece0fe5c00b7d1711bfdb278c0b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.0/aperion-shield-shield-v1.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "681d1ab989a652ab0693bf56be5c8cfde36cfa8f6c4b2054e3d73ba905b80d8a"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.20.0/aperion-shield-shield-v1.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d8a4f377f962f1fd180e874a2d9a5f2f4331719f20755ffafbdf2b73e0a43e5"
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
