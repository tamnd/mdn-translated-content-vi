---
title: namespace-uri
slug: Web/XML/XPath/Reference/Functions/namespace-uri
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `namespace-uri` trả về một chuỗi biểu diễn URI namespace của nút đầu tiên trong một node-set đã cho.

## Cú pháp

```plain
namespace-uri( [node-set] )
```

### Tham số

- `node-set` (tùy chọn)
  - : URI namespace của nút đầu tiên trong node-set này sẽ được trả về. Nếu bỏ qua đối số này, nút ngữ cảnh hiện tại sẽ được dùng.

### Giá trị trả về

Một chuỗi biểu diễn URI của namespace mà nút đã cho thuộc về.

## Mô tả

- Nếu nút đã cho không có namespace được chỉ định, chuỗi trả về sẽ là chuỗi rỗng.
- Với các nút khác ngoài nút phần tử và thuộc tính, chuỗi trả về sẽ luôn là chuỗi rỗng.

## Đặc tả

[XPath 1.0 4.1](https://www.w3.org/TR/xpath-10/#function-local-name)

## Hỗ trợ Gecko

Được hỗ trợ.
