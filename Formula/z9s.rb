class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD & ArgoCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.55.9.tar.gz"
  sha256 "6de215255e8d68821a29846e2aab796a7f638f52880a664ef58ddedec0f49b39"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/zerote/z9s/cmd.version=v#{version} " \
            "-X github.com/zerote/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/zerote/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
