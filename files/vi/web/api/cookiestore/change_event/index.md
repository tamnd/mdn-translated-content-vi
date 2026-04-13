---
title: "CookieStore: sự kiện change"
short-title: change
slug: Web/API/CookieStore/change_event
page-type: web-api-event
browser-compat: api.CookieStore.change_event
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}

Sự kiện `change` được kích hoạt tại đối tượng {{domxref("CookieStore")}} khi có thay đổi đối với bất kỳ cookie nào.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("CookieChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("CookieChangeEvent")}}

## Ví dụ

Để được thông báo khi một cookie thay đổi, bạn có thể thêm trình xử lý cho thực thể `cookieStore` bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}}, như sau:

```js
cookieStore.addEventListener("change", (event) => {
  console.log("1 change event");
});
```

Ngoài ra, bạn có thể dùng thuộc tính trình xử lý sự kiện `onchange` để thiết lập trình xử lý cho sự kiện `change`:

```js
cookieStore.onchange = (event) => {
  console.log("1 change event");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
