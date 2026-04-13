---
title: "PressureObserver: phương thức disconnect()"
short-title: disconnect()
slug: Web/API/PressureObserver/disconnect
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PressureObserver.disconnect
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Phương thức **`disconnect()`** của giao diện {{domxref('PressureObserver')}} dừng hàm callback của pressure observer nhận bản ghi áp lực từ tất cả các nguồn.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Dừng một pressure observer

Ví dụ sau thu thập 20 mẫu rồi ngắt kết nối pressure observer để không nhận thêm bản ghi áp lực nào.

```js
const samples = [];

function pressureChange(records, observer) {
  for (const record of records) {
    samples.push(record.state);
    // We only want 20 samples
    if (samples.length === 20) {
      observer.disconnect();
      return;
    }
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
