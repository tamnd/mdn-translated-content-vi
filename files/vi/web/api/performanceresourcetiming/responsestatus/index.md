---
title: "PerformanceResourceTiming: responseStatus property"
short-title: responseStatus
slug: Web/API/PerformanceResourceTiming/responseStatus
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.responseStatus
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`responseStatus`** biểu thị mã trạng thái phản hồi HTTP được trả về khi tìm nạp tài nguyên.

Thuộc tính này ánh xạ tới {{domxref("Response.status")}} từ [Fetch API](/en-US/docs/Web/API/Fetch_API).

## Giá trị

Thuộc tính `responseStatus` có thể có các giá trị sau:

- Một số biểu thị [mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status) được trả về khi tìm nạp tài nguyên.
- `0` nếu kiểm tra [CORS](/en-US/docs/Web/HTTP/Guides/CORS) thất bại.
- `0` đối với các đối tượng {{HTMLElement("iframe")}} cross-origin.

## Ví dụ

### Kiểm tra xem có trúng cache hay không

Thuộc tính `responseStatus` có thể dùng để kiểm tra tài nguyên được cache với mã phản hồi {{HTTPStatus("304")}} `Not Modified`.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.responseStatus === 304) {
      console.log(`${entry.name} was loaded from cache`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  if (entry.responseStatus === 304) {
    console.log(`${entry.name} was loaded from cache`);
  }
});
```

Ngoài ra, nếu `responseStatus` không khả dụng, bạn có thể kiểm tra xem thuộc tính {{domxref("PerformanceResourceTiming.transferSize", "transferSize")}} có trả về `0` hay không.

### Mã trạng thái phản hồi cross-origin

Nếu giá trị của thuộc tính `responseStatus` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để hiển thị mã trạng thái phản hồi cross-origin, cần đặt tiêu đề phản hồi HTTP [CORS](/en-US/docs/Web/HTTP/Guides/CORS) {{HTTPHeader("Access-Control-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem mã trạng thái phản hồi, tài nguyên cross-origin nên gửi:

```http
Access-Control-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP response status code](/en-US/docs/Web/HTTP/Reference/Status)
- {{domxref("Response.status")}}
- [CORS](/en-US/docs/Web/HTTP/Guides/CORS)
