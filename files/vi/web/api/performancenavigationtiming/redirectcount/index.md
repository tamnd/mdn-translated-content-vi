---
title: "PerformanceNavigationTiming: redirectCount property"
short-title: redirectCount
slug: Web/API/PerformanceNavigationTiming/redirectCount
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.redirectCount
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`redirectCount`** trả về một số biểu thị số lần chuyển hướng kể từ lần điều hướng không phải chuyển hướng gần nhất trong ngữ cảnh duyệt hiện tại.

Số lần chuyển hướng trên một trang càng nhiều thì thời gian tải trang càng dài. Để cải thiện hiệu năng trang web, hãy tránh nhiều lần chuyển hướng.

Các thuộc tính {{domxref("PerformanceResourceTiming.redirectStart", "redirectStart")}} và {{domxref("PerformanceResourceTiming.redirectEnd", "redirectEnd")}} có thể được dùng để đo thời gian chuyển hướng. Lưu ý rằng chúng sẽ trả về `0` cho các chuyển hướng xuyên nguồn gốc.

Lưu ý rằng các chuyển hướng phía client, chẳng hạn `<meta http-equiv="refresh" content="0; url=https://example.com/">`, không được tính ở đây.

## Giá trị

Thuộc tính `redirectCount` có thể nhận các giá trị sau:

- Một số biểu thị số lần chuyển hướng kể từ lần điều hướng không phải chuyển hướng gần nhất trong ngữ cảnh duyệt hiện tại.
- `0` nếu chuyển hướng là xuyên nguồn gốc.

## Ví dụ

### Ghi lại các mục có chuyển hướng

Thuộc tính `redirectCount` có thể được dùng để kiểm tra xem có một hay nhiều chuyển hướng hay không. Chúng ta ghi tên mục và thời gian chuyển hướng nếu có.

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const name = entry.name;
    const redirectCount = entry.redirectCount;
    const redirectTime = entry.redirectEnd - entry.redirectStart;
    if (redirectCount > 0) {
      console.log(`${name}: Redirect count: ${redirectCount}`);
      if (redirectTime > 0) {
        console.log(`${name}: Redirect time: ${redirectTime}ms`);
      }
    }
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  const name = entry.name;
  const redirectCount = entry.redirectCount;
  const redirectTime = entry.redirectEnd - entry.redirectStart;
  if (redirectCount > 0) {
    console.log(`${name}: Redirect count: ${redirectCount}`);
    if (redirectTime > 0) {
      console.log(`${name}: Redirect time: ${redirectTime}ms`);
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceResourceTiming.redirectStart")}}
- {{domxref("PerformanceResourceTiming.redirectEnd")}}
