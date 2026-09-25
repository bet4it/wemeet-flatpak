#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${1:-repo}"
REPO_OWNER="${GITHUB_REPOSITORY_OWNER:-bet4it}"
REPO_NAME="${GITHUB_REPOSITORY_NAME:-wemeet-flatpak}"
REPO_FULL="${GITHUB_REPOSITORY:-$REPO_OWNER/$REPO_NAME}"
REPO_URL="https://${REPO_OWNER}.github.io/${REPO_NAME}/"

mkdir -p "$REPO_DIR"

cat <<EOF > "${REPO_DIR}/wemeet.flatpakrepo"
[Flatpak Repo]
Title=Wemeet Flatpak Repo
Url=${REPO_URL}
Homepage=https://github.com/${REPO_FULL}
Comment=Tencent Meeting Flatpak Repository
Description=Flatpak repository for Tencent Meeting (wemeet)
gpg-verify=false
EOF

cat <<EOF > "${REPO_DIR}/com.tencent.wemeet.flatpakref"
[Flatpak Ref]
Name=com.tencent.wemeet
Branch=stable
Title=Tencent Meeting
Url=${REPO_URL}
IsRuntime=false
gpg-verify=false
EOF

cat <<EOF > "${REPO_DIR}/index.html"
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Wemeet Flatpak Repository</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
      max-width: 800px;
      margin: 40px auto;
      padding: 0 20px;
      line-height: 1.6;
      color: #24292f;
    }
    pre {
      background: #f6f8fa;
      padding: 16px;
      border-radius: 6px;
      overflow-x: auto;
      border: 1px solid #d0d7de;
    }
    code {
      font-family: ui-monospace, SFMono-Regular, SF Mono, Menlo, monospace;
      font-size: 0.9em;
    }
    a {
      color: #0969da;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
    }
    .btn {
      display: inline-block;
      padding: 8px 16px;
      background-color: #1f883d;
      color: white;
      border-radius: 6px;
      font-weight: 600;
      margin: 10px 0;
    }
    .btn:hover {
      background-color: #1a7f37;
      text-decoration: none;
    }
  </style>
</head>
<body>
  <h1>Tencent Meeting (Wemeet) Flatpak Repository</h1>
  <p>Flatpak repository for Tencent Meeting, featuring Wayland screen sharing hook and drop shadow crash fix.</p>

  <h2>Installation</h2>
  <p>Add the repository to Flatpak:</p>
  <pre><code>flatpak remote-add --user --if-not-exists wemeet ${REPO_URL}wemeet.flatpakrepo
flatpak install --user wemeet com.tencent.wemeet</code></pre>

  <p>Or install directly using the Flatpak ref:</p>
  <pre><code>flatpak install --user ${REPO_URL}com.tencent.wemeet.flatpakref</code></pre>

  <p><a class="btn" href="com.tencent.wemeet.flatpakref">Download .flatpakref</a></p>
</body>
</html>
EOF
