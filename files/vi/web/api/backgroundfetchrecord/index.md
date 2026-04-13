---
title: BackgroundFetchRecord
slug: Web/API/BackgroundFetchRecord
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BackgroundFetchRecord
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`BackgroundFetchRecord`** của {{domxref('Background Fetch API','','',' ')}} biểu diễn một yêu cầu và phản hồi riêng lẻ.

Một `BackgroundFetchRecord` được tạo bởi phương thức {{domxref("BackgroundFetchRegistration.match()","BackgroundFetchRegistration.matchAll()")}}, vì vậy giao diện này không có hàm khởi tạo.

Sẽ có một `BackgroundFetchRecord` cho mỗi tài nguyên được yêu cầu bởi `fetch()`.

## Thuộc tính thể hiện

- {{domxref("BackgroundFetchRecord.request","request")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("Request")}}.
- {{domxref("BackgroundFetchRecord.responseReady","responseReady")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một promise phân giải với một {{domxref("Response")}}.

## Ví dụ

Trong ví dụ này, một `BackgroundFetchRecord` riêng lẻ được trả về bằng {{domxref("BackgroundFetchRegistration.match()","BackgroundFetchRegistration.matchAll()")}}. {{domxref("BackgroundFetchRecord.request")}} và {{domxref("BackgroundFetchRecord.responseReady")}} được trả về và ghi ra console.

```js
bgFetch.match("/ep-5.mp3").then(async (record) => {
  if (!record) {
    console.log("No record found");
    return;
  }

  console.log(`Here's the request`, record.request);
  const response = await record.responseReady;
  console.log(`And here's the response`, response);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
