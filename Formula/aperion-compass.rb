class AperionCompass < Formula
  desc "Local, offline AI governance self-assessment (EU AI Act & IMDA agentic)"
  homepage "https://github.com/AperionAI/compass"
  version "0.4.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.4.0/aperion-compass-compass-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "56b10301b1c5c41ca2852efbd02f6f841d73bbfd3ab76cac67e469a4ad471aeb"
    end
    on_intel do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.4.0/aperion-compass-compass-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4f8514d1dd43be511361a201e0fb8c0249f8f3b6d9d04602e0695cd8ac2079fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.4.0/aperion-compass-compass-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76cd989f8e7103ee26c8ec40a01a0994a8a339a7a56fbb07d09454a1012a52d6"
    end
    on_intel do
      url "https://github.com/AperionAI/compass/releases/download/compass-v0.4.0/aperion-compass-compass-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d97464871842e21a0131c26ff579461192cc5839907b3b6b530f9e23dc8a16c3"
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
