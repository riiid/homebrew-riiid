class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/riiid/pbkit"
  url "https://github.com/riiid/pbkit/archive/v0.0.14.tar.gz"
  sha256 "4d07f23607bc4ed9bd491a3f8fcf59dfef43e4f43021f4ff1f0cbb3bff5b00ba"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pb", "-A", "--unstable", libexec/"cli/pb/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
