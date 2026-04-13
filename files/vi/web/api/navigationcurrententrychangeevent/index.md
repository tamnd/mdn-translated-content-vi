---
title: NavigationCurrentEntryChangeEvent
slug: Web/API/NavigationCurrentEntryChangeEvent
page-type: web-api-interface
browser-compat: api.NavigationCurrentEntryChangeEvent
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationCurrentEntryChangeEvent`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} là đối tượng sự kiện cho sự kiện {{domxref("Navigation/currententrychange_event", "currententrychange")}}, kích hoạt khi {{domxref("Navigation.currentEntry")}} đã thay đổi.

Sự kiện này sẽ kích hoạt đối với các điều hướng cùng tài liệu (ví dụ: {{domxref("Navigation.back", "back()")}} hoặc {{domxref("Navigation.traverseTo", "traverseTo()")}}), thay thế (tức là lệnh gọi {{domxref("Navigation.navigate", "navigate()")}} với `history` được đặt thành `replace`), hoặc các lệnh gọi khác thay đổi trạng thái của mục (ví dụ: {{domxref("Navigation.updateCurrentEntry", "updateCurrentEntry()")}}, hoặc {{domxref("History.replaceState()")}} của {{domxref("History API", "History API", "", "nocode")}}).

Sự kiện này kích hoạt sau khi điều hướng được xác nhận, nghĩa là URL hiển thị đã thay đổi và bản cập nhật {{domxref("NavigationHistoryEntry")}} đã xảy ra. Nó hữu ích để di chuyển từ việc sử dụng các tính năng API cũ hơn như sự kiện {{domxref("Window/hashchange_event", "hashchange")}} hoặc {{domxref("Window/popstate_event", "popstate")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("NavigationCurrentEntryChangeEvent.NavigationCurrentEntryChangeEvent", "NavigationCurrentEntryChangeEvent()")}}
  - : Tạo một thực thể đối tượng `NavigationCurrentEntryChangeEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("Event")}}._

- {{domxref("NavigationCurrentEntryChangeEvent.from", "from")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("NavigationHistoryEntry")}} đã được điều hướng từ đó.
- {{domxref("NavigationCurrentEntryChangeEvent.navigationType", "navigationType")}} {{ReadOnlyInline}}
  - : Trả về loại điều hướng đã dẫn đến thay đổi.

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
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api))
