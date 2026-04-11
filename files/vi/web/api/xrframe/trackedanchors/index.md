---
title: "XRFrame: thuộc tính trackedAnchors"
short-title: trackedAnchors
slug: Web/API/XRFrame/trackedAnchors
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRFrame.trackedAnchors
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`trackedAnchor`** của giao diện {{domxref("XRFrame")}} trả về một đối tượng {{domxref("XRAnchorSet")}} chứa tất cả các neo vẫn còn được theo dõi trong khung.

## Giá trị

Một đối tượng {{domxref("XRAnchorSet")}}.

## Ví dụ

### Cập nhật neo

```js
for (const anchor of frame.trackedAnchors) {
  const pose = frame.getPose(anchor.anchorSpace, referenceSpace);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
