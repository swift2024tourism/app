echo "ビルド開始"
which fvm
fvm flutter build web --web-renderer html
echo "デプロイ開始"
firebase deploy
