---
title: XRReferenceSpaceEvent
slug: Web/API/XRReferenceSpaceEvent
page-type: web-api-interface
browser-compat: api.XRReferenceSpaceEvent
---

{{APIRef("WebXR Device API")}}{{SecureContext_header}}

Giao diện **`XRReferenceSpaceEvent`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) đại diện cho một sự kiện được gửi đến một {{domxref("XRReferenceSpace")}}. Hiện tại, loại sự kiện duy nhất sử dụng loại này là sự kiện {{domxref("XRReferenceSpace.reset_event", "reset")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRReferenceSpaceEvent.XRReferenceSpaceEvent", "XRReferenceSpaceEvent()")}}
  - : Trả về một `XRReferenceSpaceEvent` mới với loại và cấu hình được chỉ định.

## Thuộc tính phiên bản

_Ngoài việc kế thừa các thuộc tính có sẵn trên giao diện cha {{domxref("Event")}}, các đối tượng `XRReferenceSpaceEvent` bao gồm các thuộc tính sau:_

- {{domxref("XRReferenceSpaceEvent.referenceSpace", "referenceSpace")}} {{ReadOnlyInline}}
  - : Một {{domxref("XRReferenceSpace")}} chỉ ra không gian tham chiếu đã tạo ra sự kiện.
- {{domxref("XRReferenceSpaceEvent.transform", "transform")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("XRRigidTransform")}} chỉ ra vị trí và hướng của gốc gốc gốc gốc của `referenceSpace` được chỉ định sau khi các thay đổi mà sự kiện đại diện được áp dụng, được xác định tương đối so với hệ tọa độ trước sự kiện.

## Phương thức phiên bản

_Mặc dù `XRReferenceSpaceEvent` không định nghĩa bất kỳ phương thức nào, nó kế thừa các phương thức của giao diện cha {{domxref("Event")}}._

## Loại sự kiện

- {{domxref("XRReferenceSpace.reset_event", "reset")}}
  - : Sự kiện `reset` được gửi đến một không gian tham chiếu khi gốc gốc của nó thay đổi do sự gián đoạn, hiệu chỉnh lại, hoặc đặt lại thiết bị. Đây là cơ hội để ứng dụng của bạn cập nhật bất kỳ biến đổi, thông tin vị trí/hướng đã lưu trữ, hoặc xóa các giá trị đã lưu trong bộ nhớ cache dựa trên gốc của không gian tham chiếu để bạn có thể tính toán lại khi cần.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
