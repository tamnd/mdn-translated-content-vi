---
title: XRAnchor
slug: Web/API/XRAnchor
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRAnchor
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Giao diện **`XRAnchor`** tạo ra các anchor (điểm neo) giúp theo dõi tư thế cố định so với thế giới thực. Với các anchor, bạn có thể chỉ định các tư thế trong thế giới cần được cập nhật để phản ánh chính xác sự hiểu biết đang phát triển về thế giới, sao cho các tư thế vẫn được căn chỉnh với cùng một vị trí trong thế giới vật lý. Điều này giúp tạo ra ảo giác rằng các đối tượng được đặt thực sự hiện diện trong môi trường của người dùng.

## Thuộc tính phiên bản

- {{domxref("XRAnchor.anchorSpace")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("XRSpace")}} để định vị anchor tương đối với các đối tượng `XRSpace` khác.

## Phương thức phiên bản

- {{domxref("XRAnchor.delete()")}} {{Experimental_Inline}}
  - : Xóa anchor.

## Ví dụ

### Yêu cầu một phiên có bật anchor

```js
navigator.xr.requestSession("immersive-ar", {
  requireFeatures: ["anchors"],
});
```

### Thêm anchor

Bạn có thể sử dụng {{domxref("XRFrame.createAnchor()")}} để tạo một anchor.

```js
frame.createAnchor(anchorPose, referenceSpace).then(
  (anchor) => {
    // Do stuff with the anchor (assign objects that will be relative to this anchor)
  },
  (error) => {
    console.error(`Could not create anchor: ${error}`);
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRAnchorSet")}}
- {{domxref("XRFrame.createAnchor()")}}
- {{domxref("XRFrame.trackedAnchors")}}
- {{domxref("XRHitTestResult.createAnchor()")}}
