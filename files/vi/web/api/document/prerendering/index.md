---
title: "Document: thuộc tính prerendering"
short-title: prerendering
slug: Web/API/Document/prerendering
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Document.prerendering
---

{{ APIRef("Speculation Rules API") }}{{seecompattable}}

Thuộc tính chỉ đọc **`prerendering`** của giao diện {{domxref("Document")}} trả về `true` nếu tài liệu hiện đang trong quá trình prerendering, được khởi tạo thông qua [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API).

## Giá trị

Một boolean. Trả về `true` nếu tài liệu hiện đang trong quá trình prerendering, và `false` nếu không. `false` sẽ được trả về cho các tài liệu đã hoàn tất prerendering và các tài liệu không được prerender.

## Ví dụ

Để chạy một hoạt động trong khi trang đang prerendering, bạn có thể kiểm tra thuộc tính `prerendering`. Ví dụ: bạn có thể chạy một số analytics:

```js
if (document.prerendering) {
  analytics.sendInfo("đã đến đây trong quá trình prerendering!");
}
```

Khi một tài liệu prerendered được kích hoạt, {{domxref("PerformanceNavigationTiming.activationStart")}} được đặt thành một giá trị {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian giữa khi prerendering bắt đầu và tài liệu thực sự được kích hoạt. Hàm sau có thể kiểm tra các trang prerendering _và_ prerendered:

```js
function pagePrerendered() {
  return (
    document.prerendering ||
    performance.getEntriesByType("navigation")[0]?.activationStart > 0
  );
}
```

Khi trang prerendered được kích hoạt bởi người dùng xem trang, sự kiện {{domxref("Document.prerenderingchange_event", "prerenderingchange")}} sẽ được kích hoạt. Điều này có thể được sử dụng để kích hoạt các hoạt động trước đây sẽ được bắt đầu theo mặc định khi tải trang nhưng bạn muốn trì hoãn cho đến khi trang thực sự được người dùng xem. Đoạn mã sau thiết lập một trình lắng nghe sự kiện để chạy một hàm khi prerendering đã kết thúc, trên một trang prerendered, hoặc chạy ngay lập tức trên một trang không prerendered:

```js
if (document.prerendering) {
  document.addEventListener("prerenderingchange", initAnalytics, {
    once: true,
  });
} else {
  initAnalytics();
}
```

> [!NOTE]
> Xem trang landing [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) và đặc biệt là phần [Unsafe speculative loading conditions](/en-US/docs/Web/API/Speculation_Rules_API#unsafe_speculative_loading_conditions) để biết thêm thông tin về các loại hoạt động bạn có thể muốn trì hoãn.

Để đo lường tần suất một prerender được kích hoạt, kết hợp cả ba API: `document.prerendering` để phát hiện các trường hợp trang hiện đang prerendering, `prerenderingchange` để theo dõi kích hoạt trong trường hợp đó, và `activationStart` để kiểm tra các trường hợp trang đã được prerender trong quá khứ.

```js
if (document.prerendering) {
  document.addEventListener(
    "prerenderingchange",
    () => {
      console.log("Prerender được kích hoạt sau khi tập lệnh này chạy");
    },
    { once: true },
  );
} else if (performance.getEntriesByType("navigation")[0]?.activationStart > 0) {
  console.log("Prerender được kích hoạt trước khi tập lệnh này chạy");
} else {
  console.log("Lần tải trang này không phải qua prerendering");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API)
- Sự kiện {{domxref("Document.prerenderingchange_event", "prerenderingchange")}}
- Thuộc tính {{domxref("PerformanceNavigationTiming.activationStart")}}
