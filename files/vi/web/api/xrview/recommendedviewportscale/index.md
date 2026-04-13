---
title: "XRView: recommendedViewportScale property"
short-title: recommendedViewportScale
slug: Web/API/XRView/recommendedViewportScale
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRView.recommendedViewportScale
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`recommendedViewportScale`** của giao diện {{domxref("XRView")}} là giá trị tỷ lệ viewport được khuyến nghị mà bạn có thể dùng cho {{domxref("XRView.requestViewportScale()")}} nếu tác nhân người dùng có đề xuất như vậy; [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không.

## Giá trị

Số lớn hơn 0.0 và nhỏ hơn hoặc bằng 1.0; hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu tác nhân người dùng không cung cấp tỷ lệ được khuyến nghị.

## Ví dụ

### Tỷ lệ viewport động

Tỷ lệ viewport động cho phép các ứng dụng chỉ sử dụng một tập con của {{domxref("XRWebGLLayer.framebuffer", "framebuffer")}} có sẵn. Tính năng này có thể không khả dụng trên tất cả hệ thống vì nó phụ thuộc vào hỗ trợ driver, vì vậy bạn có thể muốn đảm bảo rằng {{domxref("XRView.requestViewportScale")}} tồn tại trước khi gọi nó.

```js
for (const view of pose.views) {
  if (view.requestViewportScale) {
    view.requestViewportScale(view.recommendedViewportScale);
  }
  const viewport = glLayer.getViewport(view);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRView.requestViewportScale()")}}
