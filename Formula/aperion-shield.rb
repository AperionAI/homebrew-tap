class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.26.0"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.0/aperion-shield-shield-v1.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "a74ff95668b9ad678019834495396b76007fccb539faa0965885b43884b03515"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.0/aperion-shield-shield-v1.26.0-x86_64-apple-darwin.tar.gz"
      sha256 "50bc5859771257f517ab0837b0bf4be30ae2fc77c30f32557174139aba742c1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.0/aperion-shield-shield-v1.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80ebaff248d4d9b660b70350543bc665b8f423bbb82dd3b0a560aacd423dfb14"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.26.0/aperion-shield-shield-v1.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "362abda08316e08dcee469ae17c929ceb9c26fc1ab7c3361b8aabe32eef7bfba"
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
