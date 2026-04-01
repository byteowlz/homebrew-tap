# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.12/hstry-v0.5.12-x86_64-apple-darwin.tar.gz"
      sha256 "0c6695ce7ea97130f2e95a05a5e9194d2259b78d0bf70f5264e5383e7043b578"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.12/hstry-v0.5.12-aarch64-apple-darwin.tar.gz"
      sha256 "7f1764d0f0c7679f381c368c203721b335254f38aab679c888ddc9a89c7cf792"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.12/hstry-v0.5.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ff90c691084d067bf735d7e72ea29e9a3305889c95ddb9abf0e9785c6f15218"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.12/hstry-v0.5.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c42ccc3952f18170421ae816c72e7a1983bab233b746c7355fe8d4fab9c7293c"
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
    system "#{bin}/hstry", "--version"
  end
end
