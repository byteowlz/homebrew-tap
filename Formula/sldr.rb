# typed: false
# frozen_string_literal: true

class Sldr < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/sldr"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "fba05e1155dd4c2298dcaa3e278d33811bd0c8c87af5219e2c075872a3fbb6a3"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "ad4dd2d98f6e4b1cb78a622c3b3e158974a0753b1b4c8952d33266bfbb1bd571"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d389ec9fabc818a2c4323f842b3cd11098af1cb833d515794e6ba77302ac66a0"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/sldr/releases/download/v0.2.1/sldr-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
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
