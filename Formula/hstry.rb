# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.19/hstry-v0.5.19-x86_64-apple-darwin.tar.gz"
      sha256 "2fb4ccd0d9eb7ef524a05053aab179420fca80baeb61c54531f4eccbff8111b7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.19/hstry-v0.5.19-aarch64-apple-darwin.tar.gz"
      sha256 "bc49ea1af83506b54f640c78a98ec945e4675951f183cfaffc1f32e138276aec"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.19/hstry-v0.5.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f45856639e88d560052a1eec9f2c658335696bdead8a4537a3d07c93afbabd28"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.19/hstry-v0.5.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82fdf14ce1c3094f6a47285be95bacb981f901a5397dd97ef5328d4ac9c57260"
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
