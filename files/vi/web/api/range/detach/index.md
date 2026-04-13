---
title: "Range: phương thức detach()"
short-title: detach()
slug: Web/API/Range/detach
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Range.detach
---

{{APIRef("DOM")}}{{deprecated_header}}

Phương thức **`Range.detach()`** không làm gì cả. Trước đây nó dùng để vô hiệu hóa đối tượng {{domxref("Range")}} và cho phép trình duyệt giải phóng các tài nguyên liên quan. Phương thức này được giữ lại để tương thích.

## Cú pháp

```js-nolint
detach()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();

range.selectNode(document.getElementsByTagName("div").item(0));
range.detach();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
