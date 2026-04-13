---
title: "FetchEvent: thuộc tính handled"
short-title: handled
slug: Web/API/FetchEvent/handled
page-type: web-api-instance-property
browser-compat: api.FetchEvent.handled
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Thuộc tính **`handled`** của giao diện {{DOMxRef("FetchEvent")}} trả về một promise cho biết liệu sự kiện đã được xử lý bởi thuật toán tìm nạp hay chưa. Thuộc tính này cho phép thực thi mã sau khi trình duyệt đã xử lý phản hồi, và thường được dùng cùng với phương thức {{DOMxRef("ExtendableEvent.waitUntil", "waitUntil()")}}.

## Giá trị

Một {{jsxref("Promise")}} đang chờ trong khi sự kiện chưa được xử lý, và được thực hiện khi đã xử lý xong.

## Ví dụ

```js
addEventListener("fetch", (event) => {
  event.respondWith(
    (async function () {
      const response = await doCalculateAResponse(event.request);

      event.waitUntil(
        (async function () {
          await doSomeAsyncStuff(); // tùy chọn

          // Chờ sự kiện được trình duyệt xử lý
          await event.handled;

          return doFinalStuff(); // Hoàn tất SAU KHI sự kiện đã được xử lý
        })(),
      );

      return response;
    })(),
  );
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("ExtendableEvent.waitUntil()")}}
