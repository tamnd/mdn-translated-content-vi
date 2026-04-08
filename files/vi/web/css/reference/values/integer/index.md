---
title: <integer>
slug: Web/CSS/Reference/Values/integer
page-type: css-type
browser-compat: css.types.integer
sidebar: cssref
---

Kiểu dữ liệu **`<integer>`** trong [CSS](/vi/docs/Web/CSS) là một kiểu đặc biệt của {{cssxref("number")}} đại diện cho một số nguyên dương hoặc âm. Số nguyên có thể được dùng trong nhiều thuộc tính và mô tả tả CSS, chẳng hạn như {{cssxref("column-count")}}, {{cssxref("counter-increment")}}, {{cssxref("grid-column")}}, {{cssxref("grid-row")}}, {{cssxref("z-index")}} và mô tả {{cssxref("@counter-style/range", "range")}}.

## Cú pháp

Kiểu dữ liệu `<integer>` bao gồm một hoặc nhiều chữ số thập phân từ 0 đến 9, tùy chọn có thể đứng trước bởi một dấu `+` hoặc `-`. Không có đơn vị nào đi kèm với số nguyên.

> [!NOTE]
> Không có phạm vi giá trị `<integer>` hợp lệ chính thức nào, và các thông số kỹ thuật không chỉ định phạm vi.

## Nội suy

Khi tạo hoạt ảnh, các giá trị của kiểu dữ liệu `<integer>` được {{Glossary("interpolation", "nội suy")}} theo các bước rời rạc, toàn phần. Phép tính được thực hiện như thể chúng là các số thực dấu phẩy động; giá trị rời rạc được lấy bằng [hàm floor](https://en.wikipedia.org/wiki/Floor_function). Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên kết với hoạt ảnh.

## Ví dụ

### Số nguyên hợp lệ

```plain example-good
12          Số nguyên dương (không có dấu + ở đầu)
+123        Số nguyên dương (có dấu + ở đầu)
-456        Số nguyên âm
0           Không
+0          Không, có dấu + ở đầu
-0          Không, có dấu - ở đầu
```

### Số nguyên không hợp lệ

```plain example-bad
12.0        Đây là <number>, không phải <integer>, dù nó biểu diễn một số nguyên.
12.         Dấu chấm thập phân không được phép.
+---12      Chỉ được phép có một dấu +/- ở đầu.
ten         Chữ cái không được phép.
_5          Ký tự đặc biệt không được phép.
\35         Ký tự Unicode thoát không được phép, dù chúng là số nguyên (ở đây: 5).
\4E94       Chữ số không phải Arabic không được phép, dù được thoát (ở đây: chữ số 5 tiếng Nhật, 五).
3e4         Ký hiệu khoa học không được phép.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;number&gt;")}}
