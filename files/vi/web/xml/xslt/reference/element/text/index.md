---
title: <xsl:text>
slug: Web/XML/XSLT/Reference/Element/text
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:text>` ghi văn bản nguyên văn vào cây đầu ra. Nó có thể chứa `#PCDATA`, văn bản nguyên văn và các tham chiếu thực thể.

## Syntax

```xml
<xsl:text disable-output-escaping="yes" | "no">
  TEXT
</xsl:text>
```

### Required Attributes

Không có.

### Optional Attributes

- `disable-output-escaping`
  - : Chỉ định xem các ký tự đặc biệt có được escape khi ghi ra đầu ra hay không. Các giá trị có sẵn là `yes` hoặc `no`. Nếu đặt `yes`, ví dụ ký tự `>` sẽ được xuất ra là `>`, không phải `&gt;`.

    > [!NOTE]
    > Các trình duyệt cũ có thể không serialize kết quả của phép biến đổi (phần "output" bên dưới), khiến thuộc tính này trở nên không liên quan trong những ngữ cảnh như vậy. Để xuất các HTML entity, hãy dùng giá trị số thay thế, ví dụ `&#160;` cho `&nbsp;`.

### Type

Instruction, xuất hiện bên trong một template.

## Specifications

XSLT, section 7.2

## Gecko support

Được hỗ trợ như đã lưu ý.
