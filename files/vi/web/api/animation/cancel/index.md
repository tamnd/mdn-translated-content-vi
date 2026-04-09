---
title: "Animation: phương thức cancel()"
short-title: cancel()
slug: Web/API/Animation/cancel
page-type: web-api-instance-method
browser-compat: api.Animation.cancel
---

{{ APIRef("Web Animations") }}

Phương thức **`cancel()`** của {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) xóa tất cả các {{domxref("KeyframeEffect")}} do hoạt ảnh này tạo ra và hủy quá trình phát của nó.

> [!NOTE]
> Khi một hoạt ảnh bị hủy, {{domxref("Animation.startTime", "startTime")}} và {{domxref("Animation.currentTime", "currentTime")}} của nó được đặt thành `null`.

## Cú pháp

```js-nolint
cancel()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Phương thức này không trực tiếp ném ngoại lệ; tuy nhiên, nếu {{domxref("Animation.playState", "playState")}} của hoạt ảnh không phải là `"idle"` tại thời điểm bị hủy, {{domxref("Animation.finished", "current finished promise", "", 1)}} sẽ bị từ chối với một {{domxref("DOMException")}} có tên `AbortError`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("KeyframeEffect")}}
- {{domxref("Animation")}}
- {{domxref("Animation.playState")}}
- {{domxref("Animation.finished")}} trả về promise mà thao tác này sẽ từ chối nếu `playState` của hoạt ảnh không phải `"idle"`.
