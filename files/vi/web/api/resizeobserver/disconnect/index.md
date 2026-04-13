---
title: "ResizeObserver: phương thức disconnect()"
short-title: disconnect()
slug: Web/API/ResizeObserver/disconnect
page-type: web-api-instance-method
browser-compat: api.ResizeObserver.disconnect
---

{{APIRef("Resize Observer API")}}

Phương thức **`disconnect()`** của giao diện {{domxref("ResizeObserver")}} ngừng theo dõi tất cả các mục tiêu {{domxref('Element')}} hoặc {{domxref('SVGElement')}} đang được quan sát.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Không có.

## Ví dụ

```js
btn.addEventListener("click", () => {
  resizeObserver.disconnect();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
