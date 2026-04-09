---
title: "BackgroundFetchRegistration: downloaded property"
short-title: downloaded
slug: Web/API/BackgroundFetchRegistration/downloaded
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.downloaded
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`downloaded`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về kích thước theo byte đã được tải xuống, ban đầu là `0`.

Nếu giá trị của thuộc tính này thay đổi, sự kiện [progress](/vi/docs/Web/API/BackgroundFetchRegistration/progress_event) sẽ được kích hoạt trên đối tượng {{domxref("BackgroundFetchRegistration")}} liên quan.

## Giá trị

Một {{jsxref("number")}}.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về số byte đã tải xuống.

```js
console.log(bgFetch.downloaded);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
