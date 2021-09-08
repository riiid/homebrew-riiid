class Toolbelt < Formula
  desc "cli utilities for riiid engineering"
  homepage "https://github.com/riiid/toolbelt"
  url "https://github.com/riiid/toolbelt/archive/v0.0.3.tar.gz"
  sha256 "1b0d62f95bf5e91f069634fd683f08ccf4381f00b50e035cd68dc4becb1e65e7"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  bottle :unneeded
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "riiid-extract-keycloak-groups", "-A", "--unstable", libexec/"keycloak/extract-group-mapping-from-proto-services.ts"
    system "deno", "install", "--root", libexec, "-n", "gen-ssp", "-A", "--unstable", libexec/"gen-ssp/gen/index.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
