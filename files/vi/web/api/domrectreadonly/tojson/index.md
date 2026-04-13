---
title: "DOMRectReadOnly: phương thức toJSON()"
short-title: toJSON()
slug: Web/API/DOMRectReadOnly/toJSON
page-type: web-api-instance-method
browser-compat: api.DOMRectReadOnly.toJSON
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `toJSON()` của {{domxref("DOMRectReadOnly")}} trả về biểu diễn {{Glossary("JSON")}} của đối tượng `DOMRectReadOnly`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới có các thuộc tính được thiết lập bằng các giá trị trong `DOMRectReadOnly` mà phương thức được gọi trên đó.

## Ví dụ

Ví dụ này tạo một {{domxref("DOMRectReadOnly")}} đại diện cho một hình chữ nhật tại vị trí `(10, 20)` với chiều rộng `100` và chiều cao `50`. Sau đó nó gọi `toJSON()` để lấy biểu diễn JSON của hình chữ nhật.

```js
const rect = new DOMRectReadOnly(10, 20, 100, 50);

const rectJSON = rect.toJSON();
console.log(rectJSON);
// Kết quả: { x: 10, y: 20, width: 100, height: 50, top: 20, right: 110, bottom: 70, left: 10 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
