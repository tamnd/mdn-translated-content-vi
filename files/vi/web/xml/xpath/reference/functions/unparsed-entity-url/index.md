---
title: unparsed-entity-url
slug: Web/XML/XPath/Reference/Functions/unparsed-entity-url
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `unparsed-entity-url()` trả về URI của thực thể chưa phân tích với tên đã cho. Đây là dữ liệu không phải XML được tham chiếu trong DTD của tài liệu nguồn.

## Cú pháp

```plain
string unparsed-entity-url(string)
```

### Tham số

Tên của thực thể chưa phân tích. Nếu đối số không phải là chuỗi, nó được chuyển đổi theo các quy tắc của hàm string(). Tên phải là một XML Name.

### Giá trị trả về

URI của thực thể chưa phân tích lấy từ DTD, nếu nó tồn tại. Nếu không, trả về chuỗi rỗng.

## Thông số kỹ thuật

[XSLT 1.0 12.4](https://www.w3.org/TR/xslt-10/#function-unparsed-entity-uri)

## Hỗ trợ Gecko

Không được hỗ trợ.
