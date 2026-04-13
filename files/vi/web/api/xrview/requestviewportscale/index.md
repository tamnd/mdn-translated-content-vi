---
title: "XRView: requestViewportScale() method"
short-title: requestViewportScale()
slug: Web/API/XRView/requestViewportScale
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRView.requestViewportScale
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestViewportScale()`** của giao diện {{domxref("XRView")}} yêu cầu tác nhân người dùng đặt tỷ lệ viewport được yêu cầu cho viewport này theo giá trị đã cho. Điều này được dùng cho tỷ lệ viewport động, cho phép dựng hình trên một tập con của viewport WebXR bằng hệ số tỷ lệ có thể thay đổi mỗi khung hình hoạt ảnh.

## Cú pháp

```js-nolint
requestViewportScale(scale)
```

### Tham số

- `scale`
  - : Số lớn hơn 0.0 và nhỏ hơn hoặc bằng 1.0 đại diện cho hệ số tỷ lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Tỷ lệ viewport động

Tỷ lệ viewport động cho phép các ứng dụng chỉ sử dụng một tập con của {{domxref("XRWebGLLayer.framebuffer", "framebuffer")}} có sẵn. Tính năng này có thể không khả dụng trên tất cả hệ thống vì nó phụ thuộc vào hỗ trợ driver, vì vậy bạn có thể muốn đảm bảo rằng `requestViewportScale()` tồn tại trước khi gọi nó.

Tham số `scale` có thể là số lớn hơn 0.0 và nhỏ hơn hoặc bằng 1.0.

Ngoài ra, bạn có thể sử dụng thuộc tính {{domxref("XRView.recommendedViewportScale")}} chứa giá trị được khuyến nghị của tác nhân người dùng dựa trên các phép suy luận nội bộ. Nếu tác nhân người dùng không cung cấp tỷ lệ viewport được khuyến nghị, giá trị của nó là `null` và lệnh gọi `requestViewportScale()` bị bỏ qua.

## Ví dụ

Ví dụ sau đây cho thấy cách yêu cầu và áp dụng tỷ lệ viewport mới. Lệnh gọi {{domxref("XRWebGLLayer.getViewport()")}} áp dụng thay đổi và trả về viewport đã cập nhật.

```js
for (const view of pose.views) {
  if (view.requestViewportScale) {
    view.requestViewportScale(0.8);
    // or use view.requestViewportScale(view.recommendedViewportScale);
  }
  const viewport = glLayer.getViewport(view);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRView.recommendedViewportScale")}}
