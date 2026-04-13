---
title: "NavigationDestination: thuộc tính id"
short-title: id
slug: Web/API/NavigationDestination/id
page-type: web-api-instance-property
browser-compat: api.NavigationDestination.id
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("NavigationDestination")}} trả về giá trị {{domxref("NavigationHistoryEntry.id", "id")}} của {{domxref("NavigationHistoryEntry")}} đích nếu {{domxref("NavigateEvent.navigationType")}} là `traverse`, hoặc một chuỗi rỗng nếu không.

`id` là một giá trị duy nhất do UA tạo ra, luôn đại diện cho mục lịch sử, hữu ích để liên kết một mục lịch sử với một tài nguyên bên ngoài như bộ đệm lưu trữ.

## Giá trị

Một chuỗi đại diện cho `id` của {{domxref("NavigationHistoryEntry")}} đích, hoặc một chuỗi rỗng.

## Ví dụ

```js
navigation.addEventListener("navigate", (event) => {
  console.log(event.destination.id);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
