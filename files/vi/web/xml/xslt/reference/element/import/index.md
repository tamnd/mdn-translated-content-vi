---
title: <xsl:import>
slug: Web/XML/XSLT/Reference/Element/import
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:import>` là một phần tử cấp cao nhất dùng để nhập nội dung của một stylesheet vào một stylesheet khác. Nói chung, nội dung của stylesheet được nhập có độ ưu tiên nhập thấp hơn nội dung của stylesheet đang nhập. Điều này trái ngược với `<xsl:include>`, trong đó nội dung của stylesheet được đưa vào có chính xác cùng độ ưu tiên với nội dung của stylesheet bao gồm nó.

## Cú pháp

```xml
<xsl:import href=URI />
```

### Thuộc tính bắt buộc

- `href`
  - : Chỉ định URI của stylesheet cần nhập.

### Thuộc tính tùy chọn

Không có.

### Kiểu

Phần tử cấp cao nhất, phải xuất hiện trước mọi phần tử con khác của `<xsl:stylesheet>` hoặc `<xsl:transform>` trong stylesheet đang nhập.

## Đặc tả

XSLT, phần 2.6.2.

## Hỗ trợ Gecko

Phần lớn được hỗ trợ, nhưng có một vài vấn đề với biến và tham số cấp cao nhất tính đến Mozilla 1.0.
