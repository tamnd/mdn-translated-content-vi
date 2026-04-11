---
title: "MouseEvent: initMouseEvent() method"
short-title: initMouseEvent()
slug: Web/API/MouseEvent/initMouseEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.MouseEvent.initMouseEvent
---

{{APIRef("Pointer Events")}}{{deprecated_header}}

Phương thức **`MouseEvent.initMouseEvent()`** khởi tạo
giá trị của sự kiện chuột sau khi nó được tạo (thường sử dụng phương thức {{domxref("Document.createEvent()")}}).

> [!WARNING]
> Không sử dụng phương pháp này nữa vì nó không được dùng nữa.
>
> Thay vào đó hãy sử dụng các hàm tạo sự kiện cụ thể, như {{domxref("MouseEvent.MouseEvent", "MouseEvent()")}}.
> Phần [Tạo và gửi sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events) cung cấp thêm thông tin về cách sử dụng những sự kiện này.

Các sự kiện được khởi tạo theo cách này phải được tạo bằng phương thức {{domxref("Document.createEvent()") }}.
Phương thức này phải được gọi để thiết lập sự kiện
trước khi nó được gửi đi, sử dụng {{ domxref("EventTarget.dispatchEvent()") }}.

## Cú pháp

```js-nolint
initMouseEvent(type, canBubble, cancelable, view,
                     detail, screenX, screenY, clientX, clientY,
                     ctrlKey, altKey, shiftKey, metaKey,
                     button, relatedTarget)
```

### Thông số

- `type`
  - : chuỗi để đặt {{domxref("Event.type", "type")}} của sự kiện thành. Các loại có thể
    đối với các sự kiện chuột bao gồm: `click`, `mousedown`,
    `mouseup`, `mouseover`, `mousemove`,
    `mouseout`.
- `canBubble`
  - : liệu sự kiện có thể bong bóng hay không. Đặt giá trị của {{domxref("Event.bubbles")}}.
- `cancelable`
  - : có thể ngăn chặn hành động mặc định của sự kiện hay không. Đặt giá trị của
    {{domxref("Event.cancelable")}}.
- `view`
  - : Tóm tắt của sự kiện. Bạn nên chuyển đối tượng {{domxref("window")}} vào đây.
    Đặt giá trị của {{domxref("UIEvent.view")}}.
- `detail`
  - : số lần click chuột của sự kiện. Đặt giá trị của {{domxref("UIEvent.detail")}}.
- `screenX`
  - : màn hình sự kiện x tọa độ. Đặt giá trị của
    {{domxref("MouseEvent.screenX")}}.
- `screenY`
  - : màn hình sự kiện y tọa độ. Đặt giá trị của
    {{domxref("MouseEvent.screenY")}}.
- `clientX`
  - : tọa độ khách hàng x của sự kiện. Đặt giá trị của
    {{domxref("MouseEvent.clientX")}}.
- `clientY`
  - : tọa độ khách hàng của sự kiện. Đặt giá trị của
    {{domxref("MouseEvent.clientY")}}.
- `ctrlKey`
  - : có hay không phím <kbd>control</kbd> được nhấn trong Sự kiện. Đặt giá trị
    của {{domxref("MouseEvent.ctrlKey")}}.

- `altKey`
  - : có hay không phím <kbd>alt</kbd> được nhấn trong Sự kiện. Đặt giá trị của
    {{domxref("MouseEvent.altKey")}}.

- `shiftKey`
  - : có hay không phím <kbd>shift</kbd> được nhấn trong Sự kiện. Đặt giá trị
    của {{domxref("MouseEvent.shiftKey")}}.

- `metaKey`
  - : có hay không phím <kbd>meta</kbd> được nhấn trong Sự kiện. Đặt giá trị của
    {{domxref("MouseEvent.metaKey")}}.

- `button`
  - : chuột của sự kiện {{domxref("MouseEvent.button", "button")}}.
- `relatedTarget`
  - : [EventTarget liên quan](/en-US/docs/Web/API/MouseEvent/relatedTarget) của sự kiện. Chỉ được sử dụng
    với một số loại sự kiện (ví dụ: `mouseover` và `mouseout`). TRONG
    các trường hợp khác, vượt qua `null`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const event = document.createEvent("MouseEvents");
event.initMouseEvent(
  "click",
  true,
  true,
  window,
  0,
  0,
  0,
  80,
  20,
  false,
  false,
  false,
  false,
  0,
  null,
);
document.body.dispatchEvent(event);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MouseEvent.MouseEvent()","MouseEvent()")}} nhà xây dựng, hiện đại
  cách tiêu chuẩn để tạo {{domxref("MouseEvent")}}
- {{domxref("Event.initEvent()")}} là một phương pháp đơn giản hơn phục vụ mục đích tương tự. Nó
  cũng đã lỗi thời và không còn được sử dụng nữa.
