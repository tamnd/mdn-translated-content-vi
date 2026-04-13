---
title: "XRInputSourceEvent: thuộc tính frame"
short-title: frame
slug: Web/API/XRInputSourceEvent/frame
page-type: web-api-instance-property
browser-compat: api.XRInputSourceEvent.frame
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`frame`** của {{domxref("XRInputSourceEvent")}} chỉ định một đối tượng {{domxref("XRFrame")}} đại diện cho khung sự kiện trong đó một sự kiện đầu vào người dùng [WebXR](/en-US/docs/Web/API/WebXR_Device_API) đã xảy ra. Do đó, đây có thể là một sự kiện đã xảy ra trong quá khứ thay vì là sự kiện hiện tại hoặc sắp xảy ra.

## Giá trị

Một {{domxref("XRFrame")}} cho biết khung sự kiện tại đó sự kiện đầu vào người dùng được mô tả bởi đối tượng đã xảy ra.

## Ghi chú sử dụng

Khung sự kiện không tương ứng với khung trực quan như được cung cấp cho hàm callback render khung (xem [Rendering và callback render khung WebXR](/en-US/docs/Web/API/WebXR_Device_API/Rendering) để biết chi tiết về callback). Thay vào đó, `XRFrame` được chỉ định bởi thuộc tính `frame` là phương thức cung cấp quyền truy cập vào phương thức {{domxref("XRFrame.getPose", "getPose()")}}, mà bạn có thể sử dụng để lấy vị trí tương đối của các đối tượng trong cảnh tại thời điểm sự kiện xảy ra.

Tuy nhiên, vì khung sự kiện không phải là khung hoạt ảnh, không có tư thế người xem nào đại diện cho điểm nhìn hiện tại của người xem; kết quả của việc gọi {{domxref("XRFrame.getViewerPose", "getViewerPose()")}} sẽ là một {{domxref("XRViewerPose")}} với danh sách {{domxref("XRViewerPose.views", "views")}} rỗng.

## Ví dụ

Mã này hiển thị trình xử lý cho sự kiện {{domxref("XRSession.selectstart_event", "selectstart")}} lấy tư thế của tia mục tiêu từ khung, ánh xạ tư thế đại diện cho tia (`event.inputSource.targetRaySpace`) sang không gian tham chiếu tổng thể `myRefSpace`.

Sau đó, nếu kết quả không phải là `null`, biến đổi của tư thế tia mục tiêu được truyền vào hàm `myCheckAndHandleHit()` để xem liệu tia có đang chỉ vào bất cứ điều gì khi select được kích hoạt không.

```js
xrSession.onselectstart = (event) => {
  let targetRayPose = event.frame.getPose(
    event.inputSource.targetRaySpace,
    myRefSpace,
  );
  if (targetRayPose) {
    checkAndHandleHit(targetRayPose.transform);
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
