---
title: "PressureObserver: phương thức takeRecords()"
short-title: takeRecords()
slug: Web/API/PressureObserver/takeRecords
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PressureObserver.takeRecords
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Phương thức **`takeRecords()`** của giao diện {{domxref('PressureObserver')}} trả về danh sách hiện tại các bản ghi áp lực được lưu trong pressure observer, đồng thời xóa rỗng nó.

Phương thức này hữu ích khi bạn muốn dừng quan sát một nguồn nhưng vẫn muốn đảm bảo nhận được các bản ghi chưa được truyền vào hàm callback của observer.

## Cú pháp

```js-nolint
takeRecords()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng {{domxref("PressureRecord")}}.

## Ví dụ

### Lấy các bản ghi

Ví dụ sau lưu danh sách hiện tại các bản ghi áp lực vào `records` và xóa rỗng pressure observer.

```js
const observer = new PressureObserver(callback);
observer.observe("cpu");

const records = observer.takeRecords();
observer.disconnect(); // shut down observer now that we've taken records

if (records.length > 0) {
  console.log(records[0].state);
  console.log(records[0].time);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
