---
title: SharedStorageRunOperation
slug: Web/API/SharedStorageRunOperation
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.SharedStorageRunOperation
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Giao diện **`SharedStorageRunOperation`** của {{domxref("Shared Storage API", "Shared Storage API", "", "nocode")}} đại diện cho thao tác [Run output gate](/en-US/docs/Web/API/Shared_Storage_API#run).

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("SharedStorageRunOperation.run", "run()")}} {{Deprecated_Inline}}
  - : Xác định cấu trúc mà phương thức `run()` được định nghĩa bên trong thao tác Run output gate phải tuân theo.

## Ví dụ

Trong ví dụ này, một lớp tên `ReachMeasurementOperation` được định nghĩa trong worklet và được đăng ký sử dụng {{domxref("SharedStorageWorkletGlobalScope.register()")}} với tên `reach-measurement`. `SharedStorageRunOperation` xác định cấu trúc mà lớp này phải tuân theo.

```js
// reach-measurement-worklet.js
const SCALE_FACTOR = 65536;

function convertContentIdToBucket(contentId) {
  return BigInt(contentId);
}

class ReachMeasurementOperation {
  async run(data) {
    const { contentId } = data;

    // Đọc từ Shared Storage
    const key = "has-reported-content";
    const hasReportedContent = (await this.sharedStorage.get(key)) === "true";

    // Không báo cáo nếu báo cáo đã được gửi
    if (hasReportedContent) {
      return;
    }

    // Tạo aggregation key và giá trị có thể tổng hợp
    const bucket = convertContentIdToBucket(contentId);
    const value = 1 * SCALE_FACTOR;

    // Gửi báo cáo có thể tổng hợp qua Private Aggregation API
    privateAggregation.sendHistogramReport({ bucket, value });

    // Đặt cờ trạng thái gửi báo cáo
    await this.sharedStorage.set(key, true);
  }
}

// Đăng ký thao tác
register("reach-measurement", ReachMeasurementOperation);
```

> [!NOTE]
> Có thể định nghĩa và đăng ký nhiều thao tác trong cùng script module shared storage worklet với các tên khác nhau. Xem {{domxref("SharedStorageOperation")}} để biết ví dụ.

Trong ngữ cảnh duyệt web chính, thao tác `reach-measurement` được gọi sử dụng phương thức {{domxref("WindowSharedStorage.run()")}}:

```js
async function measureUniqueReach() {
  // Tải Shared Storage worklet
  await window.sharedStorage.worklet.addModule("reach-measurement-worklet.js");

  // Chạy thao tác đo lường reach
  await window.sharedStorage.run("reach-measurement", {
    data: { contentId: "1234" },
  });
}

measureUniqueReach();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
