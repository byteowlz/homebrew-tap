# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-x86_64-apple-darwin.tar.gz"
      sha256 "5e8dcec7933c93c404528a7767932e85b36bcdf16c0428e0311844103291ef1a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-aarch64-apple-darwin.tar.gz"
      sha256 "e1250c5a2dee9a88ebcc5a7db75971b93faf785e0ee8151785aceab826874f0e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98cf310b17ffbb72096a09e819651be263e94887ae1ab5c66bad4da200379dc6"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.2/hstry-v0.5.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f501782e22c93d756b89576957636a874b098a9d855cc9bd0ee8f6a646b414a"
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
