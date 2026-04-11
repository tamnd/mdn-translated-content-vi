---
title: "Navigator: thuộc tính xr"
short-title: xr
slug: Web/API/Navigator/xr
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.xr
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Thuộc tính **`xr`** chỉ đọc
được cung cấp bởi giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("XRSystem")}}
có thể được sử dụng để truy cập [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API).

## Giá trị

Đối tượng {{domxref("XRSystem")}} được sử dụng để giao tiếp với [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) trong hiện tại
bối cảnh. Điều này có thể được sử dụng để trình bày hình ảnh thực tế ảo và/hoặc tăng cường cho
người dùng.

## Ví dụ

Mỗi {{domxref("Window")}} có phiên bản {{domxref("Navigator")}} riêng, có thể
được truy cập dưới dạng {{domxref("Window.navigator","window.navigator")}} hoặc dưới dạng
{{domxref("Window.navigator", "navigator")}}. Đồng thời, một cái mới
Phiên bản {{domxref("XRSystem")}} cũng được tạo và đính kèm vào
phiên bản `navigator` là `navigator.xr`. Nếu
thuộc tính `xr` tồn tại, bạn có thể sử dụng thuộc tính đó để truy cập [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API).

Để xác định xem WebXR có khả dụng hay không, bạn có thể thực hiện như sau:

```js
if ("xr" in window.navigator) {
  /* WebXR can be used! */
} else {
  /* WebXR isn't available */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [WebGL API](/en-US/docs/Web/API/WebGL_API): Tăng tốc 2D và 3D
  đồ họa cho web
- [Canvas API](/en-US/docs/Web/API/Canvas_API): API đồ họa 2D
