class Toolbelt < Formula
  desc "cli utilities for riiid engineering"
  homepage "https://github.com/riiid/toolbelt"
  url "https://github.com/riiid/toolbelt/archive/v0.0.10.tar.gz"
  sha256 "4bebaf69233d68c7acee5b781ef83a23d1d1c462c85781ca61f9e4e48463292b"
  license any_of: ["Apache-2.0", "MIT"]
  depends_on "deno"
  def install
    mkdir_p libexec
    system "mv ./* #{libexec}/"
    system "deno", "install", "--root", libexec, "-n", "riiid-extract-keycloak-groups", "-A", "--unstable", libexec/"keycloak/extract-group-mapping-from-proto-services.ts"
    system "deno", "install", "--root", libexec, "-n", "gen-ssp", "-A", "--unstable", libexec/"gen-ssp/gen/index.ts"
    system "deno", "install", "--root", libexec, "-n", "create-react-component", "-A", "--unstable", libexec/"www-snippet/create-react-component/entrypoint.ts"
    system "deno", "install", "--root", libexec, "-n", "organize-import-path", "-A", "--unstable", libexec/"www-snippet/organize-import-path/entrypoint.ts"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
