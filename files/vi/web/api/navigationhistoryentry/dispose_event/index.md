---
title: "NavigationHistoryEntry: dispose event"
short-title: dispose
slug: Web/API/NavigationHistoryEntry/dispose_event
page-type: web-api-event
browser-compat: api.NavigationHistoryEntry.dispose_event
---

{{APIRef("Navigation API")}}

Sự kiện **`dispose`** của giao diện {{domxref("NavigationHistoryEntry")}} được kích hoạt khi mục không còn là một phần của danh sách các mục lịch sử.

Việc dispose xảy ra khi:

- Các mục lịch sử phía trước bị xóa. Xem ví dụ tại [Notifications on entry disposal](https://github.com/wicg/navigation-api#notifications-on-entry-disposal) để biết thêm thông tin.
- Người dùng xóa lịch sử trình duyệt bằng cài đặt hoặc giao diện được cung cấp.
- Vượt quá giới hạn lịch sử. Điều này không được đặc tả ở đâu, nhưng các trình duyệt thường có giới hạn lịch sử là 50 trang.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dispose", (event) => { })

ondispose = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} tổng quát.

## Ví dụ

```js
navigation.addEventListener("currententrychange", () => {
  navigation.currentEntry.addEventListener("dispose", disposeHandler);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
