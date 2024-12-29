Rails.application.routes.draw do
  root "tasks#index"  # トップページをタスク一覧に設定
  resources :tasks    # タスクのCRUDルートを自動生成
end
