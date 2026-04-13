---
title: "MessageEvent: thuộc tính lastEventId"
short-title: lastEventId
slug: Web/API/MessageEvent/lastEventId
page-type: web-api-instance-property
browser-compat: api.MessageEvent.lastEventId
---

{{APIRef("HTML DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lastEventId`** của giao diện {{domxref("MessageEvent")}} là một chuỗi đại diện cho ID duy nhất cho sự kiện.

## Giá trị

Một chuỗi đại diện cho ID.

## Ví dụ

```js
myWorker.onmessage = (e) => {
  result.textContent = e.data;
  console.log("Message received from worker");
  console.log(e.lastEventId);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ExtendableMessageEvent")}} — tương tự giao diện này nhưng được sử dụng trong các giao diện cần cung cấp thêm tính linh hoạt cho các tác giả.
