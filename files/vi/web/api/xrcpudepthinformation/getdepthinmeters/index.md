---
title: "XRCPUDepthInformation: phương thức getDepthInMeters()"
short-title: getDepthInMeters()
slug: Web/API/XRCPUDepthInformation/getDepthInMeters
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRCPUDepthInformation.getDepthInMeters
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`getDepthInMeters()`** của giao diện {{DOMxRef("XRCPUDepthInformation")}} trả về độ sâu tính bằng mét tại (x, y) trong tọa độ view chuẩn hóa (gốc tọa độ ở góc trên bên trái).

## Cú pháp

```js-nolint
getDepthInMeters(x, y)
```

### Tham số

- `x`
  - : Tọa độ X (gốc tọa độ bên trái, tăng sang phải).
- `y`
  - : Tọa độ Y (gốc tọa độ ở trên cùng, tăng xuống dưới).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Một {{jsxref("RangeError")}} được ném ra nếu `x` hoặc `y` lớn hơn 1.0 hoặc nhỏ hơn 0.0.

## Ví dụ

```js
const distance = depthInfo.getDepthInMeters(x, y);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
