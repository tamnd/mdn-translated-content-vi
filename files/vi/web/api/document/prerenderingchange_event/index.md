---
title: "Document: sự kiện prerenderingchange"
short-title: prerenderingchange
slug: Web/API/Document/prerenderingchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Document.prerenderingchange_event
---

{{ APIRef("Speculation Rules API") }}{{seecompattable}}

Sự kiện **`prerenderingchange`** được kích hoạt trên một tài liệu prerendered khi nó được kích hoạt (tức là người dùng xem trang).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("prerenderingchange", (event) => { })

onprerenderingchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Ngăn mã chạy trong quá trình prerendering

Ví dụ cho thấy cách trì hoãn mã, mà nếu không sẽ chạy trong quá trình prerendering, cho đến sau khi trang được kích hoạt.
Điều này hữu ích cho việc trì hoãn mã analytics, chỉ liên quan khi và nếu trang thực sự được xem.

Mã kiểm tra xem prerendering có đang chạy không bằng cách sử dụng {{domxref("Document.prerendering")}}, và nếu có thì thêm một trình lắng nghe sự kiện để chạy hàm khởi tạo analytics khi trang được kích hoạt.
Trên một trang không prerendering, mã analytics được chạy ngay lập tức.

```js
if (document.prerendering) {
  document.addEventListener("prerenderingchange", initAnalytics, {
    once: true,
  });
} else {
  initAnalytics();
}
```

Lưu ý rằng loại mã này không nên được sử dụng để đo lường tần suất một prerender được kích hoạt, vì mã có thể chạy sau khi một trang prerendered đã được kích hoạt.

> [!NOTE]
> Xem trang landing [Speculation Rules API](/en-US/docs/Web/API/Speculation_Rules_API) và đặc biệt là phần [Unsafe speculative loading conditions](/en-US/docs/Web/API/Speculation_Rules_API#unsafe_speculative_loading_conditions) để biết thêm thông tin về các loại hoạt động bạn có thể muốn trì hoãn cho đến sau khi prerendering đã kết thúc.

### Đo lường kích hoạt prerendering

Mã này cho thấy cách đo lường tần suất một prerender được kích hoạt.
Nó sử dụng `prerenderingchange` để theo dõi các sự kiện kích hoạt, và {{domxref("Performance.getEntriesByType()")}} để theo dõi kích hoạt điều hướng.

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
- Thuộc tính {{domxref("Document.prerendering", "prerendering")}}
- Thuộc tính {{domxref("PerformanceNavigationTiming.activationStart")}}
