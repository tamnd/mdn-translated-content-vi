---
title: "NavigationTransition: navigationType property"
short-title: navigationType
slug: Web/API/NavigationTransition/navigationType
page-type: web-api-instance-property
browser-compat: api.NavigationTransition.navigationType
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`navigationType`** của giao diện {{domxref("NavigationTransition")}} trả về loại điều hướng đang diễn ra.

## Giá trị

Giá trị liệt kê đại diện cho loại điều hướng đang diễn ra.

Các giá trị có thể là:

- `push`: Một vị trí mới được điều hướng đến, khiến một mục mới được đẩy vào danh sách lịch sử.
- `reload`: {{domxref("Navigation.currentEntry")}} được tải lại.
- `replace`: {{domxref("Navigation.currentEntry")}} được thay thế bằng mục lịch sử mới. Mục mới này sẽ sử dụng lại cùng {{domxref("NavigationHistoryEntry.key", "key")}}, nhưng được gán một {{domxref("NavigationHistoryEntry.id", "id")}} khác.
- `traverse`: Trình duyệt điều hướng từ một mục lịch sử hiện có sang một mục lịch sử hiện có khác.

## Ví dụ

```js
console.log(navigation.transition.navigationType);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
