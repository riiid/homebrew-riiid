class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/riiid/pbkit"
  url "https://github.com/riiid/pbkit/archive/v0.0.12.tar.gz"
  sha256 "0900e9601260bbff2f09c3e8107f867c6d09ea9c05fdc0905fd05c831e7ce2cc"
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
