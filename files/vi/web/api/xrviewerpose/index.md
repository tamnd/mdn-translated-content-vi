---
title: XRViewerPose
slug: Web/API/XRViewerPose
page-type: web-api-interface
browser-compat: api.XRViewerPose
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Giao diện **`XRViewerPose`** của WebXR Device API đại diện cho tư thế (vị trí và hướng) của điểm nhìn của người xem đối với cảnh. Mỗi `XRViewerPose` có thể có nhiều góc nhìn để đại diện, ví dụ như khoảng cách nhỏ giữa mắt trái và mắt phải.

Góc nhìn này có thể đại diện cho bất kỳ điều gì từ điểm nhìn của tai nghe XR của người dùng đến góc nhìn được biểu diễn bởi chuyển động của avatar trong trò chơi bằng chuột và bàn phím hiển thị trên màn hình, đến một camera ảo ghi lại cảnh cho người xem.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Ngoài các thuộc tính được kế thừa từ {{domxref("XRPose")}}, `XRViewerPose` bao gồm những thuộc tính sau:_

- {{domxref("XRViewerPose.views", "views")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("XRView")}}, một cho mỗi điểm nhìn lên cảnh cần thiết để hiển thị cảnh cho người dùng. Một tai nghe thông thường cung cấp tư thế người xem với hai góc nhìn có thuộc tính {{domxref("XRView.eye", "eye")}} là `left` hoặc `right`, cho biết mắt nào mà góc nhìn đó đại diện. Kết hợp với nhau, các góc nhìn này có thể tái tạo hiệu ứng 3D khi hiển thị trên thiết bị XR.

## Ghi chú sử dụng

Đối tượng `XRViewerPose` được dùng để mô tả trạng thái của người xem trong cảnh WebXR khi được thiết bị XR theo dõi. Người xem có thể là hình đại diện ảo của người dùng, hoặc có thể đại diện cho một thiết bị hay giao diện khác có thể đóng vai trò là nguồn của vị trí và hướng tạo nên góc nhìn lên cảnh. Ví dụ, mỗi người chơi trong một trò chơi nhập vai nhiều người chơi có thể có một phiên bản `XRViewerPose` để cung cấp cách tính toán những gì họ có thể thấy.

`XRViewerPose` luôn được lấy và tham chiếu tương đối với một {{domxref("XRReferenceSpace")}} hiện có. Điều này đảm bảo các vị trí và hướng được báo cáo bằng hệ tọa độ tương đối dự kiến.

Để kết xuất một cảnh sử dụng `XRViewerPose` đại diện cho đầu người dùng, cần duyệt qua các góc nhìn trong mảng {{domxref("XRViewerPose.views", "views")}}, kết xuất chúng lần lượt. Bằng cách gọi {{domxref("WebGLRenderingContext.viewport", "viewport()")}} trên ngữ cảnh WebGL, chỉ định `XRView` làm đầu vào, bạn có thể lấy viewport để dùng khi kết xuất nhằm vẽ khung hình cho mắt đó vào đúng phần của bề mặt vẽ.

Ngoài ra, khi kết xuất cảnh cho khán giả hoặc người chơi khác trong trò chơi nhiều người, {{domxref("XRPose.transform", "transform")}} của `XRViewerPose` có thể được dùng để xác định cả vị trí và hướng nhìn của người chơi khác trong trò chơi, để họ có thể được vẽ ở đúng nơi với đúng hướng.

Tư thế người xem cho khung hình hoạt động được đại diện bởi {{domxref("XRFrame")}} có thể được lấy bằng cách gọi phương thức {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} của khung, chỉ định không gian tham chiếu mà vị trí gốc nên được tính. `XRViewerPose` trả về cho bạn biết người xem đang ở đâu và họ đang nhìn theo hướng nào tại thời điểm khung hình đó diễn ra.

## Ví dụ

Trong ví dụ này, là một phần của mã để kết xuất {{domxref("XRFrame")}}, `getViewerPose()` được gọi để lấy `XRViewerPose` sử dụng cùng không gian tham chiếu mà mã đang dùng làm không gian tham chiếu cơ sở. Nếu tư thế hợp lệ được trả về, khung hình được kết xuất bằng cách xóa bộ đệm phụ rồi kết xuất từng góc nhìn trong tư thế, thường là các góc nhìn cho mắt trái và mắt phải.

```js
const pose = frame.getViewerPose(xrReferenceSpace);

if (pose) {
  const glLayer = xrSession.renderState.baseLayer;

  gl.bindFrameBuffer(gl.FRAMEBUFFER, glLayer.framebuffer);
  gl.clearColor(0, 0, 0, 1);
  gl.clearDepth(1);
  gl.clear(gl.COLOR_BUFFER_BIT, gl.DEPTH_BUFFER_BIT);

  for (const view of pose.views) {
    const viewport = glLayer.getViewport(view);
    gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

    /* kết xuất cảnh cho mắt view.eye */
  }
}
```

Truyền từng `view` vào {{domxref("XRWebGLLayer.getViewport", "getViewport()")}} trả về viewport WebGL cần áp dụng để đầu ra kết xuất được định vị chính xác trong framebuffer để kết xuất tới mắt tương ứng trên thiết bị đầu ra.

Mã này được lấy từ [Vẽ một khung hình](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion#drawing_a_frame) trong ví dụ WebXR "Chuyển động và di chuyển" của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Chuyển động, hướng và di chuyển](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion)
- {{domxref("XRPose")}} và {{domxref("XRView")}}
