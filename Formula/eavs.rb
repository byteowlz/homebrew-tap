# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.6/eavs-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "5f629382ba3bd8e1cde0574a472bf6fe99a072828ffbc1f67f8581dde37320bc"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.6/eavs-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "0d0ae75d9db114777304680fc244f586d1d8bcb42a24f6b9421556a30b668ac2"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.6/eavs-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dff473506025b6ed5872b139763f4a0dc556a67e53bda22797bdad270d98dc90"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.6/eavs-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab377363ed8127c697c0b5bef425712aa881dff2d02e773c1c3e109413c2d375"
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
