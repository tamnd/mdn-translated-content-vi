---
title: "XRWebGLLayer: fixedFoveation property"
short-title: fixedFoveation
slug: Web/API/XRWebGLLayer/fixedFoveation
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.fixedFoveation
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính **`fixedFoveation`** của giao diện {{domxref("XRWebGLLayer")}} là một số cho biết mức độ foveation được sử dụng bởi XR compositor. Fixed Foveated Rendering (FFR) hiển thị các cạnh của texture mắt ở độ phân giải thấp hơn so với trung tâm và giảm tải GPU.

Nó hữu ích nhất cho các texture có độ tương phản thấp, chẳng hạn như hình nền nhưng ít hữu ích hơn cho các texture có độ tương phản cao như văn bản hoặc hình ảnh chi tiết. Các tác giả có thể điều chỉnh mức độ theo từng frame để đạt được sự cân bằng tốt nhất giữa hiệu suất và chất lượng hình ảnh.

## Giá trị

Một số từ 0 đến 1.

- Mức độ foveation tối thiểu được biểu thị bởi 0 (độ phân giải đầy đủ).
- Mức độ foveation tối đa được biểu thị bởi 1 (các cạnh hiển thị ở độ phân giải thấp hơn).

Tùy thuộc vào user agent cách diễn giải các số trong phạm vi này. Khi thay đổi mức foveation, hiệu ứng sẽ hiển thị trong {{domxref("XRFrame")}} tiếp theo.

Lưu ý rằng một số user agent có thể triển khai một số mức foveation nhất định, vì vậy bạn có thể cần điều chỉnh mức foveation theo các bước lớn để thấy hiệu ứng. Các mức ví dụ:

- `0`: không foveation
- `1/3`: foveation thấp
- `2/3`: foveation vừa
- `1.0`: foveation tối đa

Một số thiết bị không hỗ trợ foveated rendering. Trong trường hợp đó, `fixedFoveation` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) và việc đặt nó sẽ không làm gì.

## Ví dụ

### Đặt động mức Fixed Foveated Rendering

Thuộc tính `fixedFoveation` cho phép bạn đặt mức foveation trong thời gian chạy và cho mỗi frame. Để đặt mức foveation tối đa cho một {{domxref("XRWebGLLayer")}} nhất định, sử dụng giá trị `1`.

```js
let glLayer = xrSession.renderState.baseLayer;
glLayer.fixedFoveation = 1; // maximum foveation
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Foveated rendering](https://en.wikipedia.org/wiki/Foveated_rendering)
