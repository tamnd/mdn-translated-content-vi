---
title: str:split()
slug: Web/XML/EXSLT/Reference/str/split
page-type: exslt-function
sidebar: xmlsidebar
---

`str:split()` tách một chuỗi bằng một chuỗi mẫu để xác định vị trí cần tách, và trả về một node-set chứa các chuỗi kết quả.

## Cú pháp

```plain
str:split(string, pattern)
```

### Tham số

- `string`
  - : Chuỗi cần tách.
- `pattern`
  - : Mẫu chỉ ra vị trí cần tách chuỗi.

### Giá trị trả về

Một node-set gồm các phần tử `token`, mỗi phần tử chứa một token từ `string`.

## Ví dụ

```plain
str:split('book, phone, computer, chair', ', ')
```

Kết quả trả về là một node-set như sau:

```xml
<token>book</token>
<token>phone</token>
<token>computer</token>
<token>chair</token>
```

## Thông số kỹ thuật

[EXSLT - STR:SPLIT](https://exslt.github.io/str/functions/split/index.html)

## Xem thêm

- [`str:tokenize()`](/en-US/docs/Web/XML/EXSLT/Reference/str/tokenize)
