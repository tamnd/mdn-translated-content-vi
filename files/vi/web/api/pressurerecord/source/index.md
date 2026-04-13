---
title: "PressureRecord: source property"
short-title: source
slug: Web/API/PressureRecord/source
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PressureRecord.source
---

{{APIRef("Compute Pressure API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_service")}}{{securecontext_header}}

Thuộc tính chỉ đọc **`source`** là một chuỗi cho biết nguồn gốc mà từ đó bản ghi được gửi đến.

## Giá trị

Một chuỗi cho biết nguồn gốc mà từ đó bản ghi được gửi đến. Phiên bản hiện tại của đặc tả Compute Pressure API hỗ trợ hai loại nguồn chính:

- `"thermals"` đại diện cho trạng thái nhiệt toàn cầu của toàn bộ hệ thống.
- `"cpu"` đại diện cho áp lực trung bình của bộ xử lý trung tâm (CPU) trên tất cả các lõi của nó. Trạng thái này có thể bị ảnh hưởng bởi các ứng dụng và trang web khác ngoài trang web đang quan sát.

Sử dụng gợi ý tĩnh {{domxref("PressureObserver.knownSources_static", "PressureObserver.knownSources")}} để xem loại nguồn nào được trình duyệt của bạn hỗ trợ. Lưu ý rằng tính khả dụng cũng có thể thay đổi theo hệ điều hành và phần cứng của bạn. Gọi {{domxref("PressureObserver.observe()", "observe()")}} và kiểm tra `NotSupportedError` để xem liệu quan sát áp lực có thể thực hiện được không.

## Ví dụ

### Sử dụng thuộc tính `source`

Trong ví dụ sau, chúng ta ghi lại giá trị của thuộc tính `source` trong callback của pressure observer.

```js
function callback(records) {
  const lastRecord = records[records.length - 1];
  console.log(`Current pressure source: ${lastRecord.source}`);
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
