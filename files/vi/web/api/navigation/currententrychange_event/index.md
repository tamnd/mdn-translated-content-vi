---
title: "Navigation: sự kiện currententrychange"
short-title: currententrychange
slug: Web/API/Navigation/currententrychange_event
page-type: web-api-event
browser-compat: api.Navigation.currententrychange_event
---

{{APIRef("Navigation API")}}

Sự kiện **`currententrychange`** của giao diện {{domxref("Navigation")}} được phát ra khi {{domxref("Navigation.currentEntry")}} đã thay đổi.

Sự kiện này sẽ phát ra cho:

- Các điều hướng cùng tài liệu (ví dụ: {{domxref("Navigation.back", "back()")}} hoặc {{domxref("Navigation.traverseTo", "traverseTo()")}}).

- Các thay thế (tức là, cuộc gọi {{domxref("Navigation.navigate", "navigate()")}} với `history` được đặt thành `replace`).

- Các cuộc gọi khác thay đổi trạng thái của mục (ví dụ: {{domxref("Navigation.updateCurrentEntry", "updateCurrentEntry()")}}, hoặc {{domxref("History.replaceState()")}} của {{domxref("History API", "History API", "", "nocode")}}).

Sự kiện này phát ra sau khi điều hướng được xác nhận, nghĩa là URL hiển thị đã thay đổi và cập nhật {{domxref("NavigationHistoryEntry")}} đã xảy ra. Nó hữu ích để chuyển đổi từ việc sử dụng các tính năng API cũ hơn như sự kiện {{domxref("Window/hashchange_event", "hashchange")}} hoặc {{domxref("Window/popstate_event", "popstate")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("currententrychange", (event) => { })

oncurrententrychange = (event) => { }
```

## Loại sự kiện

Một {{domxref("NavigationCurrentEntryChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("NavigationCurrentEntryChangeEvent")}}

## Ví dụ

Báo cáo dữ liệu điều hướng:

```js
navigation.addEventListener("currententrychange", () => {
  const data = navigation.currentEntry.getState();
  submitAnalyticsData(data.analytics);
});
```

Thiết lập sự kiện theo từng mục:

```js
navigation.addEventListener("currententrychange", () => {
  navigation.currentEntry.addEventListener("dispose", genericDisposeHandler);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
