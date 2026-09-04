class AperionCompass < Formula
  desc "Local, offline AI governance self-assessment (EU AI Act & IMDA agentic)"
  homepage "https://github.com/AperionAI/compass"
  version "0.5.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.5.0/aperion-compass-compass-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "49b871c3db0bf3acbac533384ba68fca2950f49abe3e12ecacf30cb114724bcd"
    end
    on_intel do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.5.0/aperion-compass-compass-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "836a42a9ff970f39b9708827a789aa31794a38a23919547425b41c90d97d02b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.5.0/aperion-compass-compass-v0.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73ffdeaf61a09c3475db825db2ee31b88a48ff91cc8fafaed66675502e12e838"
    end
    on_intel do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.5.0/aperion-compass-compass-v0.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56066ec6af16d26c729f75815db053a4e009b3de34ba346b3cc8c01d0188eaee"
    end
  end

  def install
    bin.install "compass"
    doc.install "README.md" if File.exist?("README.md")
    doc.install "LICENSE" if File.exist?("LICENSE")
  end

  test do
    assert_match "Aperion Compass", shell_output("#{bin}/compass --help 2>&1")
    assert_match version.to_s, shell_output("#{bin}/compass --version 2>&1")
    assert_match "eu-ai-act", shell_output("#{bin}/compass frameworks 2>&1")
  end
end
