class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.7.0/aperion-shield-shield-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "6e983dfaab354cb2cbb8d8b54d97ee8625300ded36a019611cdaced39ad0f038"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.7.0/aperion-shield-shield-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "111c7bbf04ede82b712c4269d0ff80a9ce2935cc82b66dc72454cf37a02f41dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.7.0/aperion-shield-shield-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bfe08d6842ae402883d4a2e8a7ae529a6d1f44057627b429ba8b665ddffebcc5"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v0.7.0/aperion-shield-shield-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d961fb95085ca47dccd0e65a9e919008ed4303bddba62d89170e5718b746b1d"
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
