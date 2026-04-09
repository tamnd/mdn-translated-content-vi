---
title: substring-before
slug: Web/XML/XPath/Reference/Functions/substring-before
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `substring-before` trả về một chuỗi là phần của một chuỗi cho trước nằm trước một chuỗi con cho trước.

## Cú pháp

```plain
substring-before( haystack, needle )
```

### Tham số

- `haystack`
  - : Chuỗi sẽ được đánh giá. Một phần của chuỗi này sẽ được trả về.
- `needle`
  - : Chuỗi con cần tìm. Mọi thứ trước lần xuất hiện đầu tiên của `needle` trong `haystack` sẽ được trả về.

### Giá trị trả về

Một chuỗi.

### Ví dụ

| Ví dụ XPath                     | Kết quả        |
| ------------------------------- | -------------- |
| `substring-before('aa-bb','-')` | `aa`           |
| `substring-before('aa-bb','a')` | `(chuỗi rỗng)` |
| `substring-before('aa-bb','b')` | `aa-`          |
| `substring-before('aa-bb','q')` | (chuỗi rỗng)   |

## Thông số kỹ thuật

[XPath 1.0 4.2](https://www.w3.org/TR/xpath-10/#function-substring-before)

## Hỗ trợ Gecko

Được hỗ trợ.
