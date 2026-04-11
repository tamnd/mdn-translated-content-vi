---
title: "NavigationHistoryEntry: index property"
short-title: index
slug: Web/API/NavigationHistoryEntry/index
page-type: web-api-instance-property
browser-compat: api.NavigationHistoryEntry.index
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`index`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về chỉ số của mục lịch sử trong danh sách các mục lịch sử, hoặc `-1` nếu mục đó không xuất hiện trong danh sách hoặc nếu tài liệu hiện tại không hoạt động đầy đủ.

## Giá trị

Một số biểu thị `index` của mục trong danh sách các mục lịch sử, hoặc `-1` nếu mục này không xuất hiện trong danh sách.

## Ví dụ

```js
const current = navigation.currentEntry;
console.log(current.index);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
