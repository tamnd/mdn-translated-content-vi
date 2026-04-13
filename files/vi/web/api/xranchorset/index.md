---
title: XRAnchorSet
slug: Web/API/XRAnchorSet
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRAnchorSet
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRAnchorSet`** hiển thị một tập hợp các anchor. Các phiên bản của nó được trả về bởi {{domxref("XRFrame.trackedAnchors")}} và là các [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis).

## Thuộc tính phiên bản

Xem {{jsxref("Set")}} để biết chi tiết.

## Phương thức phiên bản

Xem {{jsxref("Set")}} để biết chi tiết.

## Ví dụ

### Xử lý mất theo dõi anchor

```js
const trackedAnchors = frame.trackedAnchors;

for (const anchor of previousFrameAnchors) {
  if (!trackedAnchors.has(anchor)) {
    // Handle anchor tracking loss
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRAnchor")}}
- {{domxref("XRFrame.trackedAnchors")}}
