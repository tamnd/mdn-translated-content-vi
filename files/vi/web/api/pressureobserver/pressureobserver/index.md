---
title: "PressureObserver: hàm khởi tạo PressureObserver()"
short-title: PressureObserver()
slug: Web/API/PressureObserver/PressureObserver
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.PressureObserver.PressureObserver
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Hàm khởi tạo **`PressureObserver()`** tạo một đối tượng {{domxref("PressureObserver")}} mới để theo dõi các thay đổi áp lực của tài nguyên hệ thống như CPU.

## Cú pháp

```js-nolint
new PressureObserver(callback)
```

### Tham số

- `callback`
  - : Một hàm callback sẽ được gọi khi các bản ghi áp lực được quan sát. Khi callback được gọi, các tham số sau đây có sẵn:
    - `changes`
      - : Một mảng chứa tất cả các đối tượng {{domxref("PressureRecord")}} được ghi lại kể từ lần cuối callback được gọi, hoặc lần cuối phương thức {{domxref("PressureObserver.takeRecords", "takeRecords()")}} của observer được gọi.
    - `observer`
      - : Đối tượng {{domxref("PressureObserver","observer")}} đang nhận các bản ghi ở trên.

### Giá trị trả về

Một đối tượng {{domxref("PressureObserver")}} mới với hàm `callback` được chỉ định, sẽ được gọi khi {{domxref("PressureObserver.observe()")}} được gọi để theo dõi thay đổi áp lực.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API) bị từ chối bởi {{httpheader('Permissions-Policy/compute-pressure','compute-pressure')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).

## Ví dụ

### Ghi lại áp lực hiện tại

Ví dụ này tạo một {{domxref("PressureObserver")}} và thực hiện hành động mỗi khi có thay đổi áp lực. Khoảng lấy mẫu được đặt thành 1000ms, nghĩa là sẽ có các cập nhật tối đa mỗi giây.

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
