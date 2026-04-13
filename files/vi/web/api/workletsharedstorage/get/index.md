---
title: "WorkletSharedStorage: get() method"
short-title: get()
slug: Web/API/WorkletSharedStorage/get
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.WorkletSharedStorage.get
---

{{APIRef("Shared Storage API")}}{{deprecated_header}}

Phương thức **`get()`** của giao diện {{domxref("WorkletSharedStorage")}} lấy một giá trị từ bộ nhớ chia sẻ.

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Chuỗi đại diện cho khóa của cặp key-value bạn muốn lấy.

### Giá trị trả về

Một {{jsxref("Promise")}} được thực hiện với chuỗi bằng giá trị của cặp key-value được lấy hoặc `undefined` nếu `key` được chỉ định không tìm thấy trong bộ nhớ chia sẻ.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Module worklet chưa được thêm với {{domxref("Worklet.addModule", "addModule()")}}.
    - `key` vượt quá độ dài tối đa do trình duyệt định nghĩa.
    - Trang gọi không có Shared Storage API trong [privacy sandbox enrollment process](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Enrollment) thành công.

## Ví dụ

### Đo tần suất K+

Ví dụ sau đây đo tần suất K+ của các lượt xem nội dung. Đôi khi được mô tả là "tần suất hiệu quả", tần suất K là số lượt xem tối thiểu trước khi người dùng nhận ra hoặc nhớ lại một nội dung nhất định (thường được dùng trong bối cảnh xem quảng cáo).

Script trang chính:

```js
// k-frequency-measurement.js

async function injectContent() {
  // Load the Shared Storage worklet
  await window.sharedStorage.worklet.addModule("k-freq-measurement-worklet.js");

  // Run the K-frequency measurement operation
  await window.sharedStorage.run("k-freq-measurement", {
    data: { kFreq: 3, contentId: 123 },
  });
}

injectContent();
```

Module worklet được hiển thị dưới đây:

```js
// k-frequency-measurement-worklet.js

// Scale factor for handling noise added to data
const SCALE_FACTOR = 65536;

/**
 * The bucket key must be a number, and in this case, it is simply the content
 * ID itself. For more complex bucket key construction, see other use cases in
 * this demo.
 */
function convertContentIdToBucket(contentId) {
  return BigInt(contentId);
}

class KFreqMeasurementOperation {
  async run(data) {
    const { kFreq, contentId } = data;

    // Read from Shared Storage
    const hasReportedContentKey = "has-reported-content";
    const impressionCountKey = "impression-count";
    const hasReportedContent =
      (await this.sharedStorage.get(hasReportedContentKey)) === "true";
    const impressionCount = parseInt(
      (await this.sharedStorage.get(impressionCountKey)) || 0,
      10,
    );

    // Do not report if a report has been sent already
    if (hasReportedContent) {
      return;
    }

    // Check impression count against frequency limit
    if (impressionCount < kFreq) {
      await this.sharedStorage.set(impressionCountKey, impressionCount + 1);
      return;
    }

    // Generate the aggregation key and the aggregatable value
    const bucket = convertContentIdToBucket(contentId);
    const value = 1 * SCALE_FACTOR;

    // Send an aggregatable report via the Private Aggregation API
    privateAggregation.sendHistogramReport({ bucket, value });

    // Set the report submission status flag
    await this.sharedStorage.set(hasReportedContentKey, "true");
  }
}

// Register the operation
register("k-freq-measurement", KFreqMeasurementOperation);
```

Để biết thêm chi tiết về ví dụ này, xem [K+ frequency measurement](https://privacysandbox.google.com/private-advertising/private-aggregation/k-freq-reach). Xem trang đích [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API) để biết các liên kết đến các ví dụ khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Shared Storage API](/en-US/docs/Web/API/Shared_Storage_API)
- [Noise and scaling](https://privacysandbox.google.com/private-advertising/private-aggregation/fundamentals#noise_and_scaling) on privacysandbox.google.com (2023)
