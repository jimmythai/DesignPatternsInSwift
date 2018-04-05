# Strategy

Categorized in behavioral design pattern.

## Intent

- 実行時に処理のアルゴリズムを決定したい時

## Pros & Cons

- Pros
  - ランタイムでのアルゴリズムの切り替えが可能
  - アルゴリズムのコードとデータと他のクラスを分ける
  - 継承ではなく委譲を使用する
  - Open/Closed Principleに従っている

- Cons
  - 複数のクラスが追加されるたびに、コードの複雑性が増す
  - 使用側は、ストラテジーの違いを理解し、正しいストラテジーを使用しなければならない
