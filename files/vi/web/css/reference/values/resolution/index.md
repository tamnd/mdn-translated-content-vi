---
title: <resolution>
slug: Web/CSS/Reference/Values/resolution
page-type: css-type
browser-compat: css.types.resolution
sidebar: cssref
---

Kiểu dữ liệu **`<resolution>`** [CSS](/vi/docs/Web/CSS) [data type](/vi/docs/Web/CSS/Reference/Values/Data_types), được dùng để mô tả [độ phân giải](/vi/docs/Web/CSS/Reference/At-rules/@media/resolution) trong [media query](/vi/docs/Web/CSS/Guides/Media_queries), biểu thị mật độ điểm ảnh của thiết bị đầu ra, tức là độ phân giải của nó.

Trên màn hình, các đơn vị liên quan đến inch, centimeter hoặc pixel _CSS_, không phải các giá trị vật lý.

## Cú pháp

Kiểu dữ liệu `<resolution>` bao gồm một số {{cssxref("&lt;number&gt;")}} dương nghiêm ngặt, theo sau là một trong các đơn vị được liệt kê dưới đây. Như với tất cả các kích thước CSS, không có khoảng cách giữa ký tự đơn vị và số.

### Đơn vị

- `dpi`
  - : Biểu thị số [điểm trên inch](https://en.wikipedia.org/wiki/Dots_per_inch). Màn hình thường có 72 hoặc 96 điểm trên inch, nhưng dpi cho tài liệu in thường lớn hơn nhiều. Vì 1 inch là 2.54 cm, `1dpi ≈ 0.39dpcm`.
- `dpcm`
  - : Biểu thị số [điểm trên centimeter](https://en.wikipedia.org/wiki/Dots_per_inch). Vì 1 inch là 2.54 cm, `1dpcm ≈ 2.54dpi`.
- `dppx`
  - : Biểu thị số điểm trên đơn vị [`px`](/vi/docs/Web/CSS/Reference/Values/length#px). Do tỷ lệ cố định 1:96 của `in` CSS so với `px` CSS, `1dppx` tương đương với `96dpi`, tương ứng với độ phân giải mặc định của hình ảnh hiển thị trong CSS như được định nghĩa bởi {{cssxref("image-resolution")}}.
- `x`
  - : Bí danh của `dppx`.

> [!NOTE]
> Mặc dù số `0` luôn giống nhau bất kể đơn vị, đơn vị không được bỏ qua. Nói cách khác, `0` không hợp lệ và không biểu diễn `0dpi`, `0dpcm`, hay `0dppx`.

## Ví dụ

### Sử dụng trong media query

```css
@media print and (resolution >= 300dpi) {
  /* … */
}

@media (resolution: 120dpcm) {
  /* … */
}

@media (resolution >= 2dppx) {
  /* … */
}

@media (resolution: 1x) {
  /* … */
}
```

### Độ phân giải hợp lệ

```plain example-good
96dpi
50.82dpcm
3dppx
```

### Độ phân giải không hợp lệ

```plain example-bad
72 dpi     Spaces are not allowed between the number and the unit.
ten dpi    The number must use digits only.
0          The unit is required.
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tính năng media [resolution](/vi/docs/Web/CSS/Reference/At-rules/@media/resolution)
- Thuộc tính {{cssxref("image-resolution")}}
- [Sử dụng @media query](/vi/docs/Web/CSS/Guides/Media_queries/Using)
