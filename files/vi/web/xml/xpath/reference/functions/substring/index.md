---
title: substring
slug: Web/XML/XPath/Reference/Functions/substring
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `substring` trả về một phần của một chuỗi cho trước.

## Cú pháp

```plain
substring(string, start)
substring(string, start, length)
```

### Tham số

- `string`
  - : Chuỗi sẽ được đánh giá.
- `start`
  - : Vị trí trong `string` nơi chuỗi con bắt đầu
- `length` {{optional_inline}}
  - : Độ dài của chuỗi con.
    Nếu bỏ qua, chuỗi trả về sẽ chứa mọi ký tự từ vị trí `start` đến hết `string`.

### Giá trị trả về

Một chuỗi.

## Mô tả

Như trong các hàm XPath khác, vị trí không bắt đầu từ 0. Ký tự đầu tiên trong chuỗi có vị trí là 1, không phải 0.

## Thông số kỹ thuật

[XPath 1.0 4.2](https://www.w3.org/TR/xpath-10/#function-substring)

## Hỗ trợ Gecko

Được hỗ trợ.
