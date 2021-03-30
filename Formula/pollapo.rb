class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.3.tar.gz"
  sha256 "a42fe92d0c2b6df17b2c3d50b9f25116f999fb0a205427b838ab92d256c35985"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  depends_on "gh"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
