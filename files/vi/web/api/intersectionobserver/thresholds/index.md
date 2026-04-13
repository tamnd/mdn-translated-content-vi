---
title: "IntersectionObserver: thresholds property"
short-title: thresholds
slug: Web/API/IntersectionObserver/thresholds
page-type: web-api-instance-property
browser-compat: api.IntersectionObserver.thresholds
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`thresholds`** của giao diện {{domxref("IntersectionObserver")}} trả về danh sách các ngưỡng giao nhau được chỉ định khi trình quan sát được khởi tạo với {{domxref("IntersectionObserver.IntersectionObserver", "IntersectionObserver()")}}.

Nếu chỉ có một tỷ lệ ngưỡng được cung cấp khi khởi tạo đối tượng, đây sẽ là một mảng chứa một giá trị duy nhất đó.

Xem trang [Intersection Observer](/en-US/docs/Web/API/Intersection_Observer_API#thresholds) để tìm hiểu cách các ngưỡng hoạt động.

## Giá trị

Một mảng các ngưỡng giao nhau, ban đầu được chỉ định bằng thuộc tính `threshold` khi khởi tạo trình quan sát.
Nếu chỉ có một trình quan sát được chỉ định, không nằm trong mảng, giá trị này là một mảng một phần tử chứa ngưỡng đó.
Bất kể thứ tự của mảng `threshold` ban đầu của bạn, mảng này luôn được sắp xếp theo thứ tự số tăng dần.

Nếu không có tùy chọn `threshold` nào được bao gồm khi `IntersectionObserver()` được dùng để khởi tạo trình quan sát, giá trị của `thresholds` là `[0]`.

> [!NOTE]
> Mặc dù đối tượng `options` bạn có thể chỉ định trong hàm khởi tạo {{domxref("IntersectionObserver/IntersectionObserver","IntersectionObserver()")}} có một trường có tên `threshold`, nhưng thuộc tính này được gọi là `thresholds`.
> Nếu bạn vô tình sử dụng `thresholds` làm tên của trường trong `options`, mảng `thresholds` sẽ có giá trị là `[0.0]`, điều này có thể không phải là điều bạn mong đợi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
