---
title: "PerformanceResourceTiming: initiatorType property"
short-title: initiatorType
slug: Web/API/PerformanceResourceTiming/initiatorType
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.initiatorType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`initiatorType`** là một chuỗi biểu thị tính năng nền tảng web đã khởi tạo việc tải tài nguyên.

> [!NOTE]
> Thuộc tính này không biểu thị kiểu nội dung được tìm nạp. Một tệp `.css` có thể được tìm nạp bằng phần tử {{HTMLElement("link")}} dẫn đến `initiatorType` là `link`. Khi tải hình ảnh bằng `background: url()` trong tệp CSS, `initiatorType` sẽ là `css` chứ không phải `img`.

## Giá trị

Thuộc tính `initiatorType` có thể có các giá trị sau, hoặc `other` nếu không điều kiện nào khớp.

- `audio`
  - : Nếu yêu cầu được khởi tạo bởi thuộc tính `src` của phần tử {{HTMLElement("audio")}}.
- `beacon`
  - : Nếu yêu cầu được khởi tạo bởi phương thức {{domxref("navigator.sendBeacon()")}}.
- `body`
  - : Nếu yêu cầu được khởi tạo bởi thuộc tính `background` của phần tử {{HTMLElement("body")}}.
- `css`
  - : Nếu yêu cầu được khởi tạo bởi hàm CSS `url()`.
- `early-hint`
  - : Nếu yêu cầu được khởi tạo bởi phản hồi `Early Hint` {{HTTPStatus("103")}}.
- `embed`
  - : Nếu yêu cầu được khởi tạo bởi thuộc tính `src` của phần tử {{HTMLElement("embed")}}.
- `fetch`
  - : Nếu yêu cầu được khởi tạo bởi phương thức {{domxref("Window/fetch", "fetch()")}}.
- `frame`
  - : Nếu yêu cầu được khởi tạo khi tải phần tử {{HTMLElement("frame")}}.
- `iframe`
  - : Nếu yêu cầu được khởi tạo bởi thuộc tính `src` của phần tử {{HTMLElement("iframe")}}.
- `icon` {{non-standard_inline}}
  - : Nếu yêu cầu được khởi tạo bởi favicon. Không chuẩn và chỉ Safari báo cáo.
- `image`
  - : Nếu yêu cầu được khởi tạo bởi phần tử {{SVGElement("image")}}.
- `img`
  - : Nếu yêu cầu được khởi tạo bởi thuộc tính `src` hoặc `srcset` của phần tử {{HTMLElement("img")}}.
- `input`
  - : Nếu yêu cầu được khởi tạo bởi phần tử {{HTMLElement("input")}} có kiểu `image`.
- `link`
  - : Nếu yêu cầu được khởi tạo bởi phần tử {{HTMLElement("link")}}.
- `navigation`
  - : Nếu yêu cầu được khởi tạo bởi một yêu cầu điều hướng.
- `object`
  - : Nếu yêu cầu được khởi tạo bởi phần tử {{HTMLElement("object")}}.
- `ping`
  - : Nếu yêu cầu được khởi tạo bởi `ping` của phần tử {{HTMLElement("a")}}.
- `script`
  - : Nếu yêu cầu được khởi tạo bởi phần tử {{HTMLElement("script")}}.
- `track`
  - : Nếu yêu cầu được khởi tạo bởi `src` của phần tử {{HTMLElement("track")}}.
- `video`
  - : Nếu yêu cầu được khởi tạo bởi `poster` hoặc `src` của phần tử {{HTMLElement("video")}}.
- `xmlhttprequest`
  - : Nếu yêu cầu được khởi tạo bởi một {{domxref("XMLHttpRequest")}}.

## Ví dụ

### Lọc tài nguyên

Thuộc tính `initiatorType` có thể dùng để lấy chỉ các resource timing entry cụ thể. Ví dụ, chỉ những entry được khởi tạo bởi các phần tử {{HTMLElement("script")}}.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  const scripts = list
    .getEntries()
    .filter((entry) => entry.initiatorType === "script");
  console.log(scripts);
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const scripts = performance
  .getEntriesByType("resource")
  .filter((entry) => entry.initiatorType === "script");
console.log(scripts);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
