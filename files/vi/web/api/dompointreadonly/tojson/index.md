---
title: "DOMPointReadOnly: toJSON() method"
short-title: toJSON()
slug: Web/API/DOMPointReadOnly/toJSON
page-type: web-api-instance-method
browser-compat: api.DOMPointReadOnly.toJSON
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `toJSON()` của {{domxref("DOMPointReadOnly")}} trả về một đối tượng biểu diễn dạng {{Glossary("JSON")}} của đối tượng điểm.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới có các thuộc tính được đặt thành các giá trị trong `DOMPoint` hoặc `DOMPointReadOnly` mà phương thức được gọi.

## Ví dụ

Ví dụ này tạo một đối tượng {{domxref("DOMPoint")}} đại diện cho góc trên bên trái của cửa sổ hiện tại, tính theo tọa độ màn hình, sau đó chuyển đổi nó thành JSON.

```js
const topLeft = new DOMPoint(window.screenX, window.screenY);

const pointJSON = topLeft.toJSON();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
