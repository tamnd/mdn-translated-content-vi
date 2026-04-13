---
title: PerformanceEventTiming
slug: Web/API/PerformanceEventTiming
page-type: web-api-interface
browser-compat: api.PerformanceEventTiming
---

{{APIRef("Performance API")}}

Giao diện `PerformanceEventTiming` của Event Timing API cung cấp thông tin chi tiết về độ trễ của một số loại sự kiện được kích hoạt bởi tương tác người dùng.

## Mô tả

API này cho phép theo dõi các sự kiện chậm bằng cách cung cấp dấu thời gian và thời lượng của sự kiện cho một số loại sự kiện nhất định ([xem bên dưới](#events_exposed)). Ví dụ, bạn có thể đo thời gian giữa hành động người dùng và thời điểm bắt đầu chạy trình xử lý sự kiện của nó, hoặc thời gian mà trình xử lý sự kiện mất để chạy.

API này đặc biệt hữu ích để đo {{Glossary("Interaction to Next Paint")}} (INP): thời gian dài nhất (trừ một số ngoại lệ) từ thời điểm người dùng tương tác với ứng dụng của bạn cho đến khi trình duyệt thực sự có thể phản hồi tương tác đó.

Thông thường bạn làm việc với các đối tượng `PerformanceEventTiming` bằng cách tạo một phiên bản {{domxref("PerformanceObserver")}} rồi gọi phương thức [`observe()`](/en-US/docs/Web/API/PerformanceObserver/observe) của nó, truyền `"event"` hoặc `"first-input"` làm giá trị của tùy chọn [`type`](/en-US/docs/Web/API/PerformanceEntry/entryType). Hàm callback của đối tượng `PerformanceObserver` sau đó sẽ được gọi với danh sách các đối tượng `PerformanceEventTiming` để bạn phân tích. Xem [ví dụ bên dưới](#getting_event_timing_information) để biết thêm.

Theo mặc định, các mục `PerformanceEventTiming` được hiển thị khi `duration` của chúng là 104ms hoặc hơn. Nghiên cứu cho thấy rằng đầu vào người dùng không được xử lý trong vòng 100ms được coi là chậm và 104ms là bội số đầu tiên của 8 lớn hơn 100ms (vì lý do bảo mật, API này được làm tròn đến bội số gần nhất của 8ms). Tuy nhiên, bạn có thể đặt {{domxref("PerformanceObserver")}} với một ngưỡng khác bằng cách sử dụng tùy chọn `durationThreshold` trong phương thức [`observe()`](/en-US/docs/Web/API/PerformanceObserver/observe).

Giao diện này kế thừa các phương thức và thuộc tính từ lớp cha của nó, {{domxref("PerformanceEntry")}}:

{{InheritanceDiagram}}

### Các sự kiện được hiển thị

Các loại sự kiện sau được hiển thị bởi Event Timing API:

<table>
  <tbody>
    <tr>
      <th scope="row">Click events</th>
      <td>
        {{domxref("Element/auxclick_event", "auxclick")}},
        {{domxref("Element/click_event", "click")}},
        {{domxref("Element/contextmenu_event", "contextmenu")}},
        {{domxref("Element/dblclick_event", "dblclick")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Composition events</th>
      <td>
        {{domxref("Element/compositionend_event", "compositionend")}},
        {{domxref("Element/compositionstart_event", "compositionstart")}},
        {{domxref("Element/compositionupdate_event", "compositionupdate")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Drag &amp; drop events</th>
      <td>
        {{domxref("HTMLElement/dragend_event", "dragend")}},
        {{domxref("HTMLElement/dragenter_event", "dragenter")}},
        {{domxref("HTMLElement/dragleave_event", "dragleave")}},
        {{domxref("HTMLElement/dragover_event", "dragover")}},
        {{domxref("HTMLElement/dragstart_event", "dragstart")}},
        {{domxref("HTMLElement/drop_event", "drop")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Input events</th>
      <td>
        {{domxref("Element/beforeinput_event", "beforeinput")}},
        {{domxref("Element/input_event", "input")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Keyboard events</th>
      <td>
        {{domxref("Element/keydown_event", "keydown")}},
        {{domxref("Element/keypress_event", "keypress")}},
        {{domxref("Element/keyup_event", "keyup")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Mouse events</th>
      <td>
        {{domxref("Element/mousedown_event", "mousedown")}},
        {{domxref("Element/mouseenter_event", "mouseenter")}},
        {{domxref("Element/mouseleave_event", "mouseleave")}},
        {{domxref("Element/mouseout_event", "mouseout")}},
        {{domxref("Element/mouseover_event", "mouseover")}},
        {{domxref("Element/mouseup_event", "mouseup")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Pointer events</th>
      <td>
        {{domxref("Element/pointerover_event", "pointerover")}},
        {{domxref("Element/pointerenter_event", "pointerenter")}},
        {{domxref("Element/pointerdown_event", "pointerdown")}},
        {{domxref("Element/pointerup_event", "pointerup")}},
        {{domxref("Element/pointercancel_event", "pointercancel")}},
        {{domxref("Element/pointerout_event", "pointerout")}},
        {{domxref("Element/pointerleave_event", "pointerleave")}},
        {{domxref("Element/gotpointercapture_event", "gotpointercapture")}},
        {{domxref("Element/lostpointercapture_event", "lostpointercapture")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Touch events</th>
      <td>
        {{domxref("Element/touchstart_event", "touchstart")}},
        {{domxref("Element/touchend_event", "touchend")}},
        {{domxref("Element/touchcancel_event", "touchcancel")}}
      </td>
    </tr>
  </tbody>
</table>

Lưu ý rằng các sự kiện sau không được bao gồm trong danh sách vì chúng là các sự kiện liên tục và không thể thu thập được số lượng sự kiện hoặc các chỉ số hiệu suất có ý nghĩa tại thời điểm này: {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/pointermove_event", "pointermove")}},
{{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}, {{domxref("Element/touchmove_event", "touchmove")}}, {{domxref("Element/wheel_event", "wheel")}}, {{domxref("HTMLElement/drag_event", "drag")}}.

Để có danh sách tất cả các sự kiện được hiển thị, bạn cũng có thể tra cứu các khóa trong map {{domxref("performance.eventCounts")}}:

```js
const exposedEventsList = [...performance.eventCounts.keys()];
```

## Hàm khởi tạo

Giao diện này không có hàm khởi tạo riêng. Xem [ví dụ bên dưới](#getting_event_timing_information) về cách thông thường để lấy thông tin mà giao diện `PerformanceEventTiming` chứa.

## Thuộc tính phiên bản

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau đây cho các loại mục hiệu suất event timing bằng cách điều chỉnh chúng như sau:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian từ `startTime` đến lần vẽ render tiếp theo (làm tròn đến 8ms gần nhất).
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}}
  - : Trả về `"event"` (cho các sự kiện dài) hoặc `"first-input"` (cho tương tác người dùng đầu tiên).
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}}
  - : Trả về loại của sự kiện liên quan.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thuộc tính [`timestamp`](/en-US/docs/Web/API/Event/timeStamp) của sự kiện liên quan. Đây là thời điểm sự kiện được tạo ra và có thể được coi như một đại diện cho thời điểm tương tác người dùng xảy ra.

Giao diện này cũng hỗ trợ các thuộc tính sau:

- {{domxref("PerformanceEventTiming.cancelable")}} {{ReadOnlyInline}}
  - : Trả về thuộc tính [`cancelable`](/en-US/docs/Web/API/Event/cancelable) của sự kiện liên quan.
- {{domxref("PerformanceEventTiming.interactionId")}} {{ReadOnlyInline}}
  - : Trả về ID xác định duy nhất tương tác người dùng đã kích hoạt sự kiện liên quan.
- {{domxref("PerformanceEventTiming.processingStart")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thời điểm bắt đầu gửi sự kiện. Để đo thời gian giữa hành động người dùng và thời điểm trình xử lý sự kiện bắt đầu chạy, tính `processingStart-startTime`.
- {{domxref("PerformanceEventTiming.processingEnd")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thời điểm kết thúc gửi sự kiện. Để đo thời gian trình xử lý sự kiện mất để chạy, tính `processingEnd-processingStart`.
- {{domxref("PerformanceEventTiming.target")}} {{ReadOnlyInline}}
  - : Trả về mục tiêu cuối cùng của sự kiện liên quan, nếu nó không bị xóa.

## Phương thức phiên bản

- {{domxref("PerformanceEventTiming.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceEventTiming`.

## Ví dụ

### Lấy thông tin event timing

Để lấy thông tin event timing, hãy tạo một phiên bản {{domxref("PerformanceObserver")}} rồi gọi phương thức [`observe()`](/en-US/docs/Web/API/PerformanceObserver/observe) của nó, truyền `"event"` hoặc `"first-input"` làm giá trị của tùy chọn [`type`](/en-US/docs/Web/API/PerformanceEntry/entryType). Bạn cũng cần đặt `buffered` thành `true` để truy cập các sự kiện mà user agent đã đệm trong khi xây dựng tài liệu. Hàm callback của đối tượng `PerformanceObserver` sau đó sẽ được gọi với danh sách các đối tượng `PerformanceEventTiming` để bạn phân tích.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    // Full duration
    const duration = entry.duration;

    // Input delay (before processing event)
    const delay = entry.processingStart - entry.startTime;

    // Synchronous event processing time
    // (between start and end dispatch)
    const eventHandlerTime = entry.processingEnd - entry.processingStart;
    console.log(`Total duration: ${duration}`);
    console.log(`Event delay: ${delay}`);
    console.log(`Event handler duration: ${eventHandlerTime}`);
  });
});

// Register the observer for events
observer.observe({ type: "event", buffered: true });
```

Bạn cũng có thể đặt một [`durationThreshold`](/en-US/docs/Web/API/PerformanceObserver/observe#durationthreshold) khác. Giá trị mặc định là 104ms và ngưỡng thời lượng tối thiểu có thể là 16ms.

```js
observer.observe({ type: "event", durationThreshold: 16, buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API)
- [Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
