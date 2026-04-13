---
title: "XRCompositionLayer: needsRedraw property"
short-title: needsRedraw
slug: Web/API/XRCompositionLayer/needsRedraw
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRCompositionLayer.needsRedraw
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`needsRedraw`** của giao diện {{domxref("XRCompositionLayer")}} là một giá trị boolean báo hiệu rằng layer cần được kết xuất lại trong frame tiếp theo.

Nhu cầu kết xuất lại có thể xảy ra khi các tài nguyên bên dưới của một layer bị mất do texture có thể đã bị compositor giải phóng âm thầm. Điều này có thể xảy ra khi thiết bị vào chế độ ngủ hoặc khi trình duyệt chuyển ngữ cảnh (đến một hộp thoại hệ điều hành hoặc tương tự) và sau đó quay lại.

Kết xuất lại không phải là vấn đề đối với các layer được cập nhật mỗi frame. Tuy nhiên, đối với các layer được cập nhật không thường xuyên, hoặc các layer tĩnh (nơi bạn chỉ có thể vẽ một lần sau khi tạo hoặc sau sự kiện `redraw`), nội dung của layer có thể bị mất và cần được vẽ lại. Nếu tài nguyên của layer bị mất, thuộc tính `needsRedraw` sẽ là `true` và sự kiện `redraw` được kích hoạt trên layer.

## Giá trị

Một giá trị boolean. `true` cho biết cần kết xuất lại trong frame tiếp theo, `false` cho biết không cần kết xuất lại.

## Ví dụ

### Kết xuất lại các layer

Sử dụng thuộc tính `needsRedraw` để kiểm tra xem một layer có cần được vẽ lại hay không và sau đó vẽ lại nó.

```js
function onXRFrame(time, frame) {
  // …

  if (quadLayer.needsRedraw) {
    // redraw the layer
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XREquirectLayer")}}: sự kiện {{domxref("XREquirectLayer.redraw_event", "redraw")}}
- {{domxref("XRCubeLayer")}}: sự kiện {{domxref("XRCubeLayer.redraw_event", "redraw")}}
- {{domxref("XRCylinderLayer")}}: sự kiện {{domxref("XRCylinderLayer.redraw_event", "redraw")}}
- {{domxref("XRQuadLayer")}}: sự kiện {{domxref("XRQuadLayer.redraw_event", "redraw")}}
