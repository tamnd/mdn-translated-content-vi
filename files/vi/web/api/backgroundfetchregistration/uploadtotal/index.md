---
title: "BackgroundFetchRegistration: uploadTotal property"
short-title: uploadTotal
slug: Web/API/BackgroundFetchRegistration/uploadTotal
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.uploadTotal
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`uploadTotal`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về tổng số byte sẽ được gửi tới máy chủ.

## Giá trị

Một {{jsxref("number")}}.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về tổng số byte của lượt tải lên này.

```js
console.log(bgFetch.uploadTotal);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
