---
title: Giá trị thuộc tính MathML
short-title: Values
slug: Web/MathML/Reference/Values
page-type: guide
browser-compat: mathml.attribute_values
sidebar: mathmlref
---

## Kiểu riêng của MathML

Ngoài [kiểu dữ liệu CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types), một số thuộc tính MathML chấp nhận các kiểu sau:

- `<unsigned-integer>`: Một [`<integer>`](/en-US/docs/Web/CSS/Reference/Values/integer) mà ký tự đầu tiên không phải là U+002D HYPHEN-MINUS character (-) hoặc U+002B PLUS SIGN (+); ví dụ `1234`.
- `<boolean>`: Một chuỗi `true` hoặc `false` biểu diễn giá trị boolean.

## Độ dài MathML kiểu cũ

{{deprecated_header}}

Thay vì {{cssxref("length-percentage")}}, MathML trước đây tự định nghĩa [kiểu để mô tả độ dài](https://www.w3.org/TR/MathML3/chapter2.html#type.length). Các giá trị được chấp nhận gồm các giá trị độ dài không đơn vị khác 0 (ví dụ `5` nghĩa là `500%`), các giá trị có số kết thúc bằng dấu chấm (ví dụ `34.px`), hoặc khoảng cách đặt tên (ví dụ `thinmathspace`). Vì lý do tương thích, nên thay các giá trị độ dài không đơn vị khác 0 bằng các giá trị {{cssxref("percentage")}} tương đương, bỏ dấu chấm thừa trong số và dùng các thay thế sau cho độ dài đặt tên:

```plain
veryverythinmathspace  => 0.05555555555555555em
verythinmathspace      => 0.1111111111111111em
thinmathspace          => 0.16666666666666666em
mediummathspace        => 0.2222222222222222em
thickmathspace         => 0.2777777777777778em
verythickmathspace     => 0.3333333333333333em
veryverythickmathspace => 0.3888888888888889em
```

### Đơn vị

| Đơn vị | Mô tả                                                                                                                 |
| ------ | --------------------------------------------------------------------------------------------------------------------- |
| `em`   | đơn vị {{ Cssxref("font-size", "tương đối theo font") }}                                                              |
| `ex`   | đơn vị {{ Cssxref("font-size", "tương đối theo font") }}. (chiều cao "x" của phần tử, `1ex ≈ 0.5em` trong nhiều font) |
| `px`   | Pixel                                                                                                                 |
| `in`   | Inch (1 inch = 2.54 centimet)                                                                                         |
| `cm`   | Centimet                                                                                                              |
| `mm`   | Milimet                                                                                                               |
| `pt`   | Point (1 point = 1/72 inch)                                                                                           |
| `pc`   | Pica (1 pica = 12 point)                                                                                              |
| `%`    | Phần trăm của giá trị mặc định.                                                                                       |

### Hằng số

| Hằng số                          | Giá trị    |
| -------------------------------- | ---------- |
| `veryverythinmathspace`          | 1/18 `em`  |
| `verythinmathspace`              | 2/18 `em`  |
| `thinmathspace`                  | 3/18 `em`  |
| `mediummathspace`                | 4/18 `em`  |
| `thickmathspace`                 | 5/18 `em`  |
| `verythickmathspace`             | 6/18 `em`  |
| `veryverythickmathspace`         | 7/18 `em`  |
| `negativeveryverythinmathspace`  | -1/18 `em` |
| `negativeverythinmathspace`      | -2/18 `em` |
| `negativethinmathspace`          | -3/18 `em` |
| `negativemediummathspace`        | -4/18 `em` |
| `negativethickmathspace`         | -5/18 `em` |
| `negativeverythickmathspace`     | -6/18 `em` |
| `negativeveryverythickmathspace` | -7/18 `em` |

## Khả năng tương thích trình duyệt

{{Compat}}
