class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/riiid/pbkit"
  url "https://github.com/riiid/pbkit/archive/v0.0.11.tar.gz"
  sha256 "b1412cfb77aaf06a2e34f90ab988279d850a2943c487447990be68291eeb298c"
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
