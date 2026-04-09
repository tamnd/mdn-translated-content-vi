---
title: name
slug: Web/XML/XPath/Reference/Functions/name
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `name` trả về một chuỗi biểu diễn QName của nút đầu tiên trong một node-set đã cho.

## Cú pháp

```plain
name( [node-set] )
```

### Tham số

- `node-set` (tùy chọn)
  - : QName của nút đầu tiên trong node-set này sẽ được trả về. Nếu bỏ qua đối số này, nút ngữ cảnh hiện tại sẽ được dùng.

### Giá trị trả về

Một chuỗi biểu diễn QName của một nút.

## Mô tả

- [QName](https://www.w3.org/TR/xml-names/#NT-QName) là tên đủ của nút, bao gồm tiền tố namespace và tên cục bộ của nó.

## Đặc tả

[XPath 1.0 4.1](https://www.w3.org/TR/xpath-10/#function-local-name)

## Hỗ trợ Gecko

Được hỗ trợ.
