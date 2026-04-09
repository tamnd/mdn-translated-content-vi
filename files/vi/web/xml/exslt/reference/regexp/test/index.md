---
title: regexp:test()
slug: Web/XML/EXSLT/Reference/regexp/test
page-type: exslt-function
sidebar: xmlsidebar
---

`regexp:test()` kiểm tra xem một chuỗi có khớp với một biểu thức chính quy được chỉ định hay không.

## Cú pháp

```plain
regexp:test(testString, regExpString[, flagsString])
```

### Tham số

- `testString`
  - : Chuỗi sẽ được kiểm tra.
- `regExpString`
  - : Biểu thức chính quy theo kiểu JavaScript để đánh giá.
- `flagsString` {{optional_inline}}
  - : Một chuỗi tùy chọn chứa các cờ ký tự.

Các cờ ký tự là:

- `g`
  - : Khớp toàn cục. Không có tác dụng đối với hàm này; nó được cho phép để nhất quán với các hàm regexp khác.
- `i`
  - : Khớp không phân biệt hoa thường. Nếu cờ này được chỉ định, phép khớp được thực hiện theo cách không phân biệt hoa thường.

### Giá trị trả về

`true` nếu regexp được chỉ định khớp với chuỗi kiểm tra.

## Thông số kỹ thuật

[EXSLT - REGEXP:TEST](https://exslt.github.io/regexp/functions/test/index.html)
