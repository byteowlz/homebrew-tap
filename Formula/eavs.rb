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
      sha256 "f18cafce7ad058e5debaec59fd332dd912d469b295d9fc97eee2b52349e9a548"
    end
    if Hardware::CPU.arm?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-aarch64-apple-darwin.tar.gz"
      sha256 "f6a17c71132dca29b0a2cc6d6f1a166330154a0258bb9ea8bda4af45e579aab9"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbdf0b2131a763ccbece3609935b318cdd0daa03fada7711e4b477d15323f93d"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/byteowlz/eavs/releases/download/v0.5.10/eavs-v0.5.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36ac362f943f07123f29411a5acad4d88c3fafc0b8d3be4f29c78cc4d5668135"
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
