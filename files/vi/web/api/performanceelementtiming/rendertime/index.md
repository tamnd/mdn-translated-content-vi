---
title: "PerformanceElementTiming: renderTime property"
short-title: renderTime
slug: Web/API/PerformanceElementTiming/renderTime
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceElementTiming.renderTime
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`renderTime`** của giao diện {{domxref("PerformanceElementTiming")}} trả về thời gian render của phần tử liên kết.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} với thời gian render của phần tử.

Đối với hình ảnh, đây sẽ là **dấu thời gian render hình ảnh**. Được định nghĩa là lần vẽ tiếp theo xảy ra sau khi hình ảnh được tải đầy đủ. Nếu kiểm tra cho phép thời gian thất bại (như được định nghĩa bởi tiêu đề [Timing-allow-origin](/en-US/docs/Web/HTTP/Reference/Headers/Timing-Allow-Origin)), giá trị này sẽ trả về `0`.

Đối với các nút văn bản, đây sẽ là **dấu thời gian render văn bản**. Được định nghĩa là thời điểm phần tử được vẽ văn bản.

## Ví dụ

### Ghi lại `renderTime`

Trong ví dụ này, một phần tử {{HTMLElement("img")}} đang được quan sát bằng cách thêm thuộc tính [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming). Một {{domxref("PerformanceObserver")}} được đăng ký để lấy tất cả các mục hiệu suất loại `"element"` và cờ `buffered` được dùng để truy cập dữ liệu từ trước khi trình quan sát được tạo. Gọi `entry.renderTime` trả về thời gian render của phần tử hình ảnh.

```html
<img
  src="image.jpg"
  alt="a nice image"
  elementtiming="big-image"
  id="myImage" />
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.identifier === "big-image") {
      console.log(entry.renderTime);
    }
  });
});
observer.observe({ type: "element", buffered: true });
```

### Thời gian render hình ảnh từ nguồn khác

Vì lý do bảo mật, giá trị của thuộc tính `renderTime` ban đầu là `0` nếu tài nguyên là một yêu cầu từ nguồn khác (cross-origin). Thay vào đó, thuộc tính `loadTime` nên được sử dụng như một dự phòng.

Các trình duyệt [hiện có thể hiển thị một thời gian render hơi thô hơn](https://github.com/w3c/paint-timing/issues/104) trong các tình huống này. Kiểm tra [hỗ trợ trình duyệt](#browser_compatibility).

Để hiển thị thông tin thời gian render cross-origin chính xác hơn, tiêu đề HTTP phản hồi {{HTTPHeader("Timing-Allow-Origin")}} cần được đặt.

Ví dụ, để cho phép `https://developer.mozilla.org` xem `renderTime` chính xác, tài nguyên cross-origin phải gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

Ngoài ra, bạn có thể sử dụng {{domxref("PerformanceEntry.startTime", "startTime")}} trả về giá trị `renderTime` của mục nếu nó không phải `0`, và nếu không thì giá trị `loadTime` của mục này. Tuy nhiên, khuyến nghị đặt tiêu đề {{HTTPHeader("Timing-Allow-Origin")}} để các chỉ số sẽ chính xác hơn.

Nếu bạn sử dụng `startTime`, bạn có thể đánh dấu bất kỳ sự không chính xác nào bằng cách kiểm tra xem `renderTime` có được sử dụng không:

```js
const isRenderTime = Boolean(entry.renderTime);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
