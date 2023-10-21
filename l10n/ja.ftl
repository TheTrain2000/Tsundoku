## General

page-title = 積ん読 ANIME
category-general = 一般
page-shows = ショー
page-nyaa = ニャー検索
category-settings = システム設定
page-webhooks = ウェブフック
page-config = コンフィグ
page-logs = ログ
logout-button = ログアウト
entry-status-downloading = ダウンロード中
entry-status-downloaded = ダウンロード完了
entry-status-renamed = リネーム完了
entry-status-moved = 移動完了
entry-status-completed = 完成
entry-status-buffered = バッファー
entry-status-failed = 処理失敗
watch-button-title = ウォッチ
unwatch-button-title = ウォッチ解除
process-button-title = 後処理を有効にする
unprocess-button-title = 後処理を有効にする
delete-confirm-text = <b>{$name}</b> を削除してよろしいですか？
delete-cancel = やめておく
-action-edit = 編集
-action-delete = 削除

## Errors

no-rss-parsers = RSSソースがインストールされていません。
no-shows-found = ショーが見つかりませんでした。ソースにエラーがありますか？
dl-client-connection-error = ダウンロードクライアントへの接続中にエラーが発生しました。

## Index Page

shows-page-title = { page-shows }
shows-page-subtitle = RSS で追跡されたショー
status-current = 放映
status-finished = 終了
status-tba = TBA
status-unreleased = 未公開
status-upcoming = 近日中
show-edit-link = { -action-edit }
show-delete-link = { -action-delete }
show-add-success = 追加が完了しました。
show-update-success = 正常に更新されました
show-delete-success = 除去が完了しました。
empty-show-container = ここには何も表示されません!
empty-show-container-help = まず、以下のショーを追加します。
click-for-more-shows =
    クリックして {{ $not_shown }} 件以上の { $not_shown ->
        [one] アイテム
       *[other] アイテム
    }...
back-to-top-link = トップに戻る
add-show-button = ショーを追加
add-modal-header = ショーを追加
add-form-discover-select-title = 表示タイトルを選択してください...
add-form-discover-select-release-group = グループを選択してください。
add-form-discover-select-resolution = 解像度を選択してください。
add-form-discover-mode-result-amount =
    追加すると、 { $releaseCount } は既に { $releaseCount ->
       *[other] リリース
    } の処理を開始します。
add-form-discover-mode-seen-episodes = 見られるエピソード
add-form-mode-manual = 手動モード
add-form-mode-discover = ディスカバーモード
add-form-name-tt = RSSフィードに表示されるタイトルの名前です。
add-form-name-field = 名前
add-form-name-placeholder = Attack on Titan
add-form-desired-format-tt = ファイルの名前が変更された後の名前です。
add-form-desired-format-field = 希望する形式
add-form-season-tt = 名前の変更時にシリーズの季節に使用する値。
add-form-season-field = シーズン
add-form-episode-offset-tt = RSSフィードに表示されるエピソード番号を変更する正または負の値。
add-form-episode-offset-field = エピソードオフセット
add-form-add-button = ショーを追加
add-form-cancel-button = キャンセル
delete-modal-header = ショーを削除
edit-modal-header = ショーを編集
edit-clear-cache = キャッシュをクリア
edit-fix-match = 一致を修正
edit-kitsu-id = Kitsu.io Show ID
edit-tab-info = 情報
edit-tab-entries = 項目
edit-tab-webhooks = ウェブフック
edit-entries-th-episode = エピソード
edit-entries-th-last-update = 更新
edit-entries-is-empty = エントリーはありません
edit-entries-last-update = {$time} 前
edit-entries-form-episode = エピソード
edit-entries-form-magnet = Magnet URL
edit-entries-form-exists = このエピソードはすでに追跡されています。
edit-entries-form-add-button = エントリーを追加
edit-webhooks-th-webhook = ウェブフック
edit-webhooks-th-failed = 処理失敗
edit-webhooks-th-downloading = ダウンロード中
edit-webhooks-th-downloaded = ダウンロード完了
edit-webhooks-th-renamed = リネーム完了
edit-webhooks-th-moved = 移動完了
edit-webhooks-th-completed = 完成
edit-webhooks-is-empty = WebhookページにWebhookを追加します。
edit-form-name-tt = RSSフィードに表示されるタイトルの名前です。
edit-form-name-field = 名前
edit-form-name-placeholder = タイトルを表示
edit-form-resolution-tt = このショーのためにダウンロードする解像度。
edit-form-resolution-field = お好みの解像度
edit-form-release-group-tt = リリースからリリースを探すためのリリースグループ。
edit-form-release-group-field = 優先リリースグループ
edit-form-advanced = 詳細設定
edit-form-desired-format-tt = 完了したファイルの名前を変更するために使用されるグローバル形式を上書きします。
edit-form-desired-format-field = ファイル形式の上書き
edit-form-desired-folder-tt = 完了したファイルを配置するには、グローバルフォルダを上書きします。
edit-form-desired-folder-field = フォルダ配置の上書き
edit-form-season-tt = 名前の変更時にシリーズの季節に使用する値。
edit-form-season-field = シーズン
edit-form-episode-offset-tt = RSSフィードに表示されるエピソード番号を変更する正または負の値。
edit-form-episode-offset-field = エピソードオフセット
edit-form-cancel-button = キャンセル
list-view-actions-header = 操作
list-view-entry-update-header = 最後の更新
sort-by-header = 並べ替え
sort-dir-asc = 昇順
sort-dir-desc = 降順
sort-key-title = タイトル
sort-key-update = 最後の更新
sort-key-date-added = 追加された日付

## Configuration Page

config-page-title = 構成
config-page-subtitle = アプリの設定と一般的な設定を更新
config-test = 検査
config-test-success = 接続されました
config-test-failure = 接続エラー
feedback-request = 機能のリクエスト
feedback-bug = バグを報告
section-general-title = 一般
section-general-subtitle = 一般的なアプリの設定と構成
general-host-title = サーバーホスト
general-host-tooltip = 変更にはアプリケーションの再起動が必要です
general-host-subtitle = バインドするアドレスとポート
general-loglevel-title = ログレベル
general-loglevel-subtitle = ログに記録する深刻度レベル
general-locale-title = 言葉
general-locale-tooltip = ページ更新時の更新
general-locale-subtitle = アプリが表示する言語
general-updatecheck-title = アップデートチェック
general-updatecheck-tooltip = 毎日チェック
general-updatecheck-subtitle = 定期的に更新を確認するかどうか
general-defaultformat-title = ファイル名の形式
general-unwatchfinished-title = 終了したらウォッチを解除
general-unwatchfinished-subtitle = 終了としてマークされた後に番組を見ない
seconds-suffix = 秒
section-feeds-title = フィード
section-feeds-subtitle = RSSフィードのポーリング間隔とカットオフ
feeds-fuzzy-cutoff-title = ファジーカットフ
feeds-fuzzy-cutoff-subtitle = 一致するショー名のカットオフ
feeds-pollinginterval-title = ポーリングの間隔
feeds-pollinginterval-tooltip = これを低い数字に設定すると、特定のRSSフィードからブロックされる可能性があります
feeds-pollinginterval-subtitle = RSSフィードを確認する頻度
feeds-completioncheck-title = 完了チェック間隔
feeds-completioncheck-subtitle = 完了状態を確認する周波数
feeds-seedratio-title = シード比の上限
feeds-seedratio-subtitle = ダウンロードを処理する前にシード比を待つ
section-torrent-title = Torrent クライアント
section-torrent-subtitle = ダウンロードクライアントに接続するためのツールです。
torrent-client-title = クライアント
torrent-client-subtitle = 使用するトレントクライアント
torrent-host-title = クライアントホスト
torrent-host-subtitle = クライアントがホストしている場所
torrent-username-title = ユーザー名
torrent-username-subtitle = 認証ユーザー名
torrent-password-title = パスワード
torrent-password-subtitle = 認証パスワード
torrent-secure-title = セキュア
torrent-secure-subtitle = HTTPS経由で接続
section-api-title = API キー
section-api-subtitle = ツンドクとの第三者連携用
api-key-refresh = 更新
config-api-documentation = ドキュメンテーション
section-encode-title = 後処理
section-encode-subtitle = ファイルサイズを小さくするための完了したダウンロードのエンコード
process-quality-title = クオリティーの設定
process-quality-subtitle = 品質が高いほどファイルサイズが大きくなります
encode-stats-total-encoded = { $total_encoded } エンコード完了
encode-stats-total-saved-gb = { $total_saved_gb } GBの合計保存しました
encode-stats-avg-saved-mb = { $avg_saved_mb } 平均MBが保存されました
encode-stats-median-time-hours = { $median_time_hours } 時間の経過時間
encode-stats-avg-time-hours = { $avg_time_hours } 時間
encode-quality-low = 低
encode-quality-moderate = モデレート
encode-quality-high = 高い
encode-quality-low-desc = 本当にひどいのです
encode-quality-moderate-desc = まあまあ
encode-quality-high-desc = 視覚的に損失のない
process-speed-title = 速度プリセット
process-speed-subtitle = 速度が速くなると品質が低く、ファイルサイズが大きくなります
process-max-encode-title = 最大のアクティブなエンコード
process-max-encode-subtitle = エンコード可能な同時処理の数
checkbox-enabled = 有効
ffmpeg-missing = FFmpegがインストールされていません
encode-time-title = エンコード時間
encode-time-subtitle = エンコードする時間範囲
hour-0 = 午前0時
hour-12 = 12時

## Login Page

form-missing-data = ログインフォームに必要なデータがありません。
invalid-credentials = 無効なユーザー名/パスワードの組み合わせです。
username = ユーザー名
password = パスワード
remember-me = ログイン情報を記憶する
login-button = ログイン

## Register Page

form-register-missing-data = フォームに必須項目「{{ $field }}」がありません。
form-password-mismatch = パスワードを適合しない
form-password-characters = パスワードは8文字以上でなければなりません。
form-username-taken = 同じユーザー名のユーザーが既に存在しています。
form-register-success = 登録が完了しました。ログインしてください。
confirm-password = パスワード確認
register-button = 登録

## Logs Page

logs-page-title = ログ
logs-page-subtitle = アプリ内で現在進行中のアクティビティ
logs-download = ログをダウンロード
log-level-info = 情報
log-level-warning = 注意
log-level-error = エラー
log-level-debug = デバッグ
title-with-episode = { $title }, エピソード { $episode }
episode-prefix-state = エピソード { $episode }、 { $state }
context-cache-failure = [アイテムがキャッシュされていません ({ $type }{ $id })]
websocket-state-connecting = 接続中
websocket-state-connected = 接続されました
websocket-state-disconnected = 切断されました

## Webhooks Page

webhooks-page-title = ウェブフック
webhooks-page-subtitle = 追跡番組で使用可能
webhook-status-valid = 🟢 接続されました
webhook-status-invalid = 🔴 接続エラー
webhook-add-success = Webhookが正常に追加されました！
webhook-edit-success = Webhookは正常に更新されました
webhook-delete-success = Webhookの削除に成功しました
webhook-edit-link = 編集
webhook-delete-link = 削除
webhook-page-empty = ここには何も表示されません!
webhook-page-empty-subtitle = まず、以下にWebhookを追加します。
webhook-add-button = Webhook を追加
add-webhook-modal-header = Webhook を追加
add-webhook-form-name-tt = Webhookの名前は表示目的のみです。
add-webhook-form-name-field = 名前
add-webhook-form-name-placeholder = My Webhook
add-webhook-form-service-tt = Webhookが投稿するサービスです。
add-webhook-form-service-field = サービス
add-webhook-form-url-tt = Webhookが投稿するURL。
add-webhook-form-url-field = URL
add-webhook-form-content-tt = コンテンツが送信される形式です。
add-webhook-form-content-field = コンテンツフォーマット
add-webhook-form-default-triggers-tt = 新しい番組でデフォルトで有効になるトリガー。
add-webhook-form-default-triggers-field = 既定のトリガー
add-webhook-form-add-button = Webhook を追加
add-webhook-form-cancel-button = キャンセル
delete-webhook-modal-header = Webhook を削除
delete-confirm-button = 削除
edit-webhook-modal-header = Webhookを編集
edit-form-save-button = 変更を保存

## Nyaa Search Page

nyaa-page-title = ニャー検索
nyaa-page-subtitle = アニメリリースを検索
entry-add-success = リリースを正常に追加しました！新規 { $count } エントリー。
search-placeholder = Attack on Titan
search-empty-results = ここには何も表示されません!
search-start-searching = いくつかの結果を表示するために検索を開始します。
search-th-name = 名前
search-th-size = サイズ
search-th-date = 日付
search-th-seeders = シーダー
search-th-leechers = リーチャー
search-th-link = 投稿へのリンク
search-item-link = リンク
modal-title = 検索結果を追加
modal-tab-new = 新しいショー
modal-tab-existing = 既存に追加
existing-show-tt = このリリースを追加したい既存のショー。
existing-show-field = ショー
name-tt = RSSフィードに表示されるタイトルの名前です。
name-field = 名前
name-placeholder = タイトルを表示
desired-format-tt = ファイルの名前が変更された後の名前です。
desired-format-field = 希望する形式
desired-folder-tt = 完了したファイルを配置するフォルダ。
desired-folder-field = 希望のフォルダ
season-tt = 名前の変更時にシリーズの季節に使用する値。
season-field = シーズン
episode-offset-tt = RSSフィードに表示されるエピソード番号を変更する正または負の値。
episode-offset-field = エピソードオフセット
add-button = リリースを追加
cancel-button = キャンセル
