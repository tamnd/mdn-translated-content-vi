---
title: "PerformanceNavigationTiming: activationStart property"
short-title: activationStart
slug: Web/API/PerformanceNavigationTiming/activationStart
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceNavigationTiming.activationStart
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`activationStart`** biểu thị khoảng thời gian giữa lúc tài liệu bắt đầu prerendering và lúc nó được kích hoạt.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời lượng tính bằng mili giây giữa thời điểm bắt đầu prerendering của tài liệu và thời điểm kích hoạt.

Giá trị là `0` nếu trang chưa prerender hoặc vẫn đang prerender.

## Ví dụ

### Phát hiện trang prerender

Khi một tài liệu prerender được kích hoạt, `activationStart` được đặt thành thời điểm hiện tại. Hàm sau có thể kiểm tra xem một trang có đang {{DOMxRef("Document.prerendering","prerendering")}} hay đã được prerender hay không:

```js
function pagePrerendered() {
  return (
    document.prerendering ||
    self.performance?.getEntriesByType?.("navigation")[0]?.activationStart > 0
  );
}
```

### Đo các mốc hiệu năng mà người dùng cảm nhận

Với các trang prerender, một trang có thể đã được tạo từ rất lâu trước khi thực sự được điều hướng tới. Khi dùng [Performance API](/en-US/docs/Web/API/Performance_API) trên các trang prerender, điều quan trọng là so sánh các giá trị trả về với `activationStart` để tránh phép đo gây hiểu nhầm.

```js
// Thời điểm xảy ra kích hoạt
let activationStart =
  performance.getEntriesByType("navigation")[0].activationStart;

// Thời điểm vẽ đầu tiên
let firstPaint = performance.getEntriesByName("first-paint")[0].startTime;

// Thời điểm vẽ nội dung đầu tiên
let firstContentfulPaint = performance.getEntriesByName(
  "first-contentful-paint",
)[0].startTime;

console.log(`time to first paint: ${firstPaint - activationStart}`);
console.log(
  `time to first-contentful-paint: ${firstContentfulPaint - activationStart}`,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
- [Speculative loading](/en-US/docs/Web/Performance/Guides/Speculative_loading)
