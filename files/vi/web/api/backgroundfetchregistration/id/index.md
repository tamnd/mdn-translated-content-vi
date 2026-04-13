---
title: "BackgroundFetchRegistration: id property"
short-title: id
slug: Web/API/BackgroundFetchRegistration/id
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.id
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về một bản sao của `ID` của tác vụ tìm nạp nền.

## Giá trị

Một chuỗi.

## Ví dụ

Ghi phần này ra console sẽ trả về mã định danh được đặt khi đăng ký lượt tìm nạp. Trong trường hợp này là `"my-fetch"`.

```js
console.log(bgFetch.id); // "my-fetch"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
