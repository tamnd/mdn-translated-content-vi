---
title: linear()
slug: Web/CSS/Reference/Values/easing-function/linear
page-type: css-function
browser-compat: css.types.easing-function.linear-function
sidebar: cssref
---

Hàm [CSS](/vi/docs/Web/CSS) **`linear()`** tạo ra một đường cong chuyển đổi tiến triển đều đặn giữa các điểm.
Là một {{cssxref("easing-function")}}, nó tạo ra các chuyển đổi trong đó {{Glossary("interpolation", "nội suy")}} xảy ra với tốc độ không đổi từ đầu đến cuối.

## Cú pháp

```css
linear(0, 1)
linear(0, 0.25, 1)
linear(0, 0.25 75%, 1)
linear(0, 0.5 25% 75%, 1)
```

### Tham số

Hàm nhận hai hoặc nhiều giá trị sau, biểu diễn các điểm tiến trình trong tiến trình hoạt ảnh:

- {{cssxref("&lt;number&gt;")}}
  - : Biểu diễn một điểm trong thời gian theo suốt thời lượng hoạt ảnh hoặc chuyển đổi.
    Phải chỉ định ít nhất hai giá trị.
    Giá trị `0` biểu diễn điểm bắt đầu của chuyển đổi, và `1` biểu diễn điểm kết thúc.
    Các giá trị nằm ngoài khoảng `0` đến `1` cũng được phép.

- {{cssxref("&lt;percentage&gt;")}} {{optional_inline}}
  - : Chỉ ra khi nào `<number>` tiến trình được đạt đến trong tiến trình hoạt ảnh.
    Có thể được chỉ định sau bất kỳ giá trị `<number>` nào ngoại trừ giá trị đầu tiên và cuối cùng, và có thể nhận tối đa hai giá trị.
    Nếu hai giá trị phần trăm được chỉ định, chúng định nghĩa độ dài của điểm dừng: phần trăm đầu tiên chỉ ra điểm bắt đầu và phần trăm thứ hai chỉ ra điểm kết thúc cho đoạn đó trong hoạt ảnh hoặc chuyển đổi. Nếu không có giá trị `<percentage>` nào được chỉ định, các giá trị tiến trình được phân bổ đều theo thời gian.

## Mô tả

Hàm `linear()` cho phép xấp xỉ các hoạt ảnh và chuyển đổi phức tạp bằng cách nội suy tuyến tính giữa các điểm được chỉ định.
Cách dùng điển hình của hàm `linear()` là cung cấp nhiều điểm để xấp xỉ bất kỳ đường cong nào.

Hàm `linear()` tạo ra các chuyển đổi trong đó tiến trình xảy ra với tốc độ không đổi giữa các điểm được chỉ định.
Ví dụ, `linear(0, 0.25, 1)` có các điểm dừng tuyến tính là `0`, `0.25`, và `1`.
Hoạt ảnh bắt đầu tại điểm `0`, di chuyển tuyến tính đến `0.25`, rồi tiếp tục tuyến tính đến điểm `1`.
Vì không có phần trăm nào được chỉ định, thời lượng giống nhau (`50%`) được dùng cho mỗi đoạn, tức là từ `0` đến `0.25` và từ `0.25` đến `1`.

![Đồ thị tiến trình đầu vào sang tiến trình đầu ra, trong đó linear(0, 0.25, 1) hiển thị đường gấp khúc nối gốc tọa độ, (0.5, 0.25) và (1, 1); và linear(0, 0.25 75%, 1) hiển thị đường gấp khúc nối gốc tọa độ, (0.75, 0.25) và (1, 1).](linear_function.svg)

Theo mặc định, các điểm dừng được phân bổ đều nhau. Ví dụ, nếu có năm điểm dừng, chúng sẽ xuất hiện ở 0%, 25%, 50%, 75% và 100% của thời lượng. Bạn có thể dùng các giá trị phần trăm tùy chọn để kiểm soát chi tiết hơn, định nghĩa khi nào mỗi giá trị tiến trình sẽ xảy ra và cho phép tiến trình chuyển đổi được kiểm soát tốt hơn.

Hãy xem xét một hoạt ảnh có thời gian 100 giây và thay đổi 100 pixel. Hãy xem xét kịch bản trong đó hàm làm mượt của hoạt ảnh được chỉ định là `linear(0, 0.25 75%, 1)`. Trong trường hợp này, hoạt ảnh tiến triển đến 25 pixel (25% tổng thay đổi) trong 75 giây đầu tiên (75% thời lượng). 75 pixel cuối cùng được áp dụng trong 25 giây còn lại của hoạt ảnh.

Đối với cùng hoạt ảnh đó, giả sử hàm làm mượt được chỉ định là `linear(0, 0.5 25% 75%, 1)`. Ở đây, hoạt ảnh đạt đến 50 pixel (50% tổng thay đổi) trong 25 giây (25% thời lượng) và ở lại đó trong 50 giây (75% - 25% thời lượng). Sau đó 50 pixel cuối cùng được áp dụng trong 25 giây còn lại. Lưu ý rằng `linear(0, 0.5 25% 75%, 1)` tương đương với `linear(0, 0.5 25%, 0.5 75%, 1)`.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng hàm linear()

Các hàm `linear()` sau đây hợp lệ để dùng trong CSS:

```css example-good
/* Ba điểm tiến trình được phân bổ đều */
linear(0, 0.25, 1)

/* Thời gian tùy chỉnh với giá trị phần trăm */
linear(0, 0.5 25% 75%, 1)
```

Các định nghĩa `linear()` sau đây không hợp lệ:

```css example-bad
/* Yêu cầu ít nhất hai tham số */
linear(0.5)

/* Phần trăm phải theo thứ tự tăng dần */
linear(0, 0.25 80%, 0.5 60%, 1)

/* Giá trị phải là số */
linear(start, middle, end)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hàm làm mượt khác: {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}} và {{cssxref("easing-function/steps", "steps()")}}
- Module [Hàm làm mượt CSS](/vi/docs/Web/CSS/Guides/Easing_functions)
- [Công cụ tạo `linear()` easing](https://linear-easing-generator.netlify.app/) bởi Jake Archibald
