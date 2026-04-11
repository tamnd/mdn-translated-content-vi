---
title: "IntersectionObserver: IntersectionObserver() constructor"
short-title: IntersectionObserver()
slug: Web/API/IntersectionObserver/IntersectionObserver
page-type: web-api-constructor
browser-compat: api.IntersectionObserver.IntersectionObserver
---

{{APIRef("Intersection Observer API")}}

Hàm khởi tạo **`IntersectionObserver()`** tạo và trả về một đối tượng {{domxref("IntersectionObserver")}} mới.

## Cú pháp

```js-nolint
new IntersectionObserver(callback)
new IntersectionObserver(callback, options)
```

### Tham số

- `callback`
  - : Một hàm được gọi khi tỷ lệ phần trăm của phần tử đích hiển thị vượt qua một ngưỡng.
    Callback nhận hai tham số đầu vào:
    - `entries`
      - : Một mảng các đối tượng {{domxref("IntersectionObserverEntry")}}, mỗi đối tượng đại diện cho một ngưỡng đã bị vượt qua, cho dù đang trở nên hiển thị nhiều hơn hay ít hơn so với tỷ lệ phần trăm được chỉ định bởi ngưỡng đó.
        Bạn không nên giả định số lượng mục, vì nhiều sự kiện vượt ngưỡng có thể được báo cáo trong một lần gọi callback duy nhất.
        Các mục được gửi qua hàng đợi, vì vậy chúng phải được sắp xếp theo thời gian chúng được tạo ra, nhưng tốt nhất bạn nên sử dụng {{domxref("IntersectionObserverEntry.time")}} để sắp xếp chúng chính xác.
    - `observer`
      - : {{domxref("IntersectionObserver")}} mà callback đang được gọi cho.

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn để tùy chỉnh trình quan sát.

    Bạn có thể cung cấp bất kỳ tổ hợp nào (hoặc không có) các tùy chọn sau:
    - `delay`
      - : Một số chỉ định độ trễ tối thiểu được phép giữa các thông báo từ trình quan sát, tính bằng mili giây.

        Độ trễ được dùng để giới hạn tốc độ cung cấp thông báo khi theo dõi khả năng hiển thị, vì đây là thao tác tốn nhiều tài nguyên tính toán.
        Khuyến nghị khi theo dõi khả năng hiển thị là bạn nên đặt độ trễ ở mức giá trị lớn nhất có thể chấp nhận được.

        Khi [`trackVisibility`](#trackvisibility) là `true`, giá trị tối thiểu là 100.
        Trình duyệt sẽ đặt giá trị thành 100 nếu bất kỳ giá trị nhỏ hơn nào được sử dụng, hoặc nếu giá trị không được chỉ định.
        Giá trị mặc định là 0.

    - `root`
      - : Một đối tượng {{domxref("Element")}} hoặc {{domxref("Document")}} là tổ tiên của đích dự định, hình chữ nhật giới hạn của nó sẽ được coi là viewport.
        Bất kỳ phần nào của đích không hiển thị trong vùng nhìn thấy của `root` đều không được coi là hiển thị.
        Nếu không được chỉ định, trình quan sát sử dụng viewport của tài liệu làm gốc, không có lề, và ngưỡng 0% (nghĩa là ngay cả một thay đổi một pixel cũng đủ để kích hoạt callback).
    - `rootMargin`
      - : Một chuỗi chỉ định một tập hợp các độ lệch cộng vào {{Glossary('bounding_box')}} của gốc khi tính toán sự giao nhau, giúp thu nhỏ hoặc mở rộng gốc cho mục đích tính toán. Mỗi giá trị độ lệch chỉ có thể được biểu thị bằng pixel (`px`) hoặc phần trăm (`%`).
        Cú pháp gần giống với cú pháp cho thuộc tính CSS {{cssxref("margin")}};
        xem [The intersection root and root margin](/en-US/docs/Web/API/Intersection_Observer_API#the_intersection_root_and_root_margin) để biết thêm thông tin về cách lề hoạt động và cú pháp.
        Giá trị mặc định là "0px 0px 0px 0px".
    - `scrollMargin`
      - : Một chuỗi chỉ định các độ lệch cộng vào mỗi {{glossary("scroll container")}} trên đường dẫn đến đích khi tính toán sự giao nhau, giúp thu nhỏ hoặc mở rộng các hình chữ nhật cắt xén được dùng để tính toán sự giao nhau.
        Điều này cho phép, ví dụ, quan sát tốt hơn các đích bên trong các vùng cuộn lồng nhau đang bị cắt xén bởi các vùng cuộn.
        Cú pháp giống với `rootMargin`.
        Giá trị mặc định là "0px 0px 0px 0px".
    - `threshold`
      - : Một số đơn lẻ hoặc một mảng các số từ 0.0 đến 1.0, chỉ định tỷ lệ diện tích giao nhau so với tổng diện tích hộp giới hạn của đích được quan sát.
        Giá trị 0.0 có nghĩa là ngay cả một pixel duy nhất hiển thị cũng tính là đích đang hiển thị.
        1.0 có nghĩa là toàn bộ phần tử đích đang hiển thị.
        Xem [Thresholds](/en-US/docs/Web/API/Intersection_Observer_API#thresholds) để có mô tả chuyên sâu hơn về cách sử dụng ngưỡng.
        Giá trị mặc định là ngưỡng "0".
    - `trackVisibility`
      - : Một giá trị boolean cho biết liệu trình quan sát có nên theo dõi khả năng hiển thị hay không.

        Khi là `true`, trình duyệt sẽ kiểm tra xem đích có bị suy giảm khả năng hiển thị khi tính toán sự giao nhau hay không;
        ví dụ, liệu nó có bị che bởi các phần tử khác hay có thể bị biến dạng hoặc ẩn bởi bộ lọc, giảm độ mờ, hoặc một số biến đổi nào đó.

        Theo dõi khả năng hiển thị là thao tác tốn kém, và chỉ nên thực hiện khi cần thiết.
        Cũng nên đặt một [`delay`](#delay) khi giá trị này là `true`.
        Giá trị mặc định là `false`.

### Giá trị trả về

Một {{domxref("IntersectionObserver")}} mới có thể được dùng để theo dõi khả năng hiển thị của một phần tử đích trong `root` được chỉ định khi vượt qua bất kỳ ngưỡng hiển thị `threshold` nào được chỉ định.

Gọi phương thức {{domxref("IntersectionObserver.observe", "observe()")}} để bắt đầu theo dõi các thay đổi khả năng hiển thị trên một đích đã cho.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : `rootMargin` hoặc `scrollMargin` được chỉ định không hợp lệ.
- {{jsxref("RangeError")}}
  - : Một hoặc nhiều giá trị trong `threshold` nằm ngoài phạm vi 0.0 đến 1.0.

## Ví dụ

Ví dụ này tạo một trình quan sát giao nhau mới gọi hàm `myObserverCallback` mỗi khi vùng hiển thị của phần tử được quan sát thay đổi ít nhất 10%.

```js
let observer = new IntersectionObserver(myObserverCallback, { threshold: 0.1 });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
