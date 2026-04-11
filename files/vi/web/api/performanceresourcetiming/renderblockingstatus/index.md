---
title: "PerformanceResourceTiming: renderBlockingStatus property"
short-title: renderBlockingStatus
slug: Web/API/PerformanceResourceTiming/renderBlockingStatus
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.renderBlockingStatus
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`renderBlockingStatus`** trả về trạng thái chặn kết xuất của tài nguyên.

Nó hữu ích để xác định các tài nguyên:

- không chặn kết xuất và do đó có thể bị hoãn, hoặc
- chặn kết xuất và do đó có thể được tải trước.

## Mô tả

Tài nguyên chặn kết xuất là các tệp tĩnh, chẳng hạn như font, CSS và JavaScript, làm chặn hoặc trì hoãn trình duyệt hiển thị nội dung trang lên màn hình. Trình duyệt tự động xác định các tài nguyên chặn này và không hiển thị bất kỳ pixel nào lên màn hình trước khi tất cả stylesheet và script đồng bộ được tải và đánh giá. Điều này ngăn Flash of Unstyled Contents ("FOUC").

Ngoài cơ chế chặn kết xuất tự động, thuộc tính và giá trị `blocking="render"` có thể được cung cấp cho các phần tử {{HTMLElement("script")}}, {{HTMLElement("style")}} hoặc {{HTMLElement("link")}} để chỉ định chặn kết xuất tường minh. Ví dụ:

```html
<script blocking="render" src="important.js" defer></script>
```

## Giá trị

Thuộc tính `renderBlockingStatus` có thể có các giá trị sau:

- `"blocking"`
  - : Tài nguyên có thể chặn kết xuất.
- `"non-blocking"`
  - : Tài nguyên không chặn kết xuất.

## Ví dụ

### Ghi nhật ký các tài nguyên chặn kết xuất

Thuộc tính `renderBlockingStatus` có thể dùng để xem các tài nguyên chặn kết xuất.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.renderBlockingStatus === "blocking") {
      console.log(`${entry.name} is render-blocking.`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  if (entry.renderBlockingStatus === "blocking") {
    console.log(`${entry.name} is render-blocking.`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
