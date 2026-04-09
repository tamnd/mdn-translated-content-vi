---
title: <xsl:namespace-alias>
slug: Web/XML/XSLT/Reference/Element/namespace-alias
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:namespace-alias>` là một cơ chế ít được dùng để ánh xạ một namespace trong stylesheet sang một namespace khác trong cây đầu ra. Trường hợp dùng phổ biến nhất cho phần tử này là khi tạo một stylesheet từ một stylesheet khác. Để ngăn một literal result element có tiền tố `xsl:` thông thường (vốn cần được sao chép nguyên trạng vào cây kết quả) bị bộ xử lý hiểu nhầm, nó được gán một namespace tạm thời, rồi được chuyển đổi ngược lại đúng cách về namespace XSLT trong cây đầu ra.

## Cú pháp

```xml
<xsl:namespace-alias stylesheet-prefix=NAME result-prefix=NAME />
```

### Thuộc tính bắt buộc

- `stylesheet-prefix`
  - : Chỉ định namespace tạm thời.
- `result-prefix`
  - : Chỉ định namespace mong muốn cho cây đầu ra.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Phần tử cấp cao nhất, phải là phần tử con của `<xsl:stylesheet>` hoặc `<xsl:transform>`.

## Đặc tả

XSLT, phần 7.1.1

## Hỗ trợ Gecko

Hiện chưa được hỗ trợ.
