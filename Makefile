.DEFAULT_GOAL := help

Q ?= a

.PHONY: run
run: ## 実行する
	./shell/run.sh

.PHONY: runwi
runwi: ## inputから入力を取らず標準入力で実行する。主にインタラクティブな問題に利用。
	./shell/runwi.sh

.PHONY: base
base: ## ベースファイルの取得
	./shell/base.sh

.PHONY: m
m: ## ファイルの移動
	./shell/movefile.sh $(Q)

.PHONY: mc
mc: ## コンテスト名を指定してファイルを移動
	./shell/movefilecontest.sh

.PHONY: entr
entr: ## entrでのホットリロード
	./shell/entr.sh

.PHONY: d
d: ## contestのファイルにあるコンテスト, Q(小文字)問題をダウンロード
	./shell/download.sh $(Q)

.PHONY: du
du: ## URLからダウンロード
	./shell/downloadurl.sh

.PHONY: start
start: ## Q(小文字)問題のダウンロード->テンプレート準備
	./shell/setcontest.sh
	./shell/download.sh $(Q)
	./shell/base.sh

.PHONY: next
next: ## 次の問題へ。Q(小文字)問題のダウンロード->テンプレート準備
	./shell/movefile.sh $(F)
	./shell/download.sh $(T)
	./shell/base.sh

.PHONY: t
t: ## テスト
	./shell/test.sh

.PHONY: s
s: ## 提出
	./shell/submit.sh

.PHONY: su
su: ## URLで提出
	./shell/submiturl.sh

.PHONY: login
login: ## AtCoderにログイン
	oj login https://atcoder.jp

.PHONY: help
help: ## ヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
