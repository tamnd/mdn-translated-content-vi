---
title: "BackgroundFetchRegistration: recordsAvailable property"
short-title: recordsAvailable
slug: Web/API/BackgroundFetchRegistration/recordsAvailable
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.recordsAvailable
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`recordsAvailable`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về `true` nếu có các yêu cầu và phản hồi để truy cập. Nếu giá trị này trả về `false` thì không thể dùng {{domxref("BackgroundFetchRegistration.match()","match()")}} và {{domxref("BackgroundFetchRegistration.matchAll()","matchAll()")}}.

## Giá trị

Một {{jsxref("boolean")}}.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về `true` hoặc `false` để cho biết có bản ghi hay không.

```js
console.log(bgFetch.recordsAvailable);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
