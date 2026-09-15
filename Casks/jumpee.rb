cask "jumpee" do
  version "1.7.0"
  sha256 "5b7eca4f0dc021198a39767aa6d4beb6405f13b08b6f54fd2b022154c1a8b2a9"

  url "https://github.com/BikS2013/Jumpee/releases/download/v#{version}/Jumpee-#{version}.zip"
  name "Jumpee"
  desc "macOS menu bar app for naming, jumping between desktops, pinning windows, and input source indicator"
  homepage "https://github.com/BikS2013/Jumpee"

  depends_on macos: :ventura

  app "Jumpee.app"

  postflight do
    system "osascript", "-e",
      'display notification "Jumpee installed. Grant Accessibility permissions in System Settings > Privacy & Security > Accessibility." with title "Jumpee"'
  end

  zap trash: [
    "~/.tool-agents/jumpee",
  ]

  caveats <<~EOS
    Jumpee requires Accessibility permissions to switch desktops:
      System Settings > Privacy & Security > Accessibility > enable Jumpee

    Mission Control keyboard shortcuts (Ctrl+1 through Ctrl+9) must be enabled:
      System Settings > Keyboard > Keyboard Shortcuts > Mission Control

    Pin Window on Top requires Screen Recording permission:
      System Settings > Privacy & Security > Screen Recording > enable Jumpee

    To start Jumpee at login:
      System Settings > General > Login Items > add Jumpee

    Global hotkeys (configurable from the Hotkeys section in the menu):
      Cmd+J       — toggle dropdown menu (open/close; pops at the cursor by default)
      Cmd+M       — move focused window to another desktop (requires moveWindow.enabled)
      Ctrl+Cmd+P  — pin/unpin focused window on top (requires pinWindow.enabled)
  EOS
end
