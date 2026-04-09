---
title: str:tokenize()
slug: Web/XML/EXSLT/Reference/str/tokenize
page-type: exslt-function
sidebar: xmlsidebar
---

`str:tokenize()` tách một chuỗi bằng một tập hợp các ký tự làm dấu phân tách để xác định vị trí cần tách, và trả về một node-set chứa các chuỗi kết quả.

## Cú pháp

```plain
str:tokenize(string, delimiters)
```

### Tham số

- `string`
  - : Chuỗi cần token hóa.
- `delimiters`
  - : Mỗi ký tự trong chuỗi này được dùng làm dấu phân tách từ khi token hóa.

### Giá trị trả về

Một node-set gồm các phần tử `token`, mỗi phần tử chứa một token từ `string`.

## Ví dụ

```plain
str:tokenize('2007-09-14-03T11:40:23', '-T:')
```

Kết quả trả về là một node-set như sau:

```xml
<token>2007</token>
<token>09</token>
<token>14</token>
<token>11</token>
<token>40</token>
<token>23</token>
```

## Thông số kỹ thuật

[EXSLT - STR:TOKENIZE](https://exslt.github.io/str/functions/tokenize/index.html)

## Xem thêm

- [`str:split()`](/en-US/docs/Web/XML/EXSLT/Reference/str/split)
