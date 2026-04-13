---
title: "NavigationHistoryEntry: id property"
short-title: id
slug: Web/API/NavigationHistoryEntry/id
page-type: web-api-instance-property
browser-compat: api.NavigationHistoryEntry.id
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về `id` của mục lịch sử, hoặc một chuỗi rỗng nếu tài liệu hiện tại không hoạt động đầy đủ. Đây là một giá trị duy nhất do UA tạo ra, luôn đại diện cho một mục lịch sử cụ thể, hữu ích để đối chiếu với tài nguyên bên ngoài như bộ nhớ đệm lưu trữ.

Điều này khác với {{domxref("NavigationHistoryEntry.key", "key")}} của một mục lịch sử. `key` là một giá trị duy nhất do UA tạo ra, đại diện cho vị trí của mục trong danh sách thay vì chính mục đó. Nó được dùng để điều hướng đến vị trí cụ thể đó thông qua {{domxref("Navigation.traverseTo()")}}.

## Giá trị

Một chuỗi biểu thị `id` của {{domxref("NavigationHistoryEntry")}}.

## Ví dụ

```js
const current = navigation.currentEntry;
console.log(current.id);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
