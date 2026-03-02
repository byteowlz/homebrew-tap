# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-x86_64-apple-darwin.tar.gz"
      sha256 "9b9a5dac682f350c3a639729eed30b8ce64a20accd90272d29337e1f6a191521"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-aarch64-apple-darwin.tar.gz"
      sha256 "21bdad8f044e9c1d3dfe122b970a5d3475700bf20d9795ceec2ddcc341b64499"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bfb155ac2d0d63381b5a857cbe0fc4003c05220f4eec0508124f7273e1999ff2"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.5/hstry-v0.5.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fd63d98e4caf2558bf97b5a1d4d14390d2a427f9ea843fa3963ffe245bfbf046"
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
