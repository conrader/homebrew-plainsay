cask "plainsay" do
  version "0.2.27"
  sha256 "af8b24fa450259a90fd7ae3a2d0100ac7b91ee5c19c1461e2a4a860ef66e6574"

  url "https://github.com/conrader/plainsay/releases/download/v#{version}/Plainsay-#{version}.dmg",
      verified: "github.com/conrader/plainsay/"
  name "Plainsay"
  desc "Free, open-source, on-device dictation"
  homepage "https://plainsay.app/"

  livecheck do
    url "https://api.plainsay.app/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Plainsay.app"

  zap trash: [
    "~/Library/Application Support/Plainsay",
    "~/Library/Caches/com.plainsay.dictation",
    "~/Library/Preferences/com.plainsay.dictation.plist",
    "~/Library/Saved Application State/com.plainsay.dictation.savedState",
  ]
end
