---
title: "PerformanceResourceTiming: contentType property"
short-title: contentType
slug: Web/API/PerformanceResourceTiming/contentType
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceResourceTiming.contentType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`contentType`** của giao diện {{domxref("PerformanceResourceTiming")}} là một chuỗi cho biết kiểu nội dung của tài nguyên đã tìm nạp, được định dạng theo {{glossary("MIME type")}} và subtype được ngăn cách bằng dấu gạch chéo.

Kiểu nội dung là một phiên bản được rút gọn và "chuẩn hóa" của MIME type được trích từ tiêu đề HTTP {{httpheader("Content-Type")}} được gửi trong phản hồi tìm nạp của tài nguyên.
Với JavaScript, JSON, SVG và XML, MIME type được thay bằng một chuỗi MIME type/subtype đại diện.
Các kiểu khác được trình duyệt hỗ trợ sẽ được biểu diễn bằng chuỗi MIME type/subtype trong tiêu đề (các thông tin khác trong tiêu đề sẽ bị loại bỏ).

## Giá trị

Một chuỗi biểu thị "essence" của MIME type của nội dung.
Nó có thể là một trong các giá trị sau:

- `text/javascript`
  - : Nội dung JavaScript.
- `application/json`
  - : Nội dung JSON.
- `image/svg+xml`
  - : Nội dung SVG.
- `application/xml`
  - : Nội dung XML (không phải SVG).
- MIME type/subtype
  - : Bất kỳ MIME type/subtype nào khác được user agent hỗ trợ.
- `""` (chuỗi rỗng)
  - : Trả về cho các MIME type không được trình duyệt hỗ trợ, hoặc nếu việc tìm nạp tài nguyên thất bại do kiểm tra [CORS](/en-US/docs/Web/HTTP/Guides/CORS).

## Ví dụ

### Lọc tài nguyên

Thuộc tính `contentType` có thể dùng để lấy chỉ các resource timing entry cụ thể; ví dụ chỉ những entry liên quan đến script.

Ví dụ sau dùng {{domxref("PerformanceObserver")}} để thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  const javascriptResources = list
    .getEntries()
    .filter((entry) => entry.contentType === "text/javascript");
  console.log(javascriptResources);
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ sau dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này.

```js
const scripts = performance
  .getEntriesByType("resource")
  .filter((entry) => entry.contentType === "text/javascript");
console.log(scripts);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
