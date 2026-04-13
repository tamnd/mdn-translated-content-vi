---
title: "PopStateEvent: state property"
short-title: state
slug: Web/API/PopStateEvent/state
page-type: web-api-instance-property
browser-compat: api.PopStateEvent.state
---

{{ APIRef("History API") }}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("PopStateEvent")}} đại diện cho trạng thái được lưu trữ khi sự kiện được tạo.

Thực tế là giá trị được cung cấp bởi lệnh gọi {{domxref("history.pushState()")}} hoặc {{domxref("history.replaceState()")}}.

## Giá trị

Một đối tượng hoặc `null`.

## Ví dụ

Code bên dưới ghi log giá trị của `state` khi sử dụng phương thức {{domxref("History.pushState","pushState()")}} để đẩy giá trị vào lịch sử.

```js
// Log the state of
addEventListener("popstate", (event) => {
  console.log("State received: ", event.state);
});

// Now push something on the stack
history.pushState({ name: "Example" }, "pushState example", "page1.html");
history.pushState(
  { name: "Another example" },
  "pushState example",
  "page1.html",
);
```

Kết quả sẽ ghi log:

```plain
State received: { name: "Example" }
State received: { name: "Another example" }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("PopStateEvent()")}}
- {{domxref("History.state")}}
