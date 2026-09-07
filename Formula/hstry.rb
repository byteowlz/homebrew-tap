# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.25/hstry-v0.5.25-x86_64-apple-darwin.tar.gz"
      sha256 "43ccb5fa7ff6676e9b90ea4f7c08892745ba1de2b05283345a8f1921fa7a954b"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.25/hstry-v0.5.25-aarch64-apple-darwin.tar.gz"
      sha256 "92effac22b33ec9e63119bc14d928061edf3ea01d830da3317b6ba4fa7cf27bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.25/hstry-v0.5.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6af2fea969c1ad8c091552a6623ed73b82d9ec4bf1c8f76326c77b82890a26d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.25/hstry-v0.5.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "332255fddfabf3c035348359698bd61c58d8598b34747d0d6ddc135f55c959a1"
    end
  end

  def install
    # byt-packaged tarballs stage executables under bin/; older flat
    # tarballs keep them at the archive root. Support both.
    if Dir.exist?("bin")
      bin.install Dir["bin/*"]
    else
      Dir.glob("*").each do |file|
        next if File.directory?(file)
        next unless File.executable?(file)
        bin.install file
      end
    end
  end

  test do
    system "#{bin}/hstry", "--version"
  end
end
