---
title: Pointer events
slug: Web/API/Pointer_events
page-type: web-api-overview
browser-compat: api.PointerEvent
spec-urls: https://w3c.github.io/pointerevents/
---

{{DefaultAPISidebar("Pointer Events")}}

Hầu hết nội dung web ngày nay giả định thiết bị trỏ của người dùng là chuột. Tuy nhiên, vì nhiều thiết bị hỗ trợ các loại thiết bị trỏ khác như bút/bút cảm ứng và màn hình cảm ứng, cần thiết phải mở rộng các mô hình sự kiện trỏ hiện có. **Pointer events** giải quyết nhu cầu đó.

Sự kiện con trỏ là các sự kiện DOM được kích hoạt cho thiết bị trỏ. Chúng được thiết kế để tạo ra mô hình xử lý sự kiện đơn nhất cho chuột, bút/bút cảm ứng và cảm ứng đơn. Con trỏ là bất kỳ điểm tiếp xúc nào trên màn hình được tạo ra bởi thiết bị trỏ. Có thể trỏ là thiết bị chỉ điểm như chuột, bút/bút cảm ứng hoặc điểm chạm trên màn hình cảm ứng.

## Khái niệm và cách sử dụng

API Pointer Events là một siêu tập của Mouse Events, nghĩa là code chỉ xử lý Mouse Events cũng sẽ hoạt động đúng với Pointer Events. Ngoài ra, Pointer Events cung cấp thêm thông tin cho các loại thiết bị trỏ khác.

Các sự kiện con trỏ rất giống với các sự kiện chuột, nhưng có thêm các thuộc tính như `pointerId`, `pointerType`, `pressure`, `tiltX`, `tiltY`, `width` và `height`.

### Giao diện `PointerEvent`

{{domxref("PointerEvent")}} là giao diện sự kiện cơ bản cho tất cả sự kiện con trỏ.

## Sự kiện

- {{domxref("Element/pointerover_event", "pointerover")}}
  - : Kích hoạt khi con trỏ đi vào vùng hit test của phần tử.
- {{domxref("Element/pointerenter_event", "pointerenter")}}
  - : Kích hoạt khi con trỏ đi vào vùng hit test của phần tử hoặc một trong các phần tử con.
- {{domxref("Element/pointerdown_event", "pointerdown")}}
  - : Kích hoạt khi con trỏ trở thành _active_.
- {{domxref("Element/pointermove_event", "pointermove")}}
  - : Kích hoạt khi con trỏ thay đổi tọa độ.
- {{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}
  - : Kích hoạt khi bất kỳ thuộc tính con trỏ nào thay đổi.
- {{domxref("Element/pointerup_event", "pointerup")}}
  - : Kích hoạt khi con trỏ không còn _active_.
- {{domxref("Element/pointercancel_event", "pointercancel")}}
  - : Kích hoạt khi trình duyệt xác định rằng sẽ không có nhiều sự kiện con trỏ hơn.
- {{domxref("Element/pointerout_event", "pointerout")}}
  - : Kích hoạt khi con trỏ rời khỏi vùng hit test của phần tử.
- {{domxref("Element/pointerleave_event", "pointerleave")}}
  - : Kích hoạt khi con trỏ rời khỏi vùng hit test của phần tử.
- {{domxref("Element/gotpointercapture_event", "gotpointercapture")}}
  - : Kích hoạt khi phần tử nhận chụp con trỏ.
- {{domxref("Element/lostpointercapture_event", "lostpointercapture")}}
  - : Kích hoạt khi chụp con trỏ được giải phóng.

## Hướng dẫn

- [Sử dụng pointer events](/en-US/docs/Web/API/Pointer_events/Using_Pointer_Events)
- [Tương tác đa chạm](/en-US/docs/Web/API/Pointer_events/Multi-touch_interaction)
- [Cử chỉ kẹp zoom](/en-US/docs/Web/API/Pointer_events/Pinch_zoom_gestures)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Touch_events","Touch Events")}}
- {{domxref("GestureEvent")}}
