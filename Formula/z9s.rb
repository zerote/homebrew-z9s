class Z9s < Formula
  desc "Unified Kubernetes CLI with FluxCD support and metrics dashboard"
  homepage "https://github.com/zerote/z9s"
  url "https://github.com/zerote/z9s/archive/refs/tags/v0.54.3.tar.gz"
  sha256 "04bd6f4147fd141360e23e13d34db8643eb8f3d482c6f31ec5001b5a8bb9a29c"
  license "Apache-2.0"
  
  depends_on "go" => :build
  depends_on "kubectl"

  def install
    system "go", "build", 
            "-ldflags", 
            "-X github.com/yourusername/z9s/cmd.version=#{version} " \
            "-X github.com/yourusername/z9s/cmd.commit=#{ENV.fetch('GIT_COMMIT', 'unknown')} " \
            "-X github.com/yourusername/z9s/cmd.date=#{Time.now.iso8601}",
            "-o", bin/"z9s"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/z9s version")
  end
end
