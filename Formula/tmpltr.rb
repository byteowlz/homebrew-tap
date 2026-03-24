# typed: false
# frozen_string_literal: true

class Tmpltr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/tmpltr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "f22da2534fa0a53aa38ccda634c38e5655056905d5cf76bdd9531d2844ffc39a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "cbb7d033dbc4101b62ec44642945e116e1c7723f1601f61b353a2b6f7b211a9e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "95d5b5a380a942774895715f4cae584677abfd5a1bd211e1301fd01c9f33dce4"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/tmpltr/releases/download/v0.3.0/tmpltr-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29fcb7b2e0df4b1de024e7d7fb12e02263f66ca85567cb51603099978a6f6e68"
    end
  end

  def install
    # Install all binaries found in the archive
    Dir.glob("*").each do |file|
      next if File.directory?(file)
      next unless File.executable?(file)
      bin.install file
    end
  end

  test do
    system "#{bin}/tmpltr", "--version"
  end
end
