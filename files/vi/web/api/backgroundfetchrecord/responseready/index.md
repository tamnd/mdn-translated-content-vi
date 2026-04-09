---
title: "BackgroundFetchRecord: thuộc tính responseReady"
short-title: responseReady
slug: Web/API/BackgroundFetchRecord/responseReady
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRecord.responseReady
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`responseReady`** của giao diện {{domxref("BackgroundFetchRecord")}} trả về một {{jsxref("Promise")}} phân giải với một {{domxref("Response")}}.

## Giá trị

Một {{jsxref("Promise")}} phân giải với một {{domxref("Response")}}.

## Ví dụ

Trong ví dụ này, một `BackgroundFetchRecord` riêng lẻ được trả về bằng {{domxref("BackgroundFetchManager.fetch()","BackgroundFetchManager.fetch()")}}. Giá trị của `responseReady` được trả về và ghi ra console.

```js
bgFetch.match("/ep-5.mp3").then(async (record) => {
  if (!record) {
    console.log("No record found");
    return;
  }

  const response = await record.responseReady;
  console.log(`Here's the response`, response);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
