---
title: "XRAnchor: thuộc tính anchorSpace"
short-title: anchorSpace
slug: Web/API/XRAnchor/anchorSpace
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRAnchor.anchorSpace
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`anchorSpace`** của giao diện {{domxref("XRAnchor")}} trả về một đối tượng {{domxref("XRSpace")}} để định vị anchor tương đối với các đối tượng `XRSpace` khác. Nó có thể được truyền vào {{domxref("XRFrame.getPose()")}} sau đó.

## Giá trị

Một đối tượng {{domxref("XRSpace")}}.

## Ví dụ

### Cập nhật các anchor

```js
for (const anchor of frame.trackedAnchors) {
  const pose = frame.getPose(anchor.anchorSpace, referenceSpace);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
