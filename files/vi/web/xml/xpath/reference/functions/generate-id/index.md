---
title: generate-id
slug: Web/XML/XPath/Reference/Functions/generate-id
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `generate-id` tạo một id duy nhất cho nút đầu tiên trong một node-set cho trước và trả về một chuỗi chứa id đó.

## Cú pháp

```plain
generate-id( [node-set] )
```

### Tham số

- `node-set` (tùy chọn)
  - : Một id sẽ được tạo cho nút đầu tiên trong node-set này. Nếu bỏ qua, nút ngữ cảnh hiện tại sẽ được dùng.

### Giá trị trả về

Một chuỗi chứa id đã được tạo.

## Mô tả

- Cùng một id phải được tạo ra mỗi lần cho cùng một nút trong tài liệu hiện tại ở cùng một lần biến đổi hiện tại.
- Id được tạo có thể không giống nhau trong các lần biến đổi tiếp theo.

Hàm này là một bổ sung riêng của XSLT cho XPath. Nó không thuộc thư viện hàm cốt lõi của XPath.

## Đặc tả

[XSLT 1.0 12.4](https://www.w3.org/TR/xslt-10/#function-generate-id)

## Hỗ trợ Gecko

Được hỗ trợ.
