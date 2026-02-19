# typed: false
# frozen_string_literal: true

class Eavs < Formula
  desc "A Byteowlz tool"
  homepage "https://github.com/byteowlz/eavs"
  version "0.5.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-x86_64-apple-darwin.tar.gz"
      sha256 "517349b42b594fe63573bdab9411192c1bbec2c32039de473a3480c1d072aa8a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "90bbdef0b9cbf2ee415def85f35f891cf1b5e7478543041382ddbd4cf118f816"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "496e86c17adc911d34eabc08f43ea6c6cb5a577de43a212f33a31d6f92b366d7"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad5c6cd96670cc562dc7d1fab3a07f2ccd3de71b7e10af0c09570e5b20ee3201"
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
