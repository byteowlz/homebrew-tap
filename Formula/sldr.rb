# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.3.0/sldr-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "25c3355f177f2da866c41156390417817495caa8e4e6c948647fcb90570c7d54"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.3.0/sldr-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "f20df01b4d644fbfdccc4f5837cbd3deac6daac701c19bb77f4293d0fe985a65"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.3.0/sldr-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3779ce81ce1472bba52822484eb3018fd8bcd4de270b0ad08e21bc79884e7df"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.3.0/sldr-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2aae5ebf00dc83ef4177254480123b8db621bced258e56c109c4291c8673953"
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
    system "#{bin}/sldr", "--version"
  end
end
