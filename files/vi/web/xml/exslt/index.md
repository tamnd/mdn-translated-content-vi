---
title: EXSLT
slug: Web/XML/EXSLT
page-type: landing-page
sidebar: xmlsidebar
---

EXSLT là một tập hợp các phần mở rộng cho [XSLT](/en-US/docs/Web/XML/XSLT) được tổ chức thành các module, cung cấp các hàm để thực hiện biến đổi trên tài liệu XML.
Để dùng một hàm EXSLT, bạn cần khai báo namespace của hàm, rồi dùng tiền tố thích hợp khi gọi hàm.

Ví dụ, để dùng gói biểu thức chính quy:

```xml
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:regexp="http://exslt.org/regular-expressions">
  <xsl:template match="/">
    <!-- … -->
    <xsl:value-of select="regexp:replace(/root/@value, 'before', 'gi', 'AFTER')"/>
    <!-- … -->
  </xsl:template>
</xsl:stylesheet>
```

## Tham chiếu

[Tham chiếu EXSLT](/en-US/docs/Web/XML/EXSLT/Reference) mô tả các namespace và hàm cho các thao tác phổ biến, toán học, biểu thức chính quy, thao tác tập hợp và thao tác chuỗi.

### Common

Gói EXSLT Common cung cấp các hàm cơ bản mở rộng khả năng của XSLT. Namespace của gói Common là `http://exslt.org/common`.

- [`exsl:node-set()`](/en-US/docs/Web/XML/EXSLT/Reference/exsl/node-set)
- [`exsl:object-type()`](/en-US/docs/Web/XML/EXSLT/Reference/exsl/object-type)

### Math

Gói EXSLT Math cung cấp các hàm để làm việc với giá trị số và so sánh các nút. Namespace của gói Math là `http://exslt.org/math`.

- [`math:highest()`](/en-US/docs/Web/XML/EXSLT/Reference/math/highest)
- [`math:lowest()`](/en-US/docs/Web/XML/EXSLT/Reference/math/lowest)
- [`math:max()`](/en-US/docs/Web/XML/EXSLT/Reference/math/max)
- [`math:min()`](/en-US/docs/Web/XML/EXSLT/Reference/math/min)

### Regular expressions

Gói EXSLT Regular Expressions cung cấp các hàm cho phép kiểm tra, khớp và thay thế văn bản bằng các biểu thức chính quy theo kiểu JavaScript.
Namespace EXSLT Regular Expressions là `http://exslt.org/regular-expressions`.

- [`regexp:match()`](/en-US/docs/Web/XML/EXSLT/Reference/regexp/match)
- [`regexp:replace()`](/en-US/docs/Web/XML/EXSLT/Reference/regexp/replace)
- [`regexp:test()`](/en-US/docs/Web/XML/EXSLT/Reference/regexp/test)

### Sets

Gói EXSLT Sets cung cấp các hàm cho phép bạn thao tác tập hợp. Namespace của các hàm này là `http://exslt.org/sets`.

- [`set:difference()`](/en-US/docs/Web/XML/EXSLT/Reference/set/difference)
- [`set:distinct()`](/en-US/docs/Web/XML/EXSLT/Reference/set/distinct)
- [`set:intersection()`](/en-US/docs/Web/XML/EXSLT/Reference/set/intersection)
- [`set:has-same-node()`](/en-US/docs/Web/XML/EXSLT/Reference/set/has-same-node)
- [`set:leading()`](/en-US/docs/Web/XML/EXSLT/Reference/set/leading)
- [`set:trailing()`](/en-US/docs/Web/XML/EXSLT/Reference/set/trailing)

### Strings

Gói EXSLT Strings cung cấp các hàm cho phép thao tác chuỗi. Namespace của gói Strings là `http://exslt.org/strings`.

- [`str:concat()`](/en-US/docs/Web/XML/EXSLT/Reference/str/concat)
- [`str:split()`](/en-US/docs/Web/XML/EXSLT/Reference/str/split)
- [`str:tokenize()`](/en-US/docs/Web/XML/EXSLT/Reference/str/tokenize)

## Xem thêm

- [Trang web EXSLT](https://exslt.github.io/)
