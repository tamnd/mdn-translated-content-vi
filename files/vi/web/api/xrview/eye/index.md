---
title: "XRView: eye property"
short-title: eye
slug: Web/API/XRView/eye
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRView.eye
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`eye`** của giao diện {{domxref("XRView")}} là một chuỗi cho biết mắt nào mà `XRView` đại diện cho góc nhìn: `left` hay `right`. Đối với các chế độ xem không đại diện cho mắt nào, chẳng hạn như chế độ xem đơn thị, giá trị của thuộc tính này là `none`.

## Giá trị

Chuỗi có thể là một trong các giá trị sau:

- `left`
  - : {{domxref("XRView")}} đại diện cho góc nhìn của mắt trái người xem.
- `right`
  - : Chế độ xem đại diện cho mắt phải người xem.
- `none`
  - : `XRView` mô tả chế độ xem đơn thị, hoặc chế độ xem không đại diện cho góc nhìn của mắt cụ thể nào.

## Ghi chú sử dụng

Mục đích chính của thuộc tính này là cho phép hiển thị đúng vùng của bất kỳ nội dung stereo đã được dựng sẵn nào cho đúng mắt. Đối với nội dung 3D được dựng động, bạn thường có thể bỏ qua thuộc tính này và dựng từng chế độ xem của người xem lần lượt.

## Ví dụ

Đoạn mã này, từ bộ dựng hình pose người xem, duyệt qua các chế độ xem của pose và dựng chúng. _Tuy nhiên_, chúng ta có các cờ mà nếu `true`, cho biết rằng một mắt cụ thể đã bị thương trong gameplay. Khi dựng mắt đó, nếu cờ là `true`, chế độ xem đó bị bỏ qua thay vì dựng hình.

```js
glLayer = xrSession.renderState.baseLayer;
gl.bindFramebuffer(gl.FRAMEBUFFER, glLayer.framebuffer);
gl.clearColor(0, 0, 0, 1.0);
gl.clearDepth(1.0);
gl.clear(gl.COLOR_BUFFER_BIT, gl.DEPTH_BUFFER_BIT);

for (const view of xrPose.views) {
  let skipView = false;

  if (view.eye === "left" && body.leftEye.injured) {
    skipView = updateInjury(body.leftEye);
  } else if (view.eye === "right" && body.rightEye.injured) {
    skipView = updateInjury(body.rightEye);
  }

  if (!skipView) {
    let viewport = glLayer.getViewport(view);
    gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);
    renderScene(gl, view);
  }
}
```

Đối với mỗi chế độ xem, giá trị của `eye` được kiểm tra và nếu là `left` hoặc `right`, chúng ta kiểm tra xem thuộc tính `body.leftEye.injured` hoặc `body.rightEye.injured` có phải `true` không; nếu vậy, chúng ta gọi hàm `updateInjury()` trên mắt đó.

`updateInjury()` trả về `true` nếu mắt vẫn còn bị thương hoặc `false` nếu mắt đã được hồi phục. Nếu kết quả là `false`, chúng ta dựng cảnh cho mắt đó. Ngược lại, chúng ta không dựng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
