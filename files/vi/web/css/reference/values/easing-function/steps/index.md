---
title: steps()
slug: Web/CSS/Reference/Values/easing-function/steps
page-type: css-function
browser-compat: css.types.easing-function.steps
sidebar: cssref
---

Hàm [CSS](/vi/docs/Web/CSS) **`steps()`** định nghĩa một chuyển đổi chia thời gian đầu vào thành một số khoảng bằng nhau có độ dài đều nhau. Lớp con của hàm bước này đôi khi còn được gọi là _hàm bậc thang_.

## Cú pháp

```css
/* Số khoảng khác nhau */
steps(2, end)
steps(4, jump-end)
steps(12, end)

/* Vị trí nhảy khác nhau */
steps(3, jump-start)
steps(3, jump-end)
steps(3, jump-none)
steps(3, jump-both)
```

### Tham số

Hàm nhận các tham số sau:

- `<integer>`
  - : Biểu diễn số khoảng bằng nhau hoặc "bước".
    Phải là số nguyên dương lớn hơn `0` trừ khi tham số thứ hai là `jump-none`, trong trường hợp đó phải là số nguyên dương lớn hơn `1`.

- `<step-position>`
  - : Chỉ định khi nào xảy ra bước nhảy giữa các giá trị.
    Nếu bỏ qua, mặc định là `end`.
    Các giá trị từ khóa có thể bao gồm:
    - `jump-start` hoặc `start`
      - : Chỉ ra rằng bước đầu tiên xảy ra khi hoạt ảnh bắt đầu.
    - `jump-end` hoặc `end`
      - : Chỉ ra rằng bước cuối cùng xảy ra khi hoạt ảnh kết thúc.
    - `jump-none`
      - : Chỉ ra rằng không có bước nhảy nào xảy ra sớm hay muộn.
    - `jump-both`
      - : Chỉ ra rằng cả bước nhảy sớm và muộn đều xảy ra.

## Mô tả

Hàm `steps()` chia thời lượng hoạt ảnh thành các khoảng bằng nhau.
Ví dụ, `steps(4, end)` chia hoạt ảnh thành bốn khoảng bằng nhau, với các giá trị thay đổi ở cuối mỗi khoảng ngoại trừ lần thay đổi cuối cùng xảy ra vào cuối hoạt ảnh.

Nếu một hoạt ảnh chứa nhiều đoạn, số bước được chỉ định áp dụng cho mỗi đoạn. Ví dụ, nếu một hoạt ảnh có ba đoạn và dùng `steps(2)`, sẽ có tổng cộng sáu bước, với hai bước mỗi đoạn.

Hình ảnh sau hiển thị tác động của các giá trị `<step-position>` khác nhau khi các bước nhảy xảy ra:

```css
steps(2, jump-start)  /* Hoặc steps(2, start) */
steps(4, jump-end)    /* Hoặc steps(4, end) */
steps(5, jump-none)
steps(3, jump-both)
```

![Đồ thị tiến trình đầu vào sang tiến trình đầu ra, trong đó steps(2, jump-start) hiển thị các đường nằm ngang kéo dài 0.5 đơn vị từ (0, 0.5) và (0.5, 1), tương ứng, với vòng tròn rỗng tại gốc tọa độ và (0.5, 0.5); steps(4, jump-end) hiển thị các đường nằm ngang kéo dài 0.25 đơn vị từ (0, 0), (0.25, 0.25), (0.5, 0.5) và (0.75, 0.75), tương ứng, với vòng tròn rỗng tại (0.25, 0), (0.5, 0.25) và (0.75, 0.5), và vòng tròn đặc tại (1, 1); steps(5, jump-none) hiển thị các đường nằm ngang kéo dài 0.2 đơn vị từ (0, 0), (0.2, 0.25), (0.4, 0.5), (0.6, 0.75) và (0.8, 1), tương ứng, với vòng tròn rỗng tại (0.2, 0), (0.4, 0.25), (0.6, 0.5) và (0.8, 0.75); steps(3, jump-both) hiển thị các đường nằm ngang kéo dài 1/3 đơn vị từ (0, 0.25), (1/3, 0.5) và (2/3, 0.75), tương ứng, với vòng tròn đặc tại (1, 1) và vòng tròn rỗng tại gốc tọa độ, (1/3, 0.25), (2/3, 0.5) và (1, 0.75).](jump.svg)

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng hàm steps()

Các hàm `steps()` sau đây hợp lệ:

```css example-good
/* Năm bước với nhảy ở cuối */
steps(5, end)

/* Hai bước với nhảy ở đầu */
steps(2, start)

/* Dùng tham số thứ hai mặc định */
steps(2)
```

Các hàm `steps()` sau đây không hợp lệ:

```css example-bad
/* Tham số đầu tiên phải là <integer>, không phải số thực */
steps(2.0, jump-end)

/* Số bước phải dương */
steps(-3, start)

/* Số bước phải ít nhất là 1 */
steps(0, jump-none)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hàm làm mượt khác: {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}} và {{cssxref("easing-function/linear", "linear()")}}
- Module [Hàm làm mượt CSS](/vi/docs/Web/CSS/Guides/Easing_functions)
- [Hàm bước](https://en.wikipedia.org/wiki/Step_function) trên Wikipedia
