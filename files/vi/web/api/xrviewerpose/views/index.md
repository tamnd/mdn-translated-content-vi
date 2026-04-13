---
title: "XRViewerPose: thuộc tính views"
short-title: views
slug: Web/API/XRViewerPose/views
page-type: web-api-instance-property
browser-compat: api.XRViewerPose.views
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`views`** của {{domxref("XRViewerPose")}} trả về một mảng chứa mọi {{domxref("XRView")}} cần được kết xuất để hoàn toàn biểu diễn cảnh từ điểm nhìn được xác định bởi tư thế người xem. Đối với các thiết bị đơn mắt, mảng này chứa một góc nhìn duy nhất.

> [!WARNING]
> Không có đảm bảo rằng số lượng góc nhìn sẽ không thay đổi trong suốt vòng đời của {{domxref("XRSession")}}. Đối với mỗi khung hình, bạn nên luôn sử dụng độ dài hiện tại của mảng này thay vì lưu bộ nhớ đệm giá trị.

Các góc nhìn stereo yêu cầu hai góc nhìn để kết xuất đúng, với góc nhìn của mắt trái có {{domxref("XRView.eye", "eye")}} được đặt thành chuỗi `left` và góc nhìn của mắt phải có giá trị `right`.

## Giá trị

Một mảng các đối tượng {{domxref("XRView")}}, một cho mỗi góc nhìn có sẵn như một phần của cảnh cho tư thế người xem hiện tại. Độ dài của mảng này có thể thay đổi trong suốt vòng đời của {{domxref("XRSession")}} (ví dụ, nếu người xem bật hoặc tắt chế độ stereo trên thiết bị đầu ra XR của họ).

## Ví dụ

Xem ví dụ mã tại [`XRViewerPose`](/en-US/docs/Web/API/XRViewerPose#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Chuyển động, hướng và di chuyển](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion)
