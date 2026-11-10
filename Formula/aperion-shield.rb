class AperionShield < Formula
  desc "Local MCP guardrail for AI coding agents (Cursor, Claude Code, ...)"
  homepage "https://github.com/AperionAI/shield"
  version "1.25.1"
  license "Elastic-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.1/aperion-shield-shield-v1.25.1-aarch64-apple-darwin.tar.gz"
      sha256 "821357245cd9bed46cec135ded4a1f0ea48a5d33d08fb7ffc37497e38dbe2a40"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.1/aperion-shield-shield-v1.25.1-x86_64-apple-darwin.tar.gz"
      sha256 "ace121a2744a4a8b1bb1109ceed1dbb43f790e68b5ea625906cbc7cf2a50d83e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.1/aperion-shield-shield-v1.25.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a1a46d5cac1f59bc75575a990cdac06e0fffac3f6454b28fe8ffe92cbe61e5a"
    end
    on_intel do
      url "https://github.com/AperionAI/shield/releases/download/shield-v1.25.1/aperion-shield-shield-v1.25.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec2761c92e11cd2a52dc7e9fc0477072327d3cd13c081358b28d0689db436b9a"
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
