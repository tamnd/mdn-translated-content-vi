---
title: "NavigationHistoryEntry: url property"
short-title: url
slug: Web/API/NavigationHistoryEntry/url
page-type: web-api-instance-property
browser-compat: api.NavigationHistoryEntry.url
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`url`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về URL tuyệt đối của mục lịch sử này. Nếu mục đó tương ứng với một `Document` khác với tài liệu hiện tại, và tài liệu đó được tìm nạp với tiêu đề {{httpheader("Referrer-Policy")}} là `no-referrer` hoặc `origin`, thuộc tính sẽ trả về `null`. Nếu tài liệu hiện tại không hoạt động đầy đủ, nó sẽ trả về một chuỗi rỗng.

## Giá trị

Một chuỗi biểu thị URL hoặc `null`.

## Ví dụ

```js
const current = navigation.currentEntry;
console.log(current.url);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
