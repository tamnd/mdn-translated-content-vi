---
title: system-property
slug: Web/XML/XPath/Reference/Functions/system-property
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `system-property` trả về một đối tượng đại diện cho system-property đã cho.

## Cú pháp

```plain
system-property(name)
```

### Tham số

- `name` (tùy chọn)
  - : Tên của thuộc tính hệ thống. Đối số phải đánh giá thành một chuỗi là QName. QName được mở rộng thành tên bằng các khai báo không gian tên có hiệu lực trong biểu thức. Hàm system-property trả về một đối tượng đại diện cho giá trị của thuộc tính hệ thống được xác định bởi tên đó. Nếu không có thuộc tính hệ thống như vậy, nên trả về chuỗi rỗng.

### Giá trị trả về

Một đối tượng đại diện cho system-property đã cho.

## Mô tả

- xsl:version, một số cho biết phiên bản XSLT được bộ xử lý triển khai; đối với các bộ xử lý XSLT triển khai phiên bản XSLT được chỉ định bởi tài liệu này, đó là số 1.0
- xsl:vendor, một chuỗi xác định nhà cung cấp của bộ xử lý XSLT
- xsl:vendor-url, một chuỗi chứa URL xác định nhà cung cấp của bộ xử lý XSLT; thông thường đây là trang web chính của trang web của nhà cung cấp.

## Thông số kỹ thuật

[XSLT 1.0 12.4](https://www.w3.org/TR/xslt-10/#function-system-property)

## Hỗ trợ Gecko

Được hỗ trợ.
