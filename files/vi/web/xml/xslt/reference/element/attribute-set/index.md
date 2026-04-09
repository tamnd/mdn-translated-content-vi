---
title: <xsl:attribute-set>
slug: Web/XML/XSLT/Reference/Element/attribute-set
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:attribute-set>` tạo ra một tập hợp thuộc tính có tên, sau đó có thể được áp dụng nguyên vẹn cho tài liệu đầu ra, theo cách tương tự như các kiểu được đặt tên trong CSS.

## Cú pháp

```xml
<xsl:attribute-set name=NAME use-attribute-sets=LIST-OF-NAMES>
  <xsl:attribute>
</xsl:attribute-set>
```

### Thuộc tính bắt buộc

- `name`
  - : Chỉ định tên của tập thuộc tính. Tên phải là một QName hợp lệ.

### Thuộc tính tùy chọn

- `use-attribute-sets`
  - : Xây dựng một tập thuộc tính từ các tập thuộc tính khác. Tên của các tập đóng góp phải được phân tách bằng ký tự khoảng trắng và không được trực tiếp hoặc gián tiếp chứa chính chúng.

### Kiểu

Phần tử cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Đặc tả

XSLT, phần 7.1.4.

## Hỗ trợ Gecko

Được hỗ trợ.
