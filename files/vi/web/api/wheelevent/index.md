---
title: WheelEvent
slug: Web/API/WheelEvent
page-type: web-api-interface
browser-compat: api.WheelEvent
---

{{APIRef("Pointer Events")}}

Giao diện **`WheelEvent`** biểu diễn các sự kiện xảy ra do người dùng di chuyển bánh xe chuột hoặc thiết bị đầu vào tương tự.

> [!NOTE]
> Đây là giao diện sự kiện bánh xe tiêu chuẩn để sử dụng. Các phiên bản cũ của trình duyệt đã triển khai các giao diện `MouseWheelEvent` và {{DOMxRef("MouseScrollEvent")}} không chuẩn và không tương thích giữa các trình duyệt. Sử dụng giao diện này và tránh các giao diện không chuẩn.

Đừng nhầm lẫn sự kiện `wheel` với sự kiện {{domxref("Element/scroll_event", "scroll")}}:

- Một sự kiện `wheel` không nhất thiết kích hoạt sự kiện `scroll`. Ví dụ, phần tử có thể hoàn toàn không thể cuộn. Các hành động phóng to thu nhỏ bằng bánh xe hoặc bàn di chuột cũng kích hoạt sự kiện `wheel`.
- Một sự kiện `scroll` không nhất thiết được kích hoạt bởi sự kiện `wheel`. Các phần tử cũng có thể được cuộn bằng bàn phím, kéo thanh cuộn, hoặc sử dụng JavaScript.
- Ngay cả khi sự kiện `wheel` kích hoạt cuộn, các giá trị `delta*` trong sự kiện `wheel` không nhất thiết phản ánh hướng cuộn của nội dung.

{{InheritanceDiagram}}

## Constructor

- {{DOMxRef("WheelEvent.WheelEvent", "WheelEvent()")}}
  - : Tạo một đối tượng `WheelEvent`.

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ tổ tiên của nó, {{DOMxRef("MouseEvent")}}, {{DOMxRef("UIEvent")}}, và {{DOMxRef("Event")}}._

- {{DOMxRef("WheelEvent.deltaX")}} {{ReadOnlyInline}}
  - : Trả về một `double` biểu diễn lượng cuộn ngang.
- {{DOMxRef("WheelEvent.deltaY")}} {{ReadOnlyInline}}
  - : Trả về một `double` biểu diễn lượng cuộn dọc.
- {{DOMxRef("WheelEvent.deltaZ")}} {{ReadOnlyInline}}
  - : Trả về một `double` biểu diễn lượng cuộn cho trục z.
- {{DOMxRef("WheelEvent.deltaMode")}} {{ReadOnlyInline}}
  - : Trả về một `unsigned long` biểu diễn đơn vị của các giá trị `delta*` lượng cuộn.
- {{DOMxRef("WheelEvent.wheelDelta")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một số nguyên (32-bit) biểu diễn khoảng cách tính bằng pixel.
- {{DOMxRef("WheelEvent.wheelDeltaX")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một số nguyên biểu diễn lượng cuộn ngang.
- {{DOMxRef("WheelEvent.wheelDeltaY")}} {{ReadOnlyInline}} {{Deprecated_Inline}} {{Non-standard_Inline}}
  - : Trả về một số nguyên biểu diễn lượng cuộn dọc.

> [!NOTE]
> [Sự kiện mousewheel của Element](/en-US/docs/Web/API/Element/mousewheel_event) có tài liệu bổ sung về các thuộc tính đã lỗi thời `wheelDelta`, `wheelDeltaX`, `wheelDeltaY`.

## Phương thức instance

_Giao diện này không định nghĩa bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ tổ tiên của nó, {{DOMxRef("MouseEvent")}}, {{DOMxRef("UIEvent")}}, và {{DOMxRef("Event")}}._

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Element/wheel_event", "wheel")}}
- Các giao diện đã được thay thế bởi giao diện này:
  - Đối tượng sự kiện bánh xe chuột kế thừa của Gecko: {{DOMxRef("MouseScrollEvent")}}
