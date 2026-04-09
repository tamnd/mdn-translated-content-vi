---
title: <xsl:apply-imports>
slug: Web/XML/XSLT/Reference/Element/apply-imports
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:apply-imports>` khá khó hiểu, và chủ yếu được dùng trong các stylesheet phức tạp. Độ ưu tiên khi import yêu cầu rằng các quy tắc template trong stylesheet chính có độ ưu tiên cao hơn các quy tắc template trong stylesheet được import. Tuy nhiên, đôi khi việc buộc processor dùng một quy tắc template từ stylesheet được import (có độ ưu tiên thấp hơn) thay vì một quy tắc tương đương trong stylesheet chính lại hữu ích.

## Cú pháp

```xml
<xsl:apply-imports/>
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

Không có.

### Loại

Instruction, xuất hiện bên trong một template.

## Thông số kỹ thuật

XSLT, section 5.6.

## Hỗ trợ Gecko

Được hỗ trợ.
