---
title: Event
slug: Web/API/Event
page-type: web-api-interface
browser-compat: api.Event
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`Event`** biểu diễn một sự kiện xảy ra trên một [`EventTarget`](/en-US/docs/Web/API/EventTarget).

Một sự kiện có thể được kích hoạt bởi hành động của người dùng, chẳng hạn như nhấp chuột hoặc nhấn phím, hoặc được các API tạo ra để biểu diễn tiến trình của một tác vụ bất đồng bộ. Sự kiện cũng có thể được kích hoạt theo chương trình, chẳng hạn bằng cách gọi phương thức [`HTMLElement.click()`](/en-US/docs/Web/API/HTMLElement/click) của một phần tử, hoặc bằng cách định nghĩa sự kiện rồi gửi nó đến một đích được chỉ định bằng [`EventTarget.dispatchEvent()`](/en-US/docs/Web/API/EventTarget/dispatchEvent).

Có nhiều loại sự kiện, trong đó một số loại dùng các giao diện khác dựa trên giao diện `Event` chính. Bản thân `Event` chứa các thuộc tính và phương thức chung cho mọi sự kiện.

Nhiều phần tử DOM có thể được cấu hình để nhận (hoặc "lắng nghe") các sự kiện này, và thực thi mã để phản hồi khi xử lý chúng. Các trình xử lý sự kiện thường được gắn (hoặc "đính kèm") vào nhiều [phần tử HTML](/en-US/docs/Web/HTML/Reference/Elements) khác nhau (chẳng hạn `<button>`, `<div>`, `<span>`, v.v.) bằng [`EventTarget.addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener), và cách này thường thay thế cho việc dùng các [thuộc tính trình xử lý sự kiện](/en-US/docs/Web/HTML/Reference/Global_attributes) cũ của HTML. Ngoài ra, khi được thêm đúng cách, các trình xử lý như vậy cũng có thể được gỡ ra nếu cần bằng [`removeEventListener()`](/en-US/docs/Web/API/EventTarget/removeEventListener).

> [!NOTE]
> Một phần tử có thể có nhiều trình xử lý như vậy, kể cả cho cùng một sự kiện, đặc biệt nếu các mô-đun mã riêng biệt và độc lập cùng gắn chúng cho những mục đích độc lập của riêng mình. (Ví dụ: một trang web có mô-đun quảng cáo và mô-đun thống kê cùng theo dõi việc xem video.)

Khi có nhiều phần tử lồng nhau, mỗi phần tử lại có một hay nhiều trình xử lý riêng, việc xử lý sự kiện có thể trở nên rất phức tạp, đặc biệt khi phần tử cha nhận chính sự kiện mà phần tử con của nó nhận, vì chúng chồng lấn nhau về mặt "không gian", nên về mặt kỹ thuật sự kiện xảy ra ở cả hai, và thứ tự xử lý của các sự kiện như vậy phụ thuộc vào cài đặt [sự lan truyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling) của từng trình xử lý được kích hoạt.

## Giao diện dựa trên Event

Dưới đây là danh sách các giao diện dựa trên giao diện `Event` chính, kèm liên kết đến tài liệu tương ứng trong phần tham chiếu API của MDN.

Lưu ý rằng mọi giao diện sự kiện đều có tên kết thúc bằng "Event".

- {{domxref("AnimationEvent")}}
- {{domxref("AudioProcessingEvent")}} {{Deprecated_Inline}}
- {{domxref("BeforeUnloadEvent")}}
- {{domxref("BlobEvent")}}
- {{domxref("ClipboardChangeEvent")}}
- {{domxref("ClipboardEvent")}}
- {{domxref("CloseEvent")}}
- {{domxref("CompositionEvent")}}
- {{domxref("CustomEvent")}}
- {{domxref("DeviceMotionEvent")}}
- {{domxref("DeviceOrientationEvent")}}
- {{domxref("DragEvent")}}
- {{domxref("ErrorEvent")}}
- {{domxref("FetchEvent")}}
- {{domxref("FocusEvent")}}
- {{domxref("FontFaceSetLoadEvent")}}
- {{domxref("FormDataEvent")}}
- {{domxref("GamepadEvent")}}
- {{domxref("HashChangeEvent")}}
- {{domxref("HIDInputReportEvent")}}
- {{domxref("IDBVersionChangeEvent")}}
- {{domxref("InputEvent")}}
- {{domxref("KeyboardEvent")}}
- {{domxref("MediaStreamEvent")}} {{Deprecated_Inline}}
- {{domxref("MessageEvent")}}
- {{domxref("MouseEvent")}}
- {{domxref("MutationEvent")}} {{Deprecated_Inline}}
- {{domxref("OfflineAudioCompletionEvent")}}
- {{domxref("PageTransitionEvent")}}
- {{domxref("PaymentRequestUpdateEvent")}}
- {{domxref("PointerEvent")}}
- {{domxref("PopStateEvent")}}
- {{domxref("ProgressEvent")}}
- {{domxref("RTCDataChannelEvent")}}
- {{domxref("RTCPeerConnectionIceEvent")}}
- {{domxref("StorageEvent")}}
- {{domxref("SubmitEvent")}}
- {{domxref("TimeEvent")}}
- {{domxref("TouchEvent")}}
- {{domxref("TrackEvent")}}
- {{domxref("TransitionEvent")}}
- {{domxref("UIEvent")}}
- {{domxref("WebGLContextEvent")}}
- {{domxref("WheelEvent")}}

## Hàm khởi tạo

- {{domxref("Event.Event", "Event()")}}
  - : Tạo một đối tượng `Event` rồi trả về cho bên gọi.

## Thuộc tính thể hiện

- {{domxref("Event.bubbles")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết sự kiện có lan truyền lên qua cây DOM hay không.
- {{domxref("Event.cancelable")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết sự kiện có thể bị hủy hay không.
- {{domxref("Event.composed")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết sự kiện có thể lan truyền qua ranh giới giữa shadow DOM và DOM thông thường hay không.
- {{domxref("Event.currentTarget")}} {{ReadOnlyInline}}
  - : Tham chiếu đến đích hiện đang được đăng ký cho sự kiện. Đây là đối tượng mà sự kiện hiện đang được lên lịch để gửi tới. Có thể giá trị này đã thay đổi dọc đường thông qua _retargeting_.
- {{domxref("Event.defaultPrevented")}} {{ReadOnlyInline}}
  - : Cho biết lời gọi đến {{domxref("event.preventDefault()")}} có hủy sự kiện hay không.
- {{domxref("Event.eventPhase")}} {{ReadOnlyInline}}
  - : Cho biết pha nào của luồng sự kiện đang được xử lý. Giá trị là một trong các số sau: `NONE`, `CAPTURING_PHASE`, `AT_TARGET`, `BUBBLING_PHASE`.
- {{domxref("Event.isTrusted")}} {{ReadOnlyInline}}
  - : Cho biết sự kiện được khởi tạo bởi trình duyệt (sau một cú nhấp chuột của người dùng, chẳng hạn) hay bởi script (ví dụ bằng một phương thức tạo sự kiện).
- {{domxref("Event.srcElement")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một bí danh của thuộc tính {{domxref("Event.target")}}. Hãy dùng {{domxref("Event.target")}} thay thế.
- {{domxref("Event.target")}} {{ReadOnlyInline}}
  - : Tham chiếu đến đối tượng mà sự kiện ban đầu được gửi tới.
- {{domxref("Event.timeStamp")}} {{ReadOnlyInline}}
  - : Thời điểm sự kiện được tạo (tính bằng mili giây). Theo đặc tả, giá trị này là thời gian tính từ epoch, nhưng trên thực tế mỗi trình duyệt định nghĩa khác nhau. Ngoài ra, công việc đang được tiến hành để đổi giá trị này thành một {{domxref("DOMHighResTimeStamp")}}.
- {{domxref("Event.type")}} {{ReadOnlyInline}}
  - : Tên xác định loại sự kiện.

### Thuộc tính kế thừa và không chuẩn

- {{domxref("Event.cancelBubble")}} {{deprecated_inline}}
  - : Một bí danh lịch sử cho {{domxref("Event.stopPropagation()")}}, vốn nên được dùng thay thế. Việc đặt giá trị của nó thành `true` trước khi trả về từ một trình xử lý sự kiện sẽ ngăn sự kiện lan truyền.
- {{domxref("Event.explicitOriginalTarget")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Đích gốc tường minh của sự kiện.
- {{domxref("Event.originalTarget")}} {{non-standard_inline}} {{ReadOnlyInline}}
  - : Đích gốc của sự kiện, trước mọi lần retargeting.
- {{domxref("Event.returnValue")}} {{deprecated_inline}}
  - : Một thuộc tính lịch sử vẫn được hỗ trợ để đảm bảo các trang hiện có tiếp tục hoạt động. Hãy dùng {{domxref("Event.preventDefault()")}} và {{domxref("Event.defaultPrevented")}} thay thế.
- {{domxref("Event.composed", "Event.scoped")}} {{ReadOnlyInline}} {{deprecated_inline}}
  - : Một giá trị boolean cho biết sự kiện đã cho có lan truyền qua shadow root vào DOM tiêu chuẩn hay không. Hãy dùng {{domxref("Event.composed", "composed")}} thay thế.

## Phương thức thể hiện

- {{domxref("Event.composedPath()")}}
  - : Trả về đường đi của sự kiện (một mảng các đối tượng mà trên đó các bộ lắng nghe sẽ được gọi). Điều này không bao gồm các nút trong shadow tree nếu shadow root được tạo với chế độ {{domxref("ShadowRoot.mode")}} là `closed`.
- {{domxref("Event.preventDefault()")}}
  - : Hủy sự kiện (nếu nó có thể bị hủy).
- {{domxref("Event.stopImmediatePropagation()")}}
  - : Đối với sự kiện cụ thể này, ngăn mọi bộ lắng nghe khác được gọi. Điều này bao gồm cả các bộ lắng nghe gắn vào cùng một phần tử và những bộ lắng nghe gắn vào các phần tử sẽ được duyệt sau đó (chẳng hạn trong pha capture).
- {{domxref("Event.stopPropagation()")}}
  - : Dừng sự lan truyền của sự kiện đi xa hơn trong DOM.

### Phương thức không dùng nữa

- {{domxref("Event.initEvent()")}} {{deprecated_inline}}
  - : Khởi tạo giá trị của một `Event` đã được tạo. Nếu sự kiện đã được gửi rồi, phương thức này không làm gì cả. Hãy dùng hàm khởi tạo ({{domxref("Event.Event", "Event()")}}) thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mục lục sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#event_index)
- [Học: Giới thiệu về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events)
- [Học: Sự lan truyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling)
- [Tạo và kích hoạt sự kiện tùy chỉnh](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
