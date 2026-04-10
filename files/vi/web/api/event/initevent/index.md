---
title: "Event: phương thức initEvent()"
short-title: initEvent()
slug: Web/API/Event/initEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Event.initEvent
---

{{APIRef("DOM")}}{{deprecated_header}}{{AvailableInWorkers}}

Phương thức **`Event.initEvent()`** được dùng để khởi tạo giá trị của một {{ domxref("event") }} được tạo bằng {{domxref("Document.createEvent()")}}.

Các sự kiện được khởi tạo theo cách này phải được tạo bằng phương thức
{{domxref("Document.createEvent()")}}.
Phương thức này phải được gọi để đặt cấu hình sự kiện trước khi nó được gửi đi, bằng {{ domxref("EventTarget.dispatchEvent()") }}.
Sau khi đã được gửi đi, nó sẽ không còn làm gì nữa.

> [!NOTE]
> _Không nên dùng phương thức này nữa vì nó đã bị deprecate._
> Thay vào đó, hãy dùng các hàm khởi tạo sự kiện cụ thể, như {{domxref("Event.Event", "Event()")}}.
> Phần [Tạo và gửi sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events) cung cấp thêm thông tin về cách sử dụng những hàm này.

## Cú pháp

```js-nolint
initEvent(type, bubbles, cancelable)
```

### Tham số

- `type`
  - : Một chuỗi xác định loại sự kiện.
- `bubbles`
  - : Một giá trị boolean quyết định sự kiện có nên lan truyền lên qua chuỗi sự kiện hay không. Một khi đã đặt, thuộc tính chỉ đọc {{ domxref("Event.bubbles") }} sẽ phản ánh giá trị của nó.
- `cancelable`
  - : Một giá trị boolean xác định sự kiện có thể bị hủy hay không. Một khi đã đặt, thuộc tính chỉ đọc {{ domxref("Event.cancelable") }} sẽ phản ánh giá trị của nó.

### Giá trị trả về

Không có.

## Ví dụ

```js
// Tạo sự kiện.
const event = document.createEvent("Event");

// Tạo một sự kiện click lan truyền được và
// không thể bị hủy
event.initEvent("click", true, false);

// Lắng nghe sự kiện.
elem.addEventListener("click", (e) => {
  // e.target khớp với elem
});

elem.dispatchEvent(event);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo nên dùng thay vì phương thức đã lỗi thời này:
  {{domxref("Event.Event", "Event()")}}. Để tạo các giao diện sự kiện cụ thể hơn `Event`, hãy dùng hàm khởi tạo được định nghĩa cho giao diện sự kiện mong muốn.
