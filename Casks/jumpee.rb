cask "jumpee" do
  version "1.9.4"
  sha256 "18ae883c2d78179306dd8e69eba3533930ce2946012bda955e242497ac3e0350"

  url "https://github.com/BikS2013/Jumpee/releases/download/v#{version}/Jumpee-#{version}.zip"
  name "Jumpee"
  desc "Menu bar app for naming, navigating, and managing desktops"
  homepage "https://github.com/BikS2013/Jumpee"

  depends_on macos: :ventura

  app "Jumpee.app"

  postflight_steps do
    run "/usr/bin/osascript",
        args: [
          "-e",
          'display notification "Grant Accessibility access in System Settings." with title "Jumpee installed"',
        ]
  end

  zap trash: "~/.tool-agents/jumpee"

  caveats <<~EOS
    Jumpee requires Accessibility permissions to switch desktops:
      System Settings > Privacy & Security > Accessibility > enable Jumpee

    Mission Control keyboard shortcuts must be enabled:
      System Settings > Keyboard > Keyboard Shortcuts > Mission Control
      Ctrl+1 through Ctrl+9 (desktop switching), Ctrl+Left/Right (Move Window)

    Pin Window on Top requires Screen Recording permission:
      System Settings > Privacy & Security > Screen Recording > enable Jumpee

    To start Jumpee at login:
      System Settings > General > Login Items > add Jumpee

    Global hotkeys (configurable in Settings > Shortcuts, opened with Cmd+,):
      Cmd+J       — toggle the workspace popover (open/close)
      Cmd+M       — move focused window to another desktop (requires moveWindow.enabled)
      Ctrl+Cmd+P  — pin/unpin focused window on top (requires pinWindow.enabled)
  EOS
end
