---
title: "XRSession: thuộc tính inputSources"
short-title: inputSources
slug: Web/API/XRSession/inputSources
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.inputSources
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`inputSources`** của giao diện {{DOMxRef("XRSession")}} trả về một đối tượng {{domxref("XRInputSourceArray")}} liệt kê tất cả các bộ điều khiển và thiết bị đầu vào được liên kết rõ ràng với thiết bị XR và hiện đang khả dụng. Các bộ điều khiển này có thể bao gồm bộ điều khiển cầm tay, găng tay được trang bị XR, bàn tay được theo dõi quang học và các phương thức đầu vào dựa trên ánh nhìn. Bàn phím, tay cầm chơi game và chuột _không_ được coi là nguồn đầu vào WebXR.

> [!NOTE]
> Bộ điều khiển tay cầm chơi game truyền thống được hỗ trợ bằng [Gamepad API](/en-US/docs/Web/API/Gamepad_API).

## Giá trị

Một đối tượng {{domxref("XRInputSourceArray")}} liệt kê tất cả các bộ điều khiển đầu vào hiện đang được kết nối được liên kết cụ thể với thiết bị XR đang sử dụng. Đối tượng được trả về là **trực tiếp**; khi các thiết bị được kết nối và ngắt kết nối khỏi hệ thống của người dùng, nội dung của danh sách được cập nhật để phản ánh các thay đổi.

## Ghi chú sử dụng

Bạn có thể thêm một trình xử lý cho sự kiện `XRSession` {{domxref("XRSession.inputsourceschange_event", "inputsourceschange")}} để được thông báo khi nội dung danh sách thiết bị được kết nối của phiên thay đổi. Sau đó, bạn có thể lấy giá trị của `inputSources` để kiểm tra danh sách, hoặc bạn có thể tham chiếu đến danh sách mà bạn đã lưu trước đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("XRInputSource")}}
- Sự kiện {{DOMxRef("XRSession.inputsourceschange_event", "inputsourceschange")}}
- [Gamepad API](/en-US/docs/Web/API/Gamepad_API)
