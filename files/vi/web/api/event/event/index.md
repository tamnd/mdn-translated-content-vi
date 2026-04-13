---
title: "Event: hàm khởi tạo Event()"
short-title: Event()
slug: Web/API/Event/Event
page-type: web-api-constructor
browser-compat: api.Event.Event
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Hàm khởi tạo **`Event()`** tạo ra một đối tượng {{domxref("Event")}} mới. Một sự kiện được tạo theo cách này được gọi là _sự kiện tổng hợp_, trái ngược với sự kiện do trình duyệt kích hoạt, và có thể được [gửi đi](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events) bởi một script.

## Cú pháp

```js-nolint
new Event(type)
new Event(type, options)
```

### Giá trị

- `type`
  - : Một chuỗi chứa tên của sự kiện.
- `options` {{optional_inline}}
  - : Một đối tượng có các thuộc tính sau:
    - `bubbles` {{optional_inline}}
      - : Một giá trị boolean cho biết sự kiện có lan truyền hay không. Giá trị mặc định là
        `false`.
    - `cancelable` {{optional_inline}}
      - : Một giá trị boolean cho biết sự kiện có thể bị hủy hay không. Giá trị mặc định là
        `false`.
    - `composed` {{optional_inline}}
      - : Một giá trị boolean cho biết sự kiện có kích hoạt các bộ lắng nghe bên ngoài shadow root hay không (xem {{domxref("Event.composed")}} để biết thêm chi tiết). Giá trị mặc định là
        `false`.

### Giá trị trả về

Một đối tượng {{domxref("Event")}} mới.

## Ví dụ

```js
// tạo một sự kiện look lan truyền được và không thể bị hủy

const evt = new Event("look", { bubbles: true, cancelable: false });
document.dispatchEvent(evt);

// sự kiện có thể được gửi đi từ bất kỳ phần tử nào, không chỉ từ document
myDiv.dispatchEvent(evt);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Event")}}
- {{domxref("EventTarget.dispatchEvent()")}}
- [Tạo và gửi sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#creating_and_dispatching_events)
