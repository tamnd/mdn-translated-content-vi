---
title: "BackgroundFetchRecord: thuộc tính request"
short-title: request
slug: Web/API/BackgroundFetchRecord/request
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRecord.request
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`request`** của giao diện {{domxref("BackgroundFetchRecord")}} trả về thông tin chi tiết của tài nguyên cần được tìm nạp.

## Giá trị

Một {{domxref("Request")}}.

## Ví dụ

Trong ví dụ này, một `BackgroundFetchRecord` riêng lẻ được trả về bằng {{domxref("BackgroundFetchManager.fetch()","BackgroundFetchManager.fetch()")}}. `request` được trả về và ghi ra console.

```js
bgFetch.match("/ep-5.mp3").then(async (record) => {
  if (!record) {
    console.log("No record found");
    return;
  }

  console.log(`Here's the request`, record.request);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
