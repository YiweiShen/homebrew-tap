# https://docs.brew.sh/Cask-Cookbook
cask "pulse" do
    version "0.1.13"
    arch arm: "aarch64", intel: "x64"
    sha256 arm: "163622b677934bad946febe50bca990c43cf4aa47949fe56960700bfa0bc1ba3",
        intel: "bc8c918dc43f629d4d382008577fc2d6e07d9c40b444dcab045dc7bb8f382ee6"

    url "https://github.com/YiweiShen/pulse-app/releases/download/v#{version}/Pulse_#{arch}.app.tar.gz"
    name "pulse"
    desc "A minimalist macOS menubar app for email notifications."
    homepage "https://github.com/YiweiShen/pulse-app"

    livecheck do
        url :stable
        strategy :github_latest
    end

    auto_updates true
    depends_on macos: ">= :high_sierra"

    app "Pulse.app"

    postflight do
        system_command "/bin/chmod", args: ["+x", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/xattr", args: ["-cr", "/Applications/Pulse.app"], sudo: true
        system_command "/usr/bin/codesign", args: ["--force", "--deep", "--sign", "-", "/Applications/Pulse.app"], sudo: true
    end

    zap trash: [
        "~/Library/Application Support/com.yiweishen.pulse.app",
        "~/Library/Caches/com.yiweishen.pulse.app",
        "~/Library/Preferences/com.yiweishen.pulse.app.plist",
        "~/Library/WebKit/com.yiweishen.pulse.app",
    ]
end
