---
title: "Navigation: sự kiện navigateerror"
short-title: navigateerror
slug: Web/API/Navigation/navigateerror_event
page-type: web-api-event
browser-compat: api.Navigation.navigateerror_event
---

{{APIRef("Navigation API")}}

Sự kiện **`navigateerror`** của giao diện {{domxref("Navigation")}} được phát ra khi một điều hướng thất bại.

Ví dụ, nếu mạng bị ngắt kết nối, bất kỳ phương thức {{domxref("Window/fetch", "fetch()")}} nào được gọi để xử lý điều hướng sẽ thất bại, và lỗi sẽ được chuyển đến `navigateerror`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("navigateerror", (event) => { })

onnavigateerror = (event) => { }
```

## Loại sự kiện

Một {{domxref("ErrorEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("ErrorEvent")}}

## Ví dụ

Bạn có thể xử lý điều hướng thành công bằng cách ẩn chỉ báo tiến trình đã được hiển thị trước đó, như sau:

```js
navigation.addEventListener("navigatesuccess", (event) => {
  loadingIndicator.hidden = true;
});
```

Hoặc bạn có thể hiển thị thông báo lỗi khi thất bại:

```js
navigation.addEventListener("navigateerror", (event) => {
  loadingIndicator.hidden = true; // also hide indicator
  showMessage(`Failed to load page: ${event.message}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
