---
title: "BackgroundFetchRegistration: downloadTotal property"
short-title: downloadTotal
slug: Web/API/BackgroundFetchRegistration/downloadTotal
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.downloadTotal
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`downloadTotal`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về tổng kích thước theo byte của lượt tải xuống này. Giá trị này được đặt khi tác vụ tìm nạp nền được đăng ký, hoặc là `0` nếu không được đặt.

## Giá trị

Một {{jsxref("number")}}.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về tổng kích thước theo byte của lượt tải xuống này.

```js
console.log(bgFetch.downloadTotal);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
