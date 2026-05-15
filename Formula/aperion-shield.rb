class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.5.0/aperion-shield-shield-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "52398492f1f03bea2a95a70ab01c6a4422f8ada34915623118e380d69f36b414"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.5.0/aperion-shield-shield-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "428c2b009a8fd871b08bca3121c777cffef6af239fe356948d015591c5124462"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.5.0/aperion-shield-shield-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab4a99d1c9677c12d316a446f455aec9dc1e792f0f7ecad9ccb45d44f7d8ccbe"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.5.0/aperion-shield-shield-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "233c285b3e06df93d25707a7e99007334ceecff9f5a6762aedec177d6f99b86b"
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
