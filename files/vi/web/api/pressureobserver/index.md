---
title: PressureObserver
slug: Web/API/PressureObserver
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PressureObserver
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Giao diện **`PressureObserver`** là một phần của [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API) và được dùng để quan sát các thay đổi áp lực của tài nguyên hệ thống như CPU.

## Hàm khởi tạo

- {{domxref("PressureObserver.PressureObserver","PressureObserver()")}} {{experimental_inline}}
  - : Tạo và trả về một đối tượng `PressureObserver` mới.

## Thuộc tính tĩnh

- {{domxref("PressureObserver.knownSources_static", "PressureObserver.knownSources")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một mảng các giá trị {{domxref("PressureRecord.source","source")}} được user agent hỗ trợ.

## Phương thức phiên bản

- {{domxref("PressureObserver.observe","PressureObserver.observe()")}} {{experimental_inline}}
  - : Gọi hàm callback của pressure observer khi một bản ghi áp lực cho `source` được chỉ định được quan sát.
- {{domxref("PressureObserver.unobserve","PressureObserver.unobserve()")}} {{experimental_inline}}
  - : Dừng hàm callback của pressure observer nhận bản ghi áp lực từ `source` được chỉ định.
- {{domxref("PressureObserver.disconnect","PressureObserver.disconnect()")}} {{experimental_inline}}
  - : Dừng hàm callback của pressure observer nhận bản ghi áp lực từ tất cả các nguồn.
- {{domxref("PressureObserver.takeRecords","PressureObserver.takeRecords()")}} {{experimental_inline}}
  - : Trả về danh sách hiện tại các bản ghi áp lực được lưu trong pressure observer, đồng thời xóa rỗng nó.

## Ví dụ

### Ghi lại áp lực hiện tại

Ví dụ này tạo một `PressureObserver` và thực hiện hành động mỗi khi có thay đổi áp lực. Khoảng lấy mẫu được đặt thành 1000ms, nghĩa là sẽ có các cập nhật tối đa mỗi giây.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure ${lastRecord.state}`);
  if (lastRecord.state === "critical") {
    // disable video feeds
  } else if (lastRecord.state === "serious") {
    // disable video filter effects
  } else {
    // enable all video feeds and filter effects
  }
}

try {
  const observer = new PressureObserver(callback);
  await observer.observe("cpu", {
    sampleInterval: 1000, // 1000ms
  });
} catch (error) {
  // report error setting up the observer
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('PerformanceObserver')}}
- {{domxref('MutationObserver')}}
- {{domxref('ResizeObserver')}}
- {{domxref('IntersectionObserver')}}
