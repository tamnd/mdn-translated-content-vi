---
title: <xsl:value-of>
slug: Web/XML/XSLT/Reference/Element/value-of
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:value-of>` đánh giá một biểu thức XPath, chuyển nó thành chuỗi, rồi ghi chuỗi đó vào cây kết quả.

## Syntax

```xml
<xsl:value-of select=EXPRESSION disable-output-escaping="yes" | "no"  />
```

### Required Attributes

- `select`
  - : Chỉ định biểu thức XPath cần được đánh giá và ghi ra cây đầu ra.

### Optional Attributes

- `disable-output-escaping` (Netscape không serialize kết quả của biến đổi - phần "output" bên dưới - nên thuộc tính này về cơ bản là không liên quan trong ngữ cảnh đó. Để xuất html-entities, hãy dùng giá trị số thay thế, ví dụ `&#160` cho `&nbsp`)
  - : Chỉ định xem các ký tự đặc biệt có được escape khi ghi ra đầu ra hay không. Các giá trị có sẵn là `yes` hoặc `no`. Nếu đặt `yes`, ví dụ ký tự > sẽ được xuất ra là `>`, không phải `&gt`.

### Type

Instruction, xuất hiện cùng với một template.

## Specifications

XSLT, section 7.6.1.

## Gecko support

Được hỗ trợ ngoại trừ như đã nêu ở trên.
