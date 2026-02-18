# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.8/eavs-v0.5.8-x86_64-apple-darwin.tar.gz"
      sha256 "24a0d6e13fdd166c9c24253b42a2468f0e4881229aa4f9320e2d27abb992f2cc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.8/eavs-v0.5.8-aarch64-apple-darwin.tar.gz"
      sha256 "2611f71e9e43eb9480f65eaa3bfc21e0fa7483275c4cf947e50b9520b02ae065"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.8/eavs-v0.5.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69d9a950a8039775c4ffef13a6e28ebf27aa9c0bea42bd73ea3938c429ae1311"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.8/eavs-v0.5.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56211b5c4f376b3e240acd405d0dc22ebb2700efeceed2e19eceae31d1e80737"
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
    system "#{bin}/eavs", "--version"
  end
end
