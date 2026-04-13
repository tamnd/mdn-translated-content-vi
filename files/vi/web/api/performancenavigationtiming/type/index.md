---
title: "PerformanceNavigationTiming: type property"
short-title: type
slug: Web/API/PerformanceNavigationTiming/type
page-type: web-api-instance-property
browser-compat: api.PerformanceNavigationTiming.type
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`type`** trả về kiểu điều hướng.

Bạn có thể dùng thuộc tính này để phân loại dữ liệu timing điều hướng vì mỗi kiểu sẽ có đặc điểm hiệu năng khác nhau. Người dùng đi tới và lui giữa các trang có thể thấy site nhanh hơn người dùng truy cập lần đầu hoặc gửi biểu mẫu, v.v.

Ví dụ, nếu site của bạn thường xuyên có nội dung mới, bạn có thể muốn làm mới nội dung đó bằng [Fetch](/en-US/docs/Web/API/Fetch_API) hoặc cách tương tự và tránh để người dùng phải tải lại toàn bộ trang liên tục. Kiểu `"reload"` có thể giúp bạn tìm ra các trang được tải lại thường xuyên.

## Giá trị

Thuộc tính `type` có thể có các giá trị sau:

- `"navigate"`
  - : Điều hướng bắt đầu bằng cách nhấp liên kết, nhập URL vào thanh địa chỉ của trình duyệt, gửi biểu mẫu, hoặc khởi tạo qua một thao tác script khác với `reload` và `back_forward` như liệt kê dưới đây.
- `"reload"`
  - : Điều hướng thông qua thao tác tải lại của trình duyệt, {{domxref("location.reload()")}} hoặc một chỉ thị Refresh pragma như `<meta http-equiv="refresh" content="300">`.
- `"back_forward"`
  - : Điều hướng thông qua thao tác duyệt lịch sử của trình duyệt.

## Ví dụ

### Ghi lại điều hướng kiểu reload

Thuộc tính `type` có thể được dùng để kiểm tra liệu điều hướng có phải kiểu `reload` hay không. Bạn có thể thu thập các mục `reload` này tại một endpoint phía server để xác định trang nào trên site được tải lại nhiều nhất, hoặc thu thập tất cả kiểu điều hướng rồi tính phần trăm người dùng đi lùi và đi tới, chẳng hạn.

Ví dụ dùng {{domxref("PerformanceObserver")}}...

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.type === "reload") {
      console.log(`${entry.name} was reloaded!`);
      console.log(entry);
    }
  });
});

observer.observe({ type: "navigation", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}:

```js
const entries = performance.getEntriesByType("navigation");
entries.forEach((entry) => {
  if (entry.type === "reload") {
    console.log(`${entry.name} was reloaded!`);
    console.log(entry);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
