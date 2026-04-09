---
title: "BackgroundFetchRegistration: failureReason property"
short-title: failureReason
slug: Web/API/BackgroundFetchRegistration/failureReason
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.BackgroundFetchRegistration.failureReason
---

{{APIRef("Background Fetch API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`failureReason`** của giao diện {{domxref("BackgroundFetchRegistration")}} trả về một chuỗi có giá trị cho biết nguyên nhân khiến tác vụ tìm nạp nền thất bại.

Nếu giá trị của thuộc tính này thay đổi, sự kiện [progress](/vi/docs/Web/API/BackgroundFetchRegistration/progress_event) sẽ được kích hoạt trên đối tượng {{domxref("BackgroundFetchRegistration")}} liên quan.

## Giá trị

Một trong các chuỗi sau:

- `""`
  - : Tác vụ tìm nạp nền chưa hoàn tất hoặc đã thành công.
- `"aborted"`
  - : Thao tác đã bị người dùng hủy, hoặc {{domxref("BackgroundFetchRegistration.abort()","abort()")}} đã được gọi.
- `"bad-status"`
  - : Một phản hồi có trạng thái không `ok`, tức là mã trạng thái nằm ngoài khoảng 200-299.
- `"fetch-error"`
  - : Một lượt tìm nạp thất bại vì các lý do khác, ví dụ CORS hoặc lỗi mạng.
- `"quota-exceeded"`
  - : Đã chạm hạn ngạch lưu trữ trong quá trình thao tác.
- `"download-total-exceeded"`
  - : Giá trị `downloadTotal` được cung cấp đã bị vượt quá. Giá trị này được đặt khi tác vụ tìm nạp nền được đăng ký.

## Ví dụ

Ghi thuộc tính này ra console sẽ in ra lý do khiến lượt tìm nạp thất bại, hoặc một chuỗi rỗng nếu nó thành công hoặc chưa hoàn tất.

```js
console.log(bgFetch.failureReason);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
