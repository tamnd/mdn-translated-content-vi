---
title: "XRView: transform property"
short-title: transform
slug: Web/API/XRView/transform
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRView.transform
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`transform`** của giao diện {{domxref("XRView")}} là đối tượng {{domxref("XRRigidTransform")}} cung cấp vị trí và hướng của góc nhìn so với {{domxref("XRReferenceSpace")}} được chỉ định khi phương thức {{domxref("XRFrame.getViewerPose()")}} được gọi để lấy đối tượng chế độ xem.

Với `transform`, bạn có thể định vị chế độ xem như một máy ảnh trong cảnh 3D. Nếu bạn cần ma trận view truyền thống hơn, bạn có thể lấy bằng cách dùng `view.transform.inverse.matrix`; điều này lấy {{domxref("XRRigidTransform.matrix", "matrix")}} cơ bản của {{domxref("XRRigidTransform.inverse", "inverse")}} của phép biến đổi.

## Giá trị

Đối tượng {{domxref("XRRigidTransform")}} chỉ định vị trí và hướng của góc nhìn được đại diện bởi `XRView`.

## Ví dụ

Đối với mỗi chế độ xem tạo nên cảnh được trình bày, `transform` của chế độ xem đại diện cho vị trí và hướng của người xem hoặc máy ảnh so với gốc của không gian tham chiếu. Sau đó bạn có thể sử dụng nghịch đảo của ma trận này để biến đổi các đối tượng trong cảnh để điều chỉnh vị trí và hướng của chúng nhằm mô phỏng chuyển động của người xem trong không gian.

Trong ví dụ này, chúng ta thấy đề cương của một đoạn mã được sử dụng khi dựng hình {{domxref("XRFrame")}}, sử dụng phép biến đổi chế độ xem để định vị các đối tượng trong thế giới trong quá trình dựng hình.

```js
const modelViewMatrix = mat4.create();
const normalMatrix = mat4.create();

for (const view of pose.views) {
  const viewport = glLayer.getViewport(view);
  gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

  for (const obj of world.objects) {
    mat4.multiply(modelViewMatrix, view.transform.inverse.matrix, obj.matrix);
    mat4.invert(normalMatrix, modelViewMatrix);
    mat4.transpose(normalMatrix, normalMatrix);

    obj.render(modelViewMatrix, normalMatrix);
  }
}
```

Hai ma trận được tạo bên ngoài vòng lặp dựng hình; điều này tránh việc phân bổ và giải phóng ma trận lặp đi lặp lại, và thường giảm chi phí bằng cách tái sử dụng cùng ma trận cho mỗi đối tượng được dựng.

Sau đó chúng ta duyệt qua từng {{domxref("XRView")}} tìm thấy trong danh sách {{domxref("XRViewerPose.views", "views")}} của {{domxref("XRViewerPose")}}. Thường sẽ có hai: một cho mắt trái và một cho mắt phải, nhưng có thể chỉ có một nếu ở chế độ đơn thị.

Đối với mỗi chế độ xem, chúng ta lấy viewport của nó và truyền nó vào WebGL bằng {{domxref("WebGLRenderingContext.viewport", "gl.viewport()")}}. Đối với mắt trái, đây sẽ là nửa trái của canvas, trong khi mắt phải sẽ sử dụng nửa phải.

Sau đó chúng ta duyệt qua từng đối tượng tạo nên cảnh. Ma trận model view của mỗi đối tượng được tính bằng cách nhân ma trận của chính nó mô tả vị trí và hướng của đối tượng với các điều chỉnh vị trí và hướng bổ sung cần thiết để khớp với chuyển động của máy ảnh. Để chuyển đổi ma trận biến đổi "tập trung vào máy ảnh" thành biến đổi "tập trung vào đối tượng", chúng ta sử dụng nghịch đảo của phép biến đổi. Ma trận model view kết quả sẽ áp dụng tất cả các biến đổi cần thiết để di chuyển và xoay đối tượng dựa trên vị trí tương đối của đối tượng và máy ảnh.

Sau đó chúng ta tính toán các pháp tuyến cho ma trận model view bằng cách đảo ngược nó, sau đó chuyển vị nó.

Cuối cùng, chúng ta gọi hàm `render()` của đối tượng, truyền vào `modelViewMatrix` và `normalMatrix` để bộ dựng hình có thể đặt và chiếu sáng đối tượng đúng cách.

> [!NOTE]
> Ví dụ này được lấy từ ví dụ lớn hơn...
> **<<<--- finish and add link --->>>**

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
