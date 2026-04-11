---
title: MouseEvent
slug: Web/API/MouseEvent
page-type: web-api-interface
browser-compat: api.MouseEvent
---

{{APIRef("Pointer Events")}}

Giao diện **`MouseEvent`** biểu thị các sự kiện xảy ra do người dùng tương tác với thiết bị trỏ (chẳng hạn như chuột).
Các sự kiện phổ biến sử dụng giao diện này bao gồm {{domxref("Element/click_event", "click")}}, {{domxref("Element/dblclick_event", "dblclick")}}, {{domxref("Element/mouseup_event", "mouseup")}}, {{domxref("Element/mousedown_event", "mousedown")}}.

`MouseEvent` bắt nguồn từ {{domxref("UIEvent")}}, và {{domxref("UIEvent")}} lại bắt nguồn từ {{domxref("Event")}}.
Mặc dù phương thức {{domxref("MouseEvent.initMouseEvent()")}} được giữ lại để tương thích ngược, nhưng việc tạo đối tượng `MouseEvent` phải được thực hiện bằng cách sử dụng hàm tạo {{domxref("MouseEvent.MouseEvent", "MouseEvent()")}}.

Một số sự kiện cụ thể hơn dựa trên `MouseEvent`, bao gồm {{domxref("WheelEvent")}}, {{domxref("DragEvent")}} và {{domxref("PointerEvent")}}.

{{InheritanceDiagram}}

## Người xây dựng

- {{domxref("MouseEvent.MouseEvent", "MouseEvent()")}}
  - : Tạo một đối tượng `MouseEvent`.

## Thuộc tính tĩnh

- {{domxref("MouseEvent.WEBKIT_FORCE_AT_MOUSE_DOWN_static", "MouseEvent.WEBKIT_FORCE_AT_MOUSE_DOWN")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Lực tối thiểu cần thiết cho một cú nhấp chuột bình thường.
- {{domxref("MouseEvent.WEBKIT_FORCE_AT_FORCE_MOUSE_DOWN_static", "MouseEvent.WEBKIT_FORCE_AT_FORCE_MOUSE_DOWN")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Lực tối thiểu cần thiết cho một cú bấm mạnh.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của giao diện cha là {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("MouseEvent.altKey")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu phím <kbd>alt</kbd> không hoạt động khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.button")}} {{ReadOnlyInline}}
  - : Số nút được nhấn hoặc nhả (nếu có) khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.buttons")}} {{ReadOnlyInline}}
  - : Các nút được nhấn (nếu có) khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.clientX")}} {{ReadOnlyInline}}
  - : Tọa độ X của con trỏ chuột trong [tọa độ khung nhìn](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#viewport).
- {{domxref("MouseEvent.clientY")}} {{ReadOnlyInline}}
  - : Tọa độ Y của con trỏ chuột trong [tọa độ khung nhìn](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#viewport).
- {{domxref("MouseEvent.ctrlKey")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu phím <kbd>control</kbd> không hoạt động khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.layerX")}} {{Non-standard_inline}} {{ReadOnlyInline}}
  - : Trả về tọa độ ngang của sự kiện so với lớp hiện tại.
- {{domxref("MouseEvent.layerY")}} {{Non-standard_inline}} {{ReadOnlyInline}}
  - : Trả về tọa độ dọc của sự kiện so với lớp hiện tại.
- {{domxref("MouseEvent.metaKey")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu phím <kbd>meta</kbd> không hoạt động khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.movementX")}} {{ReadOnlyInline}}
  - : Tọa độ X của con trỏ chuột so với vị trí của sự kiện di chuyển cuối cùng cùng loại (a {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/pointermove_event", "pointermove")}} hoặc {{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}).
- {{domxref("MouseEvent.movementY")}} {{ReadOnlyInline}}
  - : Tọa độ Y của con trỏ chuột so với vị trí của sự kiện di chuyển cuối cùng cùng loại (a {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/pointermove_event", "pointermove")}} hoặc {{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}).
- {{domxref("MouseEvent.offsetX")}} {{ReadOnlyInline}}
  - : Tọa độ X của con trỏ chuột so với vị trí cạnh đệm của nút đích.
- {{domxref("MouseEvent.offsetY")}} {{ReadOnlyInline}}
  - : Tọa độ Y của con trỏ chuột so với vị trí cạnh đệm của nút đích.
- {{domxref("MouseEvent.pageX")}} {{ReadOnlyInline}}
  - : Tọa độ X của con trỏ chuột so với toàn bộ tài liệu.
- {{domxref("MouseEvent.pageY")}} {{ReadOnlyInline}}
  - : Tọa độ Y của con trỏ chuột so với toàn bộ tài liệu.
- {{domxref("MouseEvent.relatedTarget")}} {{ReadOnlyInline}}
  - : Mục tiêu phụ cho sự kiện, nếu có.
- {{domxref("MouseEvent.screenX")}} {{ReadOnlyInline}}
  - : Tọa độ X của con trỏ chuột trong [tọa độ màn hình](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#screen).
- {{domxref("MouseEvent.screenY")}} {{ReadOnlyInline}}
  - : Tọa độ Y của con trỏ chuột trong [tọa độ màn hình](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems#screen).
- {{domxref("MouseEvent.shiftKey")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu phím <kbd>shift</kbd> không hoạt động khi sự kiện chuột được kích hoạt.
- {{domxref("MouseEvent.mozInputSource")}} {{non-standard_inline()}} {{ReadOnlyInline}}
  - : Loại thiết bị đã tạo ra sự kiện (một trong các hằng số `MOZ_SOURCE_*`).
    Ví dụ: điều này cho phép bạn xác định xem sự kiện chuột được tạo bởi chuột thực hay sự kiện chạm (điều này có thể ảnh hưởng đến mức độ chính xác mà bạn diễn giải tọa độ liên quan đến sự kiện).
- {{domxref("MouseEvent.webkitForce")}} {{non-standard_inline()}} {{ReadOnlyInline}}
  - : Lượng áp lực được áp dụng khi nhấp chuột.
- {{domxref("MouseEvent.x")}} {{ReadOnlyInline}}
  - : Bí danh của {{domxref("MouseEvent.clientX")}}.
- {{domxref("MouseEvent.y")}} {{ReadOnlyInline}}
  - : Bí danh của {{domxref("MouseEvent.clientY")}}.

## Phương thức sơ thẩm

_Giao diện này cũng kế thừa các phương thức của cha nó là {{domxref("UIEvent")}} và {{domxref("Event")}}._

- {{domxref("MouseEvent.getModifierState()")}}
  - : Trả về trạng thái hiện tại của phím bổ trợ đã chỉ định. Xem {{domxref("KeyboardEvent.getModifierState", "KeyboardEvent.getModifierState()")}} để biết chi tiết.
- {{domxref("MouseEvent.initMouseEvent()")}} {{deprecated_inline}}
  - : Khởi tạo giá trị của `MouseEvent` được tạo. Nếu sự kiện đã được gửi đi thì phương thức này sẽ không có tác dụng gì.

## Ví dụ

Ví dụ này minh họa việc mô phỏng một lượt nhấp chuột (tạo sự kiện nhấp chuột theo chương trình) trên một hộp kiểm bằng các phương thức DOM.
Trạng thái sự kiện (bị hủy hay không) sau đó được xác định bằng giá trị trả về của phương thức {{domxref("EventTarget.dispatchEvent", "EventTarget.dispatchEvent()")}}.

### HTML

```html
<p>
  <label><input type="checkbox" id="checkbox" /> Checked</label>
</p>
<p>
  <button id="button">Click me to send a MouseEvent to the checkbox</button>
</p>
```

### JavaScript

```js
function simulateClick() {
  // Get the element to send a click event
  const cb = document.getElementById("checkbox");

  // Create a synthetic click MouseEvent
  let evt = new MouseEvent("click", {
    bubbles: true,
    cancelable: true,
    view: window,
  });

  // Send the event to the checkbox element
  cb.dispatchEvent(evt);
}
document.getElementById("button").addEventListener("click", simulateClick);
```

### Kết quả

{{EmbedLiveSample('Example')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Cha mẹ trực tiếp của nó, {{domxref("UIEvent")}}
- {{domxref("PointerEvent")}}: Dành cho các sự kiện con trỏ nâng cao, bao gồm cảm ứng đa điểm
