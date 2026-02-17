# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.4/hstry-v0.4.4-x86_64-apple-darwin.tar.gz"
      sha256 "9027ea22a0b7880c34d1725ae11c232d6a194ff75fd06673c1fcb0025e9a7142"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.4/hstry-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "4630853755ae240d11911168aa2e9fdd0513944c0ea57d4d6d795ab4a70c065e"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.4/hstry-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c0502171f9124a52d6acaa03b2fc921b7f18ac5851569841d09a6ad82e0c3b0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.4.4/hstry-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1fbe24744f4f94a01599f9548af1df98db9792224390e809647ada0c903bbf87"
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
