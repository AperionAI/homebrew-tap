class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.6.2"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.2/aperion-shield-shield-v1.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "eeeba9b29eeaa7917c96af8e02646c5e58060deb727fb551c5a735a8ce4a0437"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.2/aperion-shield-shield-v1.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "64d7b2214864057857ef18c744a8b60b667fb122d9f56a99aee3f2c9369465cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.2/aperion-shield-shield-v1.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8198794cd9ab425fd30a7f82c8c14bb3e579be037341f15ea5de692513e94213"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.6.2/aperion-shield-shield-v1.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0f876e43330a4c1d0d7355123c76950c33cf5151f07345be3f61fbb721ec29d"
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
