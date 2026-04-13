---
title: "PressureObserver: phương thức observe()"
short-title: observe()
slug: Web/API/PressureObserver/observe
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.PressureObserver.observe
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Phương thức **`observe()`** của giao diện {{domxref("PressureObserver")}} yêu cầu pressure observer bắt đầu quan sát các thay đổi áp lực. Sau khi phương thức này được gọi, observer sẽ gọi hàm callback của nó khi một bản ghi áp lực cho `source` được chỉ định được quan sát.

Khi nhận được {{domxref("PressureRecord")}} phù hợp, hàm callback của pressure observer sẽ được gọi.

## Cú pháp

```js-nolint
observe(source)
observe(source, options)
```

### Tham số

- `source`
  - : Một chuỗi chỉ định {{domxref("PressureRecord.source", "source")}} nào cần quan sát. Xem {{domxref("PressureRecord.source")}} để biết danh sách các nguồn và {{domxref("PressureObserver.knownSources_static", "PressureObserver.knownSources")}} để biết danh sách các nguồn mà user agent hỗ trợ.
- `options` {{optional_inline}}
  - : Một đối tượng để cấu hình việc quan sát với các thuộc tính sau:
    - `sampleInterval` {{optional_inline}}
      - : Một số đại diện cho khoảng thời gian lấy mẫu được yêu cầu, tính bằng mili giây. Mặc định là 0, nghĩa là sẽ nhận cập nhật nhanh nhất mà hệ thống có thể xử lý.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với {{jsxref("undefined")}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API) bị từ chối bởi {{httpheader('Permissions-Policy/compute-pressure','compute-pressure')}} [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `source` không phải là một trong các nguồn được hỗ trợ cho user agent này.

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
