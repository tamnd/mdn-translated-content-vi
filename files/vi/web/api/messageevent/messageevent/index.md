---
title: "MessageEvent: hàm khởi tạo MessageEvent()"
short-title: MessageEvent()
slug: Web/API/MessageEvent/MessageEvent
page-type: web-api-constructor
browser-compat: api.MessageEvent.MessageEvent
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Hàm khởi tạo **`MessageEvent()`** tạo một đối tượng {{domxref("MessageEvent")}} mới.

## Cú pháp

```js-nolint
new MessageEvent(type)
new MessageEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện. Nó phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `message`.
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Dữ liệu bạn muốn chứa trong MessageEvent. Đây có thể là bất kỳ kiểu dữ liệu nào, và sẽ mặc định thành `null` nếu không được chỉ định.
    - `origin` {{optional_inline}}
      - : Một chuỗi đại diện cho nguồn gốc của người phát thông điệp. Mặc định thành chuỗi rỗng (`''`) nếu không được chỉ định.
    - `lastEventId` {{optional_inline}}
      - : Một chuỗi đại diện cho ID duy nhất cho sự kiện. Mặc định thành chuỗi rỗng ("") nếu không được chỉ định.
    - `source` {{optional_inline}}
      - : Một `MessageEventSource` (có thể là {{domxref("Window")}}, {{domxref("MessagePort")}}, hoặc đối tượng {{domxref("ServiceWorker")}}) đại diện cho người phát thông điệp. Mặc định thành `null` nếu không được đặt.
    - `ports` {{optional_inline}}
      - : Một mảng các đối tượng {{domxref("MessagePort")}} chứa tất cả các đối tượng {{domxref("MessagePort")}} được gửi kèm với thông điệp, theo thứ tự. Mặc định thành mảng rỗng (`[]`) nếu không được chỉ định.

### Giá trị trả về

Một đối tượng {{domxref("MessageEvent")}} mới.

## Ví dụ

```js
const myMessage = new MessageEvent("message", {
  data: "hello",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
