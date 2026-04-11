---
title: XRFrame
slug: Web/API/XRFrame
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRFrame
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}{{SeeCompatTable}}

Đối tượng **`XRFrame`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) được truyền vào hàm callback của {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} và cung cấp quyền truy cập thông tin cần thiết để kết xuất một khung hoạt ảnh cho một {{domxref("XRSession")}} mô tả cảnh VR hoặc AR. Các sự kiện thông báo trạng thái theo dõi của các đối tượng cũng cung cấp tham chiếu `XRFrame` như một phần cấu trúc của chúng.

Ngoài việc cung cấp tham chiếu đến {{domxref("XRSession")}} mà khung này được kết xuất, phương thức {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} được cung cấp để lấy {{domxref("XRViewerPose")}} mô tả vị trí và hướng của người xem trong không gian, và {{domxref("XRFrame.getPose", "getPose()")}} có thể được dùng để tạo một {{domxref("XRPose")}} mô tả vị trí tương đối của một {{domxref("XRSpace")}} so với không gian khác.

## Thuộc tính phiên bản

- {{DOMxRef("XRFrame.session", "session")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : {{DOMxRef("XRSession")}} mà `XRFrame` này mô tả thông tin theo dõi cho tất cả các đối tượng. Thông tin về một đối tượng cụ thể có thể được lấy bằng cách gọi một trong các phương thức trên đối tượng đó.
- {{DOMxRef("XRFrame.trackedAnchors", "trackedAnchors")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một {{domxref("XRAnchorSet")}} chứa tất cả các neo vẫn còn được theo dõi trong khung.

## Phương thức phiên bản

- {{domxref("XRFrame.createAnchor()", "createAnchor()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết thành một đối tượng {{domxref("XRAnchor")}} nổi tự do.
- {{domxref("XRFrame.fillJointRadii()", "fillJointRadii()")}} {{Experimental_Inline}}
  - : Điền một {{jsxref("Float32Array")}} với bán kính cho danh sách các không gian khớp tay. Trả về `true` nếu thành công cho tất cả các không gian.
- {{domxref("XRFrame.fillPoses()", "fillPoses()")}} {{Experimental_Inline}}
  - : Điền một {{jsxref("Float32Array")}} với các ma trận tư thế, tương đối với không gian cơ sở cho trước. Trả về `true` nếu tất cả các không gian có tư thế hợp lệ.
- {{domxref("XRFrame.getDepthInformation()", "getDepthInformation()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("XRCPUDepthInformation")}} chứa thông tin độ sâu CPU cho khung.
- {{domxref("XRFrame.getHitTestResults()", "getHitTestResults()")}} {{Experimental_Inline}}
  - : Trả về một mảng các đối tượng {{domxref("XRHitTestResult")}} chứa kết quả kiểm tra va chạm cho một {{domxref("XRHitTestSource")}} cho trước.
- {{domxref("XRFrame.getHitTestResultsForTransientInput()", "getHitTestResultsForTransientInput()")}} {{Experimental_Inline}}
  - : Trả về một mảng các đối tượng {{domxref("XRTransientInputHitTestResult")}} chứa kết quả kiểm tra va chạm cho một {{domxref("XRTransientInputHitTestSource")}} cho trước.
- {{domxref("XRFrame.getJointPose()", "getJointPose()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("XRJointPose")}} cung cấp tư thế của một khớp tay (xem {{domxref("XRHand")}}) tương đối với không gian cơ sở cho trước.
- {{domxref("XRFrame.getLightEstimate()", "getLightEstimate()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("XRLightEstimate")}} chứa các giá trị ánh sáng ước tính cho một {{domxref("XRLightProbe")}}.
- {{DOMxRef("XRFrame.getPose", "getPose()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref("XRPose")}} đại diện cho quan hệ không gian giữa hai đối tượng {{domxref("XRSpace")}} được chỉ định.
- {{DOMxRef("XRFrame.getViewerPose", "getViewerPose()")}} {{Experimental_Inline}}
  - : Trả về một {{domxref("XRViewerPose")}} mô tả vị trí và hướng của người xem trong một {{domxref("XRReferenceSpace")}} cho trước.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Theo dõi không gian trong WebXR](/en-US/docs/Web/API/WebXR_Device_API/Spatial_tracking)
