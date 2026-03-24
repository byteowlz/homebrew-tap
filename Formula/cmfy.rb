# typed: false
# frozen_string_literal: true

class Cmfy < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/cmfy"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.4/cmfy-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "bfc8f5a19b829e099a3c9fc7bd87618cdcd7bd949ee12f912206dc087b8f1945"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.4/cmfy-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "bde77cc96723cf4ce0cd3362c0a8f71f2bb91a3d9a696e625c9c408e567391c9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.4/cmfy-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5ae0c079b59294319e78e7f03439d9eec1b9e1206e28cdc891f45f30219f3aa"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/cmfy/releases/download/v0.2.4/cmfy-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48d24ddd519dbedaf9b81b1d881e424bc2ce1cd1a60067344b6ef9a96f237c2c"
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
    system "#{bin}/cmfy", "--version"
  end
end
