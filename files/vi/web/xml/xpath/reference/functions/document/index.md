---
title: document
slug: Web/XML/XPath/Reference/Functions/document
page-type: xpath-function
sidebar: xmlsidebar
---

Hàm `document` tìm một node-set trong một tài liệu bên ngoài, hoặc nhiều tài liệu bên ngoài, và trả về node-set kết quả.

## Cú pháp

```plain
document( URI [,node-set] )
```

### Tham số

- `URI`
  - : Một URI tuyệt đối hoặc tương đối của tài liệu cần được truy xuất. URI cũng có thể bao gồm một fragment identifier.
- `node-set` (tùy chọn)
  - : Một biểu thức trỏ đến một node-set trong tài liệu bên ngoài cần được trả về.

### Giá trị trả về

Một node-set.

## Mô tả

- Nếu URI chứa một fragment identifier và fragment đó có thể được xác định trong tài liệu bên ngoài, fragment đó sẽ được xem là gốc trong biểu thức của đối số `node-set`. Nếu đối số `node-set` bị bỏ qua, toàn bộ fragment sẽ được trả về.
- Nếu đối số `URI` là một node-set, và đối số thứ hai có mặt, mỗi nút trong node-set sẽ được đánh giá như một URI riêng biệt, và node-set được trả về sẽ như thể hàm `document` đã được gọi nhiều lần (mỗi lần với cùng đối số thứ hai như đã cho trong lời gọi hàm) và các node-set kết quả đã được nối thành một node-set duy nhất.
- Các điều kiện cụ thể khác tồn tại với các hành vi được chỉ định. Xem tài liệu XSLT 1.0 để biết chi tiết.
- Vì URI là tương đối với tài liệu XSL, `document("")` sẽ trả về nút gốc của tài liệu hiện tại.

Đây là một bổ sung dành riêng cho XSLT đối với XPath. Nó không phải là một phần của thư viện hàm lõi của XPath.

## Đặc tả

[XSLT 1.0 12.1](https://www.w3.org/TR/xslt-10/#function-document)

## Hỗ trợ Gecko

Được hỗ trợ.
