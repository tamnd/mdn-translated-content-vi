---
title: "PerformanceObserver: phương thức takeRecords()"
short-title: takeRecords()
slug: Web/API/PerformanceObserver/takeRecords
page-type: web-api-instance-method
browser-compat: api.PerformanceObserver.takeRecords
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Phương thức **`takeRecords()`** của giao diện {{domxref('PerformanceObserver')}} trả về danh sách hiện tại các đối tượng {{domxref("PerformanceEntry")}} được lưu trong performance observer, đồng thời làm trống nó.

## Cú pháp

```js-nolint
takeRecords()
```

### Tham số

Không có.

### Giá trị trả về

Một danh sách các đối tượng {{domxref("PerformanceEntry")}}.

## Ví dụ

### Lấy các bản ghi

Ví dụ sau lưu danh sách hiện tại các performance entry vào `records` và làm trống performance observer.

```js
const observer = new PerformanceObserver((list, obj) => {
  list.getEntries().forEach((entry) => {
    // Xử lý các sự kiện "mark" và "measure"
  });
});
observer.observe({ entryTypes: ["mark", "measure"] });
const records = observer.takeRecords();
console.log(records[0].name);
console.log(records[0].startTime);
console.log(records[0].duration);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
