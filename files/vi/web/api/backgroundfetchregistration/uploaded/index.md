---
title: "BackgroundFetchRegistration: uploaded property"
short-title: uploaded
slug: Web/API/BackgroundFetchRegistration/uploaded
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.uploaded
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`uploaded`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về kích thước theo byte đã được gửi thành công, ban đầu là `0`.

Nếu giá trị của thuộc tính này thay đổi, sự kiện [progress](/vi/docs/Web/API/BackgroundFetchRegistration/progress_event) sẽ được kích hoạt trên đối tượng {{domxref("BackgroundFetchRegistration")}} liên quan.

## Giá trị

Một {{jsxref("number")}}.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về số byte đã tải lên.

```js
console.log(bgFetch.uploaded);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
