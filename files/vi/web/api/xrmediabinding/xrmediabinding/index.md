---
title: "XRMediaBinding: XRMediaBinding() constructor"
short-title: XRMediaBinding()
slug: Web/API/XRMediaBinding/XRMediaBinding
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.XRMediaBinding.XRMediaBinding
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Hàm khởi tạo **`XRMediaBinding()`** tạo và trả về một đối tượng {{domxref("XRMediaBinding")}} mới.

## Cú pháp

```js-nolint
new XRMediaBinding(session)
```

### Tham số

- `session`
  - : Một đối tượng {{domxref("XRSession")}} chỉ định phiên WebXR để tạo liên kết phương tiện.

### Giá trị trả về

Một {{domxref("XRMediaBinding")}} mới được tạo.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu không thể tạo `XRMediaBinding` mới do một trong các lỗi trạng thái sau:
    - {{domxref("XRSession")}} được chỉ định bởi `session` đã bị dừng.
    - `session` được chỉ định không phải là immersive.

## Ví dụ

### Tạo `XRMediaBinding` mới

Ví dụ sau tạo một liên kết phương tiện mới cho một phiên để tạo {{domxref("XRQuadLayer")}} nhằm hiển thị lớp video trong cảnh.

```js
const xrMediaBinding = new XRMediaBinding(xrSession);

const video = document.createElement("video");
video.src = "just-fascination.mp4";
const layer = xrMediaBinding.createQuadLayer(video);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLBinding")}}
