---
title: "History: thuộc tính state"
short-title: state
slug: Web/API/History/state
page-type: web-api-instance-property
browser-compat: api.History.state
---

{{APIRef("History API")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{DOMxRef("History")}} trả về một giá trị biểu thị trạng thái ở đầu ngăn xếp lịch sử. Đây là cách xem trạng thái mà không cần chờ sự kiện {{domxref("Window/popstate_event", "popstate")}}.

## Giá trị

Trạng thái ở đầu ngăn xếp lịch sử. Giá trị là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) cho đến khi phương thức {{domxref("History.pushState","pushState()")}} hoặc {{domxref("History.replaceState","replaceState()")}} được sử dụng.

## Ví dụ

Đoạn mã dưới đây ghi lại giá trị của `history.state` trước khi dùng phương thức {{domxref("History.pushState","pushState()")}} để đẩy một giá trị vào lịch sử. Dòng tiếp theo lại ghi giá trị ra console, cho thấy `history.state` lúc này đã có giá trị.

```js
// Sẽ là null vì chúng ta chưa sửa đổi ngăn xếp lịch sử
console.log("History.state before pushState: ", history.state);

// Bây giờ đẩy một thứ gì đó vào ngăn xếp
history.pushState({ name: "Example" }, "pushState example", "page3.html");

// Bây giờ state đã có giá trị.
console.log("History.state after pushState: ", history.state);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API)
- [`History.pushState()`](/en-US/docs/Web/API/History/pushState)
- [`History.replaceState()`](/en-US/docs/Web/API/History/replaceState)
- [`PopStateEvent.state`](/en-US/docs/Web/API/PopStateEvent/state)
