# Bridge

Categorized in structual design pattern.

## Intent

- 機能とインターフェイスを動的に切り替えたい場合
- 拡張時のclassの膨張を防ぎたい場合

## Pros & Cons

- Pros
  - プラットフォームに依存しないコードの記述が可能
  - Open/Closed Principleに従っている
  - 使用側での実装の詳細を隠す

- Cons
  - 複数のクラスが追加されるたびに、コードの複雑性が増す
