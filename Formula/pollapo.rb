class Pollapo < Formula
  desc "Protobuf dependency management tool"
  homepage "https://github.com/riiid/pbkit/tree/main/cli/pollapo"
  url "https://github.com/riiid/pbkit/archive/v0.0.10.tar.gz"
  sha256 "84bc7f9f22f6818256b60c603815f64970dd74c98bb1c1a6637f1e345690fc4f"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "pollapo", "-A", "--unstable", libexec/"cli/pollapo/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
