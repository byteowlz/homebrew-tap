# typed: false
# frozen_string_literal: true

class Hstry < Formula
  desc "a unified history for all your agents"
  homepage "https://github.com/byteowlz/hstry"
  version "0.5.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.22/hstry-v0.5.22-x86_64-apple-darwin.tar.gz"
      sha256 "50f82a61cc51f55352a106be4e436d47450ebabec4dc98d4035c226052b53c68"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.22/hstry-v0.5.22-aarch64-apple-darwin.tar.gz"
      sha256 "8e6a811a978b1dc0ebe5f3c9d64d14956409022ad1416b313f14c3b46c80254a"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.22/hstry-v0.5.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0612d317e130d4f4484db84f6e1a5696d66af96f0eec253d032bc2e815bbdfe"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/hstry/releases/download/v0.5.22/hstry-v0.5.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c31f6e4d5f8b81778a85f11d648e1303cfdecbba0114069767a137f0124233d3"
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
