---
title: History API
slug: Web/API/History_API
page-type: web-api-overview
browser-compat: api.History
---

{{DefaultAPISidebar("History API")}}

**History API** cung cấp quyền truy cập vào lịch sử phiên của trình duyệt, không nên nhầm lẫn với [WebExtensions history](/en-US/docs/Mozilla/Add-ons/WebExtensions/API/history), thông qua đối tượng toàn cục {{DOMxRef("Window.history","history")}}. Nó cung cấp các phương thức và thuộc tính hữu ích cho phép bạn điều hướng qua lại trong lịch sử của người dùng, cũng như thao tác nội dung của ngăn xếp lịch sử.

> [!NOTE]
> API này chỉ khả dụng trên luồng chính ({{domxref("Window")}}). Không thể truy cập nó trong các ngữ cảnh {{domxref("Worker")}} hoặc {{domxref("Worklet")}}.

## Khái niệm và cách dùng

Việc di chuyển lùi và tiến trong lịch sử của người dùng được thực hiện bằng các phương thức {{DOMxRef("History.back","back()")}}, {{DOMxRef("History.forward","forward()")}} và {{DOMxRef("History.go","go()")}}.

### Di chuyển tiến và lùi

Để di chuyển lùi trong lịch sử:

```js
history.back();
```

Điều này hoạt động đúng như khi người dùng nhấn nút <kbd><strong>Back</strong></kbd> trên thanh công cụ của trình duyệt.

Tương tự, bạn có thể di chuyển tiến, giống như khi người dùng nhấn nút <kbd><strong>Forward</strong></kbd>, như sau:

```js
history.forward();
```

### Di chuyển đến một vị trí cụ thể trong lịch sử

Bạn có thể dùng phương thức {{DOMxRef("History.go","go()")}} để tải một trang cụ thể từ lịch sử phiên, được xác định bởi vị trí tương đối của nó so với trang hiện tại. (Vị trí tương đối của trang hiện tại là `0`.)

Để lùi một trang (tương đương với việc gọi {{DOMxRef("History.back","back()")}}):

```js
history.go(-1);
```

Để tiến một trang, tương tự như gọi {{DOMxRef("History.forward","forward()")}}:

```js
history.go(1);
```

Tương tự, bạn có thể tiến 2 trang bằng cách truyền `2`, và cứ tiếp tục như vậy.

Một cách dùng khác của phương thức `go()` là tải lại trang hiện tại bằng cách truyền `0` hoặc gọi nó mà không có đối số:

```js
// Hai câu lệnh sau
// đều có tác dụng
// tải lại trang
history.go(0);
history.go();
```

Bạn có thể xác định số lượng trang trong ngăn xếp lịch sử bằng cách xem giá trị của thuộc tính `length`:

```js
const numberOfEntries = history.length;
```

## Giao diện

- {{domxref("History")}}
  - : Cho phép thao tác lịch sử _phiên_ của trình duyệt, tức là các trang đã được truy cập trong tab hoặc khung mà trang hiện tại đang được tải.
- {{domxref("PopStateEvent")}}
  - : Giao diện của sự kiện {{domxref("Window.popstate_event", "popstate")}}.

## Ví dụ

Ví dụ sau gán một trình nghe cho sự kiện {{domxref("Window.popstate_event", "popstate")}}. Sau đó nó minh họa một số phương thức của đối tượng history để thêm, thay thế và di chuyển trong lịch sử trình duyệt của tab hiện tại.

```js
window.addEventListener("popstate", (event) => {
  alert(
    `location: ${document.location}, state: ${JSON.stringify(event.state)}`,
  );
});

history.pushState({ page: 1 }, "title 1", "?page=1");
history.pushState({ page: 2 }, "title 2", "?page=2");
history.replaceState({ page: 3 }, "title 3", "?page=3");
history.back(); // alerts "location: http://example.com/example.html?page=1, state: {"page":1}"
history.back(); // alerts "location: http://example.com/example.html, state: null"
history.go(2); // alerts "location: http://example.com/example.html?page=3, state: {"page":3}"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Đối tượng toàn cục {{domxref("window.history", "history")}}
- Sự kiện {{domxref("Window.popstate_event", "popstate")}}
