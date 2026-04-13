---
title: PointerEvent
slug: Web/API/PointerEvent
page-type: web-api-interface
browser-compat: api.PointerEvent
---

{{ APIRef("Pointer Events") }}

Giao diện **`PointerEvent`** đại diện cho trạng thái của một sự kiện DOM do một con trỏ tạo ra, chẳng hạn như hình học của điểm tiếp xúc, loại thiết bị đã tạo ra sự kiện, mức áp lực được tác động lên bề mặt tiếp xúc, v.v.

Một _pointer_ là cách biểu diễn thiết bị nhập liệu độc lập với phần cứng (như chuột, bút cảm ứng hoặc điểm tiếp xúc trên bề mặt hỗ trợ chạm). Con trỏ có thể nhắm tới một tọa độ cụ thể (hoặc một tập tọa độ) trên bề mặt tiếp xúc như màn hình.

_Hit test_ của con trỏ là quá trình trình duyệt dùng để xác định phần tử đích cho một sự kiện con trỏ. Thông thường, điều này được xác định bằng cách xét vị trí của con trỏ và cả bố cục trực quan của các phần tử trong tài liệu trên màn hình.

{{InheritanceDiagram}}

## Constructors

- {{domxref("PointerEvent.PointerEvent", "PointerEvent()")}}
  - : Tạo một `PointerEvent` tổng hợp, và không đáng tin cậy.

## Thuộc tính instance

_Giao diện này kế thừa các thuộc tính từ {{domxref("MouseEvent")}} và {{domxref("Event")}}._

- {{domxref('PointerEvent.altitudeAngle')}} {{ReadOnlyInline}}
  - : Đại diện cho góc giữa trục của một bộ chuyển đổi (một con trỏ hoặc bút stylus) và mặt phẳng X-Y của màn hình thiết bị.
- {{domxref('PointerEvent.azimuthAngle')}} {{ReadOnlyInline}}
  - : Đại diện cho góc giữa mặt phẳng Y-Z và mặt phẳng chứa cả trục của bộ chuyển đổi (một con trỏ hoặc bút stylus) và trục Y.
- {{domxref('PointerEvent.persistentDeviceId')}} {{ReadOnlyInline}}
  - : Một định danh duy nhất cho thiết bị trỏ đã tạo ra `PointerEvent`.
- {{domxref('PointerEvent.pointerId')}} {{ReadOnlyInline}}
  - : Một định danh duy nhất cho con trỏ gây ra sự kiện.
- {{domxref('PointerEvent.width')}} {{ReadOnlyInline}}
  - : Chiều rộng (độ lớn trên trục X), tính bằng pixel CSS, của hình học tiếp xúc của con trỏ.
- {{domxref('PointerEvent.height')}} {{ReadOnlyInline}}
  - : Chiều cao (độ lớn trên trục Y), tính bằng pixel CSS, của hình học tiếp xúc của con trỏ.
- {{domxref('PointerEvent.pressure')}} {{ReadOnlyInline}}
  - : Lực nhấn chuẩn hóa của đầu vào con trỏ trong khoảng `0` đến `1`, trong đó `0` và `1` lần lượt biểu thị lực nhấn tối thiểu và tối đa mà phần cứng có thể phát hiện.
- {{domxref('PointerEvent.tangentialPressure')}} {{ReadOnlyInline}}
  - : Lực nhấn tiếp tuyến chuẩn hóa của đầu vào con trỏ (còn được gọi là barrel pressure hoặc [cylinder stress](https://en.wikipedia.org/wiki/Cylinder_stress)) trong khoảng `-1` đến `1`, trong đó `0` là vị trí trung tính của điều khiển.
- {{domxref('PointerEvent.tiltX')}} {{ReadOnlyInline}}
  - : Góc mặt phẳng (tính bằng độ, trong khoảng `-90` đến `90`) giữa mặt phẳng Y–Z và mặt phẳng chứa cả trục của con trỏ (ví dụ: bút stylus) và trục Y.
- {{domxref('PointerEvent.tiltY')}} {{ReadOnlyInline}}
  - : Góc mặt phẳng (tính bằng độ, trong khoảng `-90` đến `90`) giữa mặt phẳng X–Z và mặt phẳng chứa cả trục của con trỏ (ví dụ: bút stylus) và trục X.
- {{domxref('PointerEvent.twist')}} {{ReadOnlyInline}}
  - : Độ xoay theo chiều kim đồng hồ của con trỏ (ví dụ: bút stylus) quanh trục chính của nó, tính bằng độ, với giá trị trong khoảng `0` đến `359`.
- {{domxref('PointerEvent.pointerType')}} {{ReadOnlyInline}}
  - : Cho biết loại thiết bị đã gây ra sự kiện (mouse, pen, touch, v.v.).
- {{domxref('PointerEvent.isPrimary')}} {{ReadOnlyInline}}
  - : Cho biết con trỏ này có phải là con trỏ chính của kiểu con trỏ đó hay không.

## Phương thức instance

- {{DOMxRef('PointerEvent.getCoalescedEvents()')}} {{SecureContext_Inline}}
  - : Trả về một chuỗi gồm tất cả các `PointerEvent` đã được gộp vào sự kiện {{domxref("Element/pointermove_event", "pointermove")}} đã được phát ra.
- {{DOMxRef('PointerEvent.getPredictedEvents()')}}
  - : Trả về một chuỗi các `PointerEvent` mà trình duyệt dự đoán sẽ theo sau các sự kiện đã được gộp của sự kiện {{domxref("Element/pointermove_event", "pointermove")}} đã được phát ra.

## Các loại sự kiện con trỏ

Giao diện `PointerEvent` có nhiều loại sự kiện. Để xác định sự kiện nào đã được kích hoạt, hãy xem thuộc tính {{domxref("Event.type", "type")}} của sự kiện.

> [!NOTE]
> Cần lưu ý rằng trong nhiều trường hợp, cả sự kiện con trỏ và chuột đều được gửi đi (để cho phép mã không chuyên biệt cho con trỏ vẫn có thể tương tác với người dùng). Nếu bạn dùng sự kiện con trỏ, bạn nên gọi {{domxref("Event.preventDefault()", "preventDefault()")}} để ngăn sự kiện chuột cũng được gửi đi.

- {{domxref('Element/pointerover_event', 'pointerover')}}
  - : Sự kiện này được kích hoạt khi một thiết bị trỏ đi vào ranh giới hit test của một phần tử.
- {{domxref('Element/pointerenter_event', 'pointerenter')}}
  - : Sự kiện này được kích hoạt khi một thiết bị trỏ đi vào ranh giới hit test của một phần tử hoặc một trong các phần tử con của nó, kể cả khi là kết quả của sự kiện `pointerdown` từ một thiết bị không hỗ trợ hover (xem `pointerdown`). Loại sự kiện này tương tự `pointerover`, nhưng khác ở chỗ nó không bubble.
- {{domxref('Element/pointerdown_event', 'pointerdown')}}
  - : Sự kiện này được kích hoạt khi một con trỏ trở nên _active_. Với chuột, nó được kích hoạt khi thiết bị chuyển từ trạng thái không có nút nào được nhấn sang có ít nhất một nút được nhấn. Với chạm, nó được kích hoạt khi có tiếp xúc vật lý với bộ số hóa. Với bút, nó được kích hoạt khi bút stylus chạm vật lý vào bộ số hóa.

    > [!NOTE]
    > Đối với trình duyệt cảm ứng cho phép [direct manipulation](https://w3c.github.io/pointerevents/#dfn-direct-manipulation), sự kiện `pointerdown` sẽ kích hoạt [implicit pointer capture](https://w3c.github.io/pointerevents/#dfn-implicit-pointer-capture), khiến phần tử đích bắt tất cả các sự kiện con trỏ tiếp theo như thể chúng đang xảy ra trên chính phần tử đang giữ bắt. Do đó, `pointerover`, `pointerenter`, `pointerleave`, và `pointerout` **sẽ không được kích hoạt** trong khi trạng thái bắt này còn được thiết lập. Việc bắt có thể được giải phóng thủ công bằng cách gọi {{ domxref('element.releasePointerCapture') }} trên phần tử đích, hoặc nó sẽ tự động được giải phóng sau sự kiện `pointerup` hoặc `pointercancel`.

- {{domxref('Element/pointermove_event', 'pointermove')}}
  - : Sự kiện này được kích hoạt khi một con trỏ thay đổi tọa độ.
- {{domxref('Element/pointerrawupdate_event', 'pointerrawupdate')}} {{experimental_inline}}
  - : Sự kiện này được kích hoạt khi bất kỳ thuộc tính nào của con trỏ thay đổi.
- {{domxref('Element/pointerup_event', 'pointerup')}}
  - : Sự kiện này được kích hoạt khi một con trỏ không còn _active_ nữa.
- {{domxref('Element/pointercancel_event', 'pointercancel')}}
  - : Trình duyệt kích hoạt sự kiện này nếu nó kết luận rằng con trỏ sẽ không còn có thể tạo ra sự kiện nữa (ví dụ thiết bị liên quan bị vô hiệu hóa).
- {{domxref('Element/pointerout_event', 'pointerout')}}
  - : Sự kiện này được kích hoạt vì nhiều lý do, bao gồm: thiết bị trỏ đi ra khỏi ranh giới hit test của một phần tử; phát ra sự kiện `pointerup` cho một thiết bị không hỗ trợ hover (xem `pointerup`); sau khi phát ra sự kiện `pointercancel` (xem `pointercancel`); khi bút stylus rời khỏi phạm vi hover mà bộ số hóa có thể phát hiện.
- {{domxref('Element/pointerleave_event', 'pointerleave')}}
  - : Sự kiện này được kích hoạt khi một thiết bị trỏ đi ra khỏi ranh giới hit test của một phần tử. Đối với thiết bị bút, sự kiện này được kích hoạt khi bút stylus rời khỏi phạm vi hover mà bộ số hóa có thể phát hiện.
- {{domxref('Element/gotpointercapture_event', 'gotpointercapture')}}
  - : Sự kiện này được kích hoạt khi một phần tử nhận được pointer capture.
- {{domxref('Element/lostpointercapture_event', 'lostpointercapture')}}
  - : Sự kiện này được kích hoạt sau khi pointer capture được giải phóng cho một con trỏ.

## Ví dụ

Ví dụ cho từng thuộc tính, loại sự kiện và global event handler được bao gồm trong các trang tham khảo tương ứng của chúng.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Touch events](/en-US/docs/Web/API/Touch_events)
- {{domxref("GestureEvent")}}
- {{cssxref("touch-action")}}
