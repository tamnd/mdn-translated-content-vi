---
title: regexp:match()
slug: Web/XML/EXSLT/Reference/regexp/match
page-type: exslt-function
sidebar: xmlsidebar
---

`regexp:match()` thực hiện đối sánh biểu thức chính quy trên một chuỗi và trả về các submatch tìm được như kết quả.

## Cú pháp

```plain
regexp:match(targetString, regExpString[, flagsString])
```

### Tham số

- `targetString`
  - : Chuỗi sẽ được đem đi đối sánh biểu thức chính quy.
- `regExpString`
  - : Biểu thức chính quy theo kiểu JavaScript để đánh giá.
- `flagsString` {{optional_inline}}
  - : Một chuỗi tùy chọn chứa các cờ ký tự.

Các cờ ký tự là:

- `g`
  - : Khớp toàn cục. Các submatch từ mọi lần khớp trong chuỗi sẽ được trả về. Nếu cờ này không được chỉ định, chỉ các submatch của lần khớp đầu tiên được trả về.
- `i`
  - : Khớp không phân biệt hoa thường. Nếu cờ này được chỉ định, phép khớp được thực hiện theo cách không phân biệt hoa thường.

### Giá trị trả về

Một node set gồm các phần tử `match`, mỗi phần tử có giá trị chuỗi bằng với một phần của chuỗi tham số đầu tiên được biểu thức chính quy bắt giữ. Nếu phép khớp không phải là khớp toàn cục, phần tử match đầu tiên có giá trị của phần chuỗi được khớp bởi toàn bộ biểu thức chính quy.

Ví dụ:

```xml
<xsl:for-each select="regExp:match('https://developer.mozilla.org/en/docs/Firefox_3_for_developers',
                                   '(\w+):\/\/([^/:]+)(:\d*)?([^# ]*)')">
   Part <xsl:value-of select="position()" /> = <xsl:value-of select="." />
</xsl:for-each>
```

Mã này tạo ra đầu ra sau:

```plain
Part 1 = https://developer.mozilla.org/en/docs/Firefox_3_for_developers
Part 2 = https
Part 3 = developer.mozilla.org
Part 4 =
Part 5 = /en/docs/Firefox_3_for_developers
```

## Thông số kỹ thuật

[EXSLT - REGEXP:MATCH](https://exslt.github.io/regexp/functions/match/index.html)
