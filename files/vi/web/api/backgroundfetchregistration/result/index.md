---
title: "BackgroundFetchRegistration: result property"
short-title: result
slug: Web/API/BackgroundFetchRegistration/result
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.result
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`result`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về một chuỗi cho biết tác vụ tìm nạp nền đã thành công hay thất bại.

Nếu giá trị của thuộc tính này thay đổi, sự kiện [progress](/vi/docs/Web/API/BackgroundFetchRegistration/progress_event) sẽ được kích hoạt trên đối tượng {{domxref("BackgroundFetchRegistration")}} liên quan.

## Giá trị

Một trong các chuỗi sau:

- `""`
  - : Lượt tìm nạp đang hoạt động nên chưa có kết quả.
- `"success"`
  - : Tác vụ tìm nạp nền đã thành công.
- `"failure"`
  - : Tác vụ tìm nạp nền đã thất bại. Giá trị này chỉ xuất hiện khi trình duyệt không còn khả năng thử lại.

## Ví dụ

Ghi thuộc tính này ra console sẽ trả về một chuỗi cho biết trạng thái, hoặc một chuỗi rỗng nếu lượt tìm nạp vẫn đang hoạt động.

```js
console.log(bgFetch.result);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
