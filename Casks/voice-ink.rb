# https://docs.brew.sh/Cask-Cookbook
cask "voice-ink" do
    version "0.0.1"
    sha256 "a37d9f297270e998dc16ac7e7fd433f0bc910e7242f9e0c6d2ba0444d011d8f0",

    url "https://github.com/YiweiShen/voice-ink/releases/download/v#{version}/voice-ink.dmg"
    name "voice-ink"
    desc "Lite version of VoiceInk, opinionated."
    homepage "https://github.com/YiweiShen/voice-ink"

    livecheck do
        url "https://github.com/YiweiShen/voice-ink"
        strategy :github_latest
    end

    # auto_updates true
    depends_on macos: ">= :high_sierra"

    app "VoiceInk.app"

    zap trash: [
        "~/Library/Application Support/com.yiweishen.VoiceInk",
        "~/Library/Application Support/VoiceInk",
        "~/Library/Caches/com.yiweishen.VoiceInk",
        "~/Library/HTTPStorages/com.yiweishen.VoiceInk",
        "~/Library/Preferences/com.yiweishen.VoiceInk.plist",
        "~/Library/Saved Application State/com.yiweishen.VoiceInk.savedState",
    ]
end
