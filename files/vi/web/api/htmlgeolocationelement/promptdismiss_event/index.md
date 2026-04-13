---
title: "HTMLGeolocationElement: sự kiện promptdismiss"
short-title: promptdismiss
slug: Web/API/HTMLGeolocationElement/promptdismiss_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HTMLGeolocationElement.promptdismiss_event
---

{{APIRef("HTML DOM")}}{{SeeCompatTable}}

Sự kiện **`promptdismiss`** của giao diện {{domxref("HTMLGeolocationElement")}} được kích hoạt mỗi khi người dùng kích hoạt phần tử `<geolocation>` và đóng hộp thoại kết quả, bằng cách nhấn nút "đóng" hoặc phím <kbd>Esc</kbd>.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("promptdismiss", (event) => { })

onpromptdismiss = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}}.

## Ví dụ

### Sử dụng `promptdismiss` để phản hồi việc người dùng đóng lời nhắc quyền

Trong [bản demo Bản đồ nhúng](https://mdn.github.io/dom-examples/geolocation-element/embedded-map/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/geolocation-element/embedded-map)) của chúng tôi, chúng tôi sử dụng trình xử lý sự kiện `promptdismiss` để phản hồi người dùng đóng lời nhắc quyền `<geolocation>`:

```js
geo.addEventListener("promptdismiss", notifyUserRetrySelection);
```

Trong hàm `notifyUserRetrySelection()`, chúng tôi yêu cầu người dùng nhấn nút lần nữa và cho phép vị trí.

```js
function notifyUserRetrySelection() {
  statusElem.textContent =
    'Please press the "Use location" button again and allow location for this site.';
}
```

Xem trang chính {{domxref("HTMLGeolocationElement")}} để có hướng dẫn đầy đủ về ví dụ này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
