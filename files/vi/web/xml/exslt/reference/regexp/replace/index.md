---
title: regexp:replace()
slug: Web/XML/EXSLT/Reference/regexp/replace
page-type: exslt-function
sidebar: xmlsidebar
---

`regexp:replace()` thay thế các phần của một chuỗi khớp với một biểu thức chính quy đã cho bằng nội dung của một chuỗi khác.

## Cú pháp

```plain
regexp:replace(originalString, regExpString, flagsString, replaceString)
```

### Tham số

- `originalString`
  - : Chuỗi sẽ được thực hiện thao tác tìm và thay thế.
- `regExpString`
  - : Biểu thức chính quy theo kiểu JavaScript để đánh giá.
- `flagsString`
  - : Chuỗi chứa các cờ ký tự.
- `replaceString`
  - : Chuỗi sẽ được dùng để thay thế các chuỗi con khớp.

Các cờ ký tự là:

- `g` - Thay thế toàn cục
  - : Nếu cờ này được chỉ định, tất cả các lần xuất hiện của biểu thức chính quy trong `originalString` sẽ được thay thế. Nếu không, chỉ lần xuất hiện đầu tiên được thay thế.
- `i` - Khớp không phân biệt hoa thường
  - : Nếu cờ này được chỉ định, phép khớp được thực hiện theo cách không phân biệt hoa thường.

### Giá trị trả về

Phiên bản đã sửa đổi của chuỗi.

## Thông số kỹ thuật

[EXSLT - REGEXP:REPLACE](https://exslt.github.io/regexp/functions/replace/index.html)
