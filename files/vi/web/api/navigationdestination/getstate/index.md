---
title: "NavigationDestination: phương thức getState()"
short-title: getState()
slug: Web/API/NavigationDestination/getState
page-type: web-api-instance-method
browser-compat: api.NavigationDestination.getState
---

{{APIRef("Navigation API")}}

Phương thức **`getState()`** của giao diện {{domxref("NavigationDestination")}} trả về một bản sao của trạng thái do nhà phát triển cung cấp liên quan đến {{domxref("NavigationHistoryEntry")}} đích, hoặc thao tác điều hướng (ví dụ, {{domxref("Navigation.navigate()", "navigate()")}}) khi thích hợp.

## Cú pháp

```js-nolint
getState()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị đại diện cho trạng thái. Có thể là bất kỳ kiểu nào.

Nếu không có trạng thái nào được xác định, nó trả về `undefined`.

### Ngoại lệ

Không có.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  console.log(event.destination.getState());
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- Các phương thức cho phép cập nhật trạng thái: {{domxref("Navigation.navigate()")}}, {{domxref("Navigation.reload()")}}, và {{domxref("Navigation.updateCurrentEntry()")}}
