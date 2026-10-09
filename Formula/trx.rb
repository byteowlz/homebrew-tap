# typed: false
# frozen_string_literal: true

class Trx < Formula
  desc "lean issue tracker"
  homepage "https://github.com/byteowlz/trx"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "8e3d9287d3bb07bc0f0766a45a25939dba9d8c42ae37f9e45039e6d64269d874"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5fd36cdd484a1b42d5e48ae31c3441a2935adf5a520a59c9aa9f329d65970549"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "99204bf85960a0e6e129145227b93fd3d7750b0f49242c9c609a184fde6ab34f"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/trx/releases/download/v0.8.0/trx-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a22baccbdaa578089bbdc1d27217853fe7ce957e92f041d7ffb9fe9c93736694"
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
    system "#{bin}/trx", "--version"
  end
end
