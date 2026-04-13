---
title: "DOMPoint: DOMPoint() constructor"
short-title: DOMPoint()
slug: Web/API/DOMPoint/DOMPoint
page-type: web-api-constructor
browser-compat: api.DOMPoint.DOMPoint
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMPoint()`** tạo và trả về một đối tượng {{domxref("DOMPoint")}} mới, với các giá trị cho một số hoặc tất cả các thuộc tính.

Bạn cũng có thể tạo `DOMPoint` bằng cách gọi hàm tĩnh {{domxref("DOMPoint.fromPoint_static", "DOMPoint.fromPoint()")}}. Hàm đó chấp nhận bất kỳ đối tượng nào có các tham số cần thiết, bao gồm `DOMPoint` hoặc {{domxref("DOMPointReadOnly")}}.

## Cú pháp

```js-nolint
new DOMPoint()
new DOMPoint(x)
new DOMPoint(x, y)
new DOMPoint(x, y, z)
new DOMPoint(x, y, z, w)
```

### Tham số

- `x` {{optional_inline}}
  - : Tọa độ `x` của `DOMPoint` mới.
- `y` {{optional_inline}}
  - : Tọa độ `y` của `DOMPoint` mới.
- `z` {{optional_inline}}
  - : Tọa độ `z` của `DOMPoint` mới.
- `w` {{optional_inline}}
  - : Giá trị phối cảnh của `DOMPoint` mới.

## Ví dụ

Ví dụ này tạo một `DOMPoint` đại diện cho góc trên bên trái của cửa sổ hiện tại, sau đó tạo điểm thứ hai dựa trên điểm đầu tiên, được offset 100 pixel theo cả chiều dọc và ngang.

```js
const windTopLeft = new DOMPoint(window.screenX, window.screenY);
const newTopLeft = DOMPoint.fromPoint(windTopLeft);
newTopLeft.x += 100;
newTopLeft.y += 100;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPointReadOnly.DOMPointReadOnly", "DOMPointReadOnly()")}}
- {{domxref("DOMRect")}}
- {{domxref("DOMMatrix")}}
