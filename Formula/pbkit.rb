class Pbkit < Formula
  desc "Protobuf toolings"
  homepage "https://github.com/riiid/pbkit"
  url "https://github.com/riiid/pbkit/archive/v0.0.13.tar.gz"
  sha256 "9283db5397647e0bce1b3f31a0536cd873458042328548b7b825585524f0e32f"
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
