---
title: "Navigator: thuộc tính hardwareConcurrency"
short-title: hardwareConcurrency
slug: Web/API/Navigator/hardwareConcurrency
page-type: web-api-instance-property
browser-compat: api.Navigator.hardwareConcurrency
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`navigator.hardwareConcurrency`**
trả về số lượng bộ xử lý logic có sẵn để chạy các luồng trên máy chủ của người dùng
máy tính.

## Giá trị

Một số từ 1 đến số bộ xử lý logic có khả năng có sẵn cho tác nhân người dùng.

Các máy tính hiện đại có nhiều lõi xử lý vật lý trong CPU của chúng (hai hoặc bốn lõi
là điển hình), nhưng mỗi lõi vật lý cũng thường có thể chạy nhiều hơn một luồng tại
một thời gian bằng cách sử dụng các kỹ thuật lập kế hoạch nâng cao. Vì vậy, một CPU bốn lõi có thể cung cấp tám
**lõi xử lý logic** chẳng hạn. Số lượng bộ xử lý logic
lõi có thể được sử dụng để đo số lượng luồng có thể chạy hiệu quả cùng một lúc
mà không cần phải chuyển đổi ngữ cảnh.

Tuy nhiên, trình duyệt có thể chọn báo cáo số lõi logic thấp hơn để
thể hiện chính xác hơn số lượng {{domxref("Worker")}} có thể chạy cùng một lúc, vì vậy
đừng coi đây là phép đo tuyệt đối về số lượng lõi trong hệ thống của người dùng.

## Ví dụ

Trong ví dụ này, một {{domxref("Worker")}} được tạo cho mỗi bộ xử lý logic
được trình duyệt báo cáo và một bản ghi được tạo bao gồm tham chiếu đến phiên bản mới
công nhân cũng như giá trị Boolean cho biết liệu chúng ta có đang sử dụng công nhân đó hay không;
lần lượt, những đối tượng này được lưu trữ thành một mảng để sử dụng sau này. Điều này tạo ra một tập hợp
công nhân mà chúng tôi có thể sử dụng để xử lý các yêu cầu sau này.

```js
let workerList = [];

for (let i = 0; i < window.navigator.hardwareConcurrency; i++) {
  let newWorker = {
    worker: new Worker("cpu-worker.js"),
    inUse: false,
  };
  workerList.push(newWorker);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Navigator")}}
- {{domxref("WorkerNavigator")}}
