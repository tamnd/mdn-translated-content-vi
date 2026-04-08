---
title: dynamic-range-limit-mix()
slug: Web/CSS/Reference/Values/dynamic-range-limit-mix
page-type: css-function
status:
  - experimental
browser-compat: css.types.dynamic-range-limit-mix
sidebar: cssref
---

{{SeeCompatTable}}

Hàm **`dynamic-range-limit-mix()`** [CSS](/vi/docs/Web/CSS) tạo ra giới hạn độ sáng tối đa tùy chỉnh bằng cách pha trộn các từ khóa {{cssxref("dynamic-range-limit")}} khác nhau theo tỉ lệ được chỉ định.

## Cú pháp

```css
dynamic-range-limit-mix(standard 70%, no-limit 30%);
dynamic-range-limit-mix(no-limit 10%, constrained 20%);
dynamic-range-limit-mix(no-limit 30%, constrained 30%, standard 30%);
dynamic-range-limit-mix(
    no-limit 20%,
    dynamic-range-limit-mix(standard 25%, constrained 75%) 20%
)
```

### Tham số

- {{cssxref("dynamic-range-limit")}} {{cssxref("&lt;percentage>")}}
  - : Một cặp gồm giá trị `dynamic-range-limit` (có thể là một hàm `dynamic-range-limit-mix()` khác) và một `<percentage>` trong khoảng `0%` đến `100%` (bao gồm). `<percentage>` xác định tỉ lệ của một giá trị từ khóa `dynamic-range-limit` trong giới hạn tùy chỉnh. Hàm `dynamic-range-limit-mix()` có thể nhận hai hoặc nhiều cặp như vậy làm tham số.

### Giá trị trả về

Một giới hạn độ sáng tối đa tùy chỉnh, được biểu thị dưới dạng số stop nhiếp ảnh cao hơn mức trắng tham chiếu HDR. Vì lý do bảo mật, kết quả tính toán thực tế không được hiển thị.

## Mô tả

Thuộc tính {{cssxref("dynamic-range-limit")}} cho phép bạn kiểm soát độ sáng của nội dung High Dynamic Range (HDR). Hàm `dynamic-range-limit-mix()` có thể được cung cấp làm giá trị của `dynamic-range-limit`, và cho phép bạn tạo giới hạn độ sáng tùy chỉnh bằng cách pha trộn các tỉ lệ phần trăm của các giá trị từ khóa `dynamic-range-limit`.

### Tính toán tỉ lệ phần trăm

Khi các phần trăm đã cho cộng lại bằng `100%`, kết quả rõ ràng:

```css
/* standard 70%, no-limit 30% */
dynamic-range-limit-mix(standard 70%, no-limit 30%);
```

Khi các phần trăm đã cho không cộng lại bằng `100%`, các phần trăm kết quả bằng các phần trăm đã cho được biểu thị theo tỉ lệ so với nhau sao cho tổng bằng `100%`:

```css
/* no-limit 40%, constrained 60% */
dynamic-range-limit-mix(no-limit 20%, constrained 30%);

/* no-limit 20%, constrained 40%, standard 40% */
dynamic-range-limit-mix(no-limit 40%, constrained 80%, standard 80%);
```

Nếu một giá trị từ khóa `dynamic-range-limit` được dùng nhiều hơn một lần, các phần trăm cho giá trị từ khóa đó được cộng lại để tính tổng phần trăm:

```css
/* constrained 70%, standard 30% */
dynamic-range-limit-mix(constrained 40%, standard 30%, constrained 30%);

/* no-limit 40%, constrained 60% */
dynamic-range-limit-mix(no-limit 10%, constrained 30%, no-limit 10%);
```

Nếu một phần trăm được chỉ định nhỏ hơn `0%` hoặc lớn hơn `100%`, hàm `dynamic-range-limit-mix()` — và do đó giá trị thuộc tính `dynamic-range-limit` liên quan — không hợp lệ. Nếu một từ khóa được dùng nhiều hơn một lần và tổng phần trăm lớn hơn `100%`, giá trị hợp lệ và các quy tắc tỉ lệ mô tả ở trên sẽ áp dụng.

### Lồng các hàm `dynamic-range-limit-mix()`

Bạn có thể lồng các hàm `dynamic-range-limit-mix()` vào trong nhau. Khi làm vậy, các quy tắc tương tự được giải thích trước đó áp dụng, và mỗi bộ phần trăm được tính riêng rồi cộng lại. Trong ví dụ sau:

```css
dynamic-range-limit-mix(
    no-limit 10%,
    dynamic-range-limit-mix(standard 25%, constrained 75%) 20%,
    dynamic-range-limit-mix(constrained 10%, no-limit 30%) 20%
)
```

- Dòng đầu tiên cho ta `no-limit 10%`.
- Vì `25%` và `75%` cộng lại bằng `100%`, dòng thứ hai cho ta `standard 5%` (`25%` của `20%`) và `constrained 15%` (`75%` của `20%`).
- Ở dòng thứ ba, vì `10%` và `30%` cộng lại chỉ bằng `40%`, chứ không phải `100%`, ta chuẩn hóa cả hai như là tỉ lệ của `40%`: 10/40 = `25%` và 30/40 = `75%`. Điều này cho ta `constrained 5%` (`25%` của `20%`) và `no-limit 15%` (`75%` của `20%`).

Cộng tất cả lại để lấy các phần trăm thô:

```css
dynamic-range-limit-mix(standard 5%, constrained 20%, no-limit 25%)
```

Các phần trăm trên cộng lại bằng `50%`, vì vậy cần nhân đôi để lấy các phần trăm cuối cùng. Do đó giá trị tính toán là:

```css
dynamic-range-limit-mix(standard 10%, constrained 40%, no-limit 50%)
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng cơ bản

Xét một phần tử {{htmlelement("img")}} được dùng để nhúng một hình ảnh HDR vào trang web:

```html
<img src="my-hdr-image.jpg" alt="my image" />
```

Trên các màn hình HDR, những vùng sáng nhất của hình ảnh có thể gây khó chịu khi nhìn. Để giải quyết vấn đề này, chúng ta có thể đặt thuộc tính `dynamic-range-limit` của hình ảnh thành `dynamic-range-limit-mix(standard 70%, no-limit 30%)`, giúp giới hạn độ sáng tối đa chỉ hơi sáng hơn mức trắng tham chiếu HDR một chút:

```css
img {
  dynamic-range-limit: dynamic-range-limit-mix(standard 70%, no-limit 30%);
}
```

Bạn có thể xem thuộc tính `dynamic-range-limit` hoạt động trong [bản demo thuộc tính dynamic-range-limit](https://github.com/mdn/dom-examples/tree/main/dynamic-range-limit), bao gồm một hình ảnh HDR có thể di chuột qua và focus để chuyển đổi giá trị `dynamic-range-limit`. [Xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/dynamic-range-limit/) trên màn hình có khả năng hiển thị màu HDR và thử nghiệm.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("dynamic-range-limit")}}
