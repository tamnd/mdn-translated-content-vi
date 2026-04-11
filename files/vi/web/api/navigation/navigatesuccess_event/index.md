---
title: "Navigation: sự kiện navigatesuccess"
short-title: navigatesuccess
slug: Web/API/Navigation/navigatesuccess_event
page-type: web-api-event
browser-compat: api.Navigation.navigatesuccess_event
---

{{APIRef("Navigation API")}}

Sự kiện **`navigatesuccess`** của giao diện {{domxref("Navigation")}} được phát ra khi một điều hướng thành công đã hoàn tất.

Trong trường hợp điều hướng bị chặn, điều này sẽ xảy ra sau khi tất cả các promise được trả về bởi trình xử lý {{domxref("NavigateEvent.intercept", "intercept()")}} của bạn đều được thực hiện. Promise {{domxref("NavigationTransition.finished")}} cũng sẽ được thực hiện cùng lúc.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("navigatesuccess", (event) => { })

onnavigatesuccess = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

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
