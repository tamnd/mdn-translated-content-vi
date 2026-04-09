---
title: id
slug: Web/XML/XPath/Reference/Functions/id
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `id` tìm các nút khớp với các id đã cho và trả về một node-set chứa các nút được xác định.

## Cú pháp

```plain
id( expression )
```

### Tham số

- `expression`
  - : Nếu `expression` là một node-set, thì giá trị chuỗi của từng nút trong node-set đó được coi là một id riêng lẻ. Node-set trả về là các nút tương ứng với những id đó.
    Nếu `expression` là một chuỗi, hoặc bất cứ thứ gì khác ngoài node-set, thì `expression` được coi là một danh sách id được phân tách bằng dấu cách. Node-set trả về là các nút tương ứng với những id đó.

### Giá trị trả về

Một node-set chứa nút hoặc các nút được xác định bởi id hoặc các id đã cho.

## Mô tả

- DTD của tài liệu XML xác định thuộc tính nào là ID. Xem [XPath 1.0 5.2.1](https://www.w3.org/TR/xpath-10/#unique-id)

## Đặc tả

[XPath 1.0 4.1](https://www.w3.org/TR/xpath-10/#function-id)

## Hỗ trợ Gecko

Hỗ trợ một phần.
