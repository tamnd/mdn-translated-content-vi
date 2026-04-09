---
title: <xsl:decimal-format>
slug: Web/XML/XSLT/Reference/Element/decimal-format
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:decimal-format>` xác định các ký tự và ký hiệu sẽ được dùng khi chuyển số thành chuỗi bằng hàm `format-number( )`.

## Cú pháp

```xml
<xsl:decimal-format
  name=NAME
  decimal-separator=CHARACTER
  grouping-separator=CHARACTER
  infinity=STRING
  minus-sign=CHARACTER
  NaN=STRING
  percent=CHARACTER
  per-mille=CHARACTER
  zero-digit=CHARACTER
  digit=CHARACTER
  pattern-separator=CHARACTER />
```

### Thuộc tính bắt buộc

Không có.

### Thuộc tính tùy chọn

- `name`
  - : Chỉ định tên cho định dạng này.
- `decimal-separator`
  - : Chỉ định ký tự dấu thập phân. Mặc định là `.`.
- `grouping-separator`
  - : Chỉ định ký tự phân tách hàng nghìn. Mặc định là `,`.
- `infinity`
  - : Chỉ định chuỗi được dùng để biểu diễn vô cực. Mặc định là chuỗi `Infinity`.
- `minus-sign`
  - : Chỉ định ký tự dấu trừ. Mặc định là dấu gạch ngang `-`.
- `NaN`
  - : Chỉ định chuỗi được dùng khi giá trị không phải là số. Mặc định là chuỗi `NaN`.
- `percent`
  - : Chỉ định ký tự dấu phần trăm. Mặc định là `%`.
- `per-mille`
  - : Chỉ định ký tự phần nghìn. Mặc định là `‰`.
- `zero-digit`
  - : Chỉ định ký tự số không. Mặc định là `0`.
- `digit`
  - : Chỉ định ký tự được dùng trong mẫu định dạng để đại diện cho một chữ số. Mặc định là `#`.
- `pattern-separator`
  - : Chỉ định ký tự phân tách các mẫu con dương và âm trong một mẫu định dạng. Mặc định là dấu chấm phẩy `;`.

### Kiểu

Cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Đặc tả

XSLT, section 12.3.

## Hỗ trợ Gecko

Được hỗ trợ kể từ 1.0 (Mozilla 1.0, Netscape 7.0).
