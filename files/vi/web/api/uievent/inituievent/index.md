---
title: "UIEvent: initUIEvent() method"
short-title: initUIEvent()
slug: Web/API/UIEvent/initUIEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.UIEvent.initUIEvent
---

{{APIRef("UI Events")}} {{deprecated_header}}

Phương thức **`UIEvent.initUIEvent()`** khởi tạo sự kiện UI sau khi nó được tạo.

Các sự kiện được khởi tạo theo cách này phải được tạo bằng phương thức {{domxref("Document.createEvent()")}}. Phương thức này phải được gọi để đặt sự kiện trước khi nó được gửi đi, sử dụng {{ domxref("EventTarget.dispatchEvent()") }}. Sau khi đã được gửi đi, nó không làm gì nữa.

> [!WARNING]
> Không sử dụng phương thức này nữa vì nó đã lỗi thời.
>
> Thay vào đó hãy sử dụng các hàm khởi tạo sự kiện cụ thể, như {{domxref("UIEvent.UIEvent", "UIEvent()")}}. Trang [Creating and dispatching events](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events) cung cấp thêm thông tin về cách sử dụng chúng.

## Cú pháp

```js-nolint
initUIEvent(type, canBubble, cancelable, view, detail)
```

### Tham số

- `type`
  - : Chuỗi định nghĩa loại sự kiện.
- `canBubble`
  - : Giá trị boolean quyết định xem sự kiện có nên nổi bọt qua chuỗi sự kiện hay không. Sau khi được đặt, thuộc tính chỉ đọc {{ domxref("Event.bubbles") }} sẽ cung cấp giá trị của nó.
- `cancelable`
  - : Giá trị boolean định nghĩa xem sự kiện có thể bị hủy hay không. Sau khi được đặt, thuộc tính chỉ đọc {{ domxref("Event.cancelable") }} sẽ cung cấp giá trị của nó.
- `view`
  - : Là {{glossary("WindowProxy")}} được liên kết với sự kiện.
- `detail`
  - : Giá trị `unsigned long` chỉ định một số thông tin chi tiết về sự kiện, tùy thuộc vào loại sự kiện. Đối với sự kiện chuột, nó cho biết chuột đã được click bao nhiêu lần tại một vị trí màn hình nhất định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const e = document.createEvent("UIEvent");
// creates a click event that bubbles, can be cancelled,
// and with its view and detail property initialized to window and 1,
// respectively
e.initUIEvent("click", true, true, window, 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("UIEvent") }}
- Hàm khởi tạo để sử dụng thay thế phương thức đã lỗi thời này:
  {{domxref("UIEvent.UIEvent", "UIEvent()")}}. Các hàm khởi tạo cụ thể hơn cũng có thể được sử dụng.
