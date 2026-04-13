---
title: "Document: phương thức createEvent()"
short-title: createEvent()
slug: Web/API/Document/createEvent
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.Document.createEvent
---

{{APIRef("DOM")}}{{deprecated_header}}

> [!WARNING]
> Nhiều phương thức được sử dụng với `createEvent`, chẳng hạn như `initCustomEvent`, đã lỗi thời.
> Thay vào đó, hãy sử dụng [event constructors](/en-US/docs/Web/API/CustomEvent).

Tạo một [event](/en-US/docs/Web/API/Event) thuộc loại được chỉ định. Đối tượng được trả về trước tiên cần được khởi tạo và sau đó có thể được truyền cho {{domxref("EventTarget.dispatchEvent")}}.

## Cú pháp

```js-nolint
createEvent(type)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện cần tạo. Các loại sự kiện có thể bao gồm `"UIEvents"`, `"MouseEvents"`, `"MutationEvents"` và `"HTMLEvents"`. Xem phần [Ghi chú](#notes) để biết chi tiết.

### Giá trị trả về

Một đối tượng [Event](/en-US/docs/Web/API/Event).

## Ví dụ

```js
// Create the event.
const event = document.createEvent("Event");

// Define that the event name is 'build'.
event.initEvent("build", true, true);

// Listen for the event.
elem.addEventListener("build", (e) => {
  // e.target matches elem
});

// Target can be any Element or other EventTarget.
elem.dispatchEvent(event);
```

## Ghi chú

Các chuỗi loại sự kiện phù hợp để truyền cho `createEvent()` được liệt kê trong [tiêu chuẩn DOM — xem bảng trong bước 2](https://dom.spec.whatwg.org/#dom-document-createevent). Lưu ý rằng hầu hết các đối tượng sự kiện hiện có constructors, đây là cách được khuyến nghị hiện đại để tạo các instance đối tượng sự kiện.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Tạo và phân phối sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
