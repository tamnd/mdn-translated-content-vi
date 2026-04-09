---
title: substring-after
slug: Web/XML/XPath/Reference/Functions/substring-after
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `substring-after` trả về một chuỗi là phần còn lại của một chuỗi cho trước sau một chuỗi con cho trước.

## Cú pháp

```plain
substring-after( haystack, needle )
```

### Tham số

- `haystack`
  - : Chuỗi sẽ được đánh giá. Một phần của chuỗi này sẽ được trả về.
- `needle`
  - : Chuỗi con cần tìm. Mọi thứ sau lần xuất hiện đầu tiên của `needle` trong `haystack` sẽ được trả về.

### Giá trị trả về

Một chuỗi.

### Ví dụ

| Ví dụ XPath                    | Kết quả      |
| ------------------------------ | ------------ |
| `substring-after('aa-bb','-')` | `bb`         |
| `substring-after('aa-bb','a')` | `a-bb`       |
| `substring-after('aa-bb','b')` | `b`          |
| `substring-after('aa-bb','q')` | (chuỗi rỗng) |

## Thông số kỹ thuật

[XPath 1.0 4.2](https://www.w3.org/TR/xpath-10/#function-substring-after)

## Hỗ trợ Gecko

Được hỗ trợ.
