---
title: "XRProjectionLayer: ignoreDepthValues property"
short-title: ignoreDepthValues
slug: Web/API/XRProjectionLayer/ignoreDepthValues
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRProjectionLayer.ignoreDepthValues
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`ignoreDepthValues`** của giao diện {{domxref("XRProjectionLayer")}} là một giá trị boolean cho biết liệu compositor XR có đang sử dụng các giá trị depth buffer khi kết xuất layer hay không.

## Giá trị

Một giá trị boolean. `true` cho biết compositor XR không sử dụng các giá trị depth buffer; `false` cho biết nội dung của depth buffer sẽ được sử dụng khi kết xuất layer.

## Ví dụ

### Bỏ qua các giá trị độ sâu

Nếu tùy chọn `depthFormat` là `0` khi tạo projection layer, thuộc tính `ignoreDepthValues` sẽ là `true`. Xem thêm {{domxref("XRWebGLBinding.createProjectionLayer()")}}.

```js
let glProjectionLayer = xrGLBinding.createProjectionLayer({
  depthFormat: 0,
});

glProjectionLayer.ignoreDepthValues; // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLBinding.createProjectionLayer()")}}
