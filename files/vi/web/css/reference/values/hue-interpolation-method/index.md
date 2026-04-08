---
title: <hue-interpolation-method>
slug: Web/CSS/Reference/Values/hue-interpolation-method
page-type: css-type
browser-compat: css.types.gradient.conic-gradient.hue_interpolation_method
spec-urls: https://drafts.csswg.org/css-color/#hue-interpolation
sidebar: cssref
---

Kiểu dữ liệu **`<hue-interpolation-method>`** của [CSS](/vi/docs/Web/CSS) đại diện cho thuật toán được sử dụng để nội suy giữa các giá trị {{cssxref("hue")}}.
Phương pháp nội suy chỉ định cách tìm điểm giữa giữa hai giá trị sắc độ dựa trên bánh xe màu.
Nó được sử dụng như một thành phần của kiểu dữ liệu {{CSSXref("&lt;color-interpolation-method&gt;")}}.

Khi nội suy các giá trị `<hue>`, thuật toán nội suy sắc độ mặc định là [`shorter`](#shorter).

## Cú pháp

Giá trị `<hue-interpolation-method>` bao gồm tên của thuật toán nội suy sắc độ theo sau là token `hue`:

```plain
shorter hue
longer hue
increasing hue
decreasing hue
```

### Giá trị

Bất kỳ cặp góc sắc độ nào cũng tương ứng với hai bán kính trên {{Glossary("color wheel")}}, chia chu vi thành hai cung có thể để nội suy. Cả hai cung đều bắt đầu từ bán kính đầu tiên và kết thúc ở bán kính thứ hai, nhưng một cung đi theo chiều kim đồng hồ và cung kia đi ngược chiều kim đồng hồ.

> [!NOTE]
> Các mô tả và hình minh họa sau đây dựa trên các bánh xe màu trong đó góc sắc độ tăng theo chiều kim đồng hồ. Lưu ý rằng có những bánh xe màu mà việc tăng góc sẽ là thao tác ngược chiều kim đồng hồ.

Với một cặp góc sắc độ `θ1` và `θ2` được chuẩn hóa về khoảng `[0deg, 360deg)`, có bốn thuật toán để xác định cung nào được sử dụng khi nội suy từ `θ1` đến `θ2`:

- `shorter`
  - : Sử dụng cung ngắn hơn. Khi hai bán kính trùng nhau, cung suy biến thành một điểm. Khi cả hai cung có cùng độ dài:
    - Nếu `θ1 < θ2`, sử dụng cung theo chiều kim đồng hồ;
    - Nếu `θ1 > θ2`, sử dụng cung ngược chiều kim đồng hồ.

    | `θ1 = 45deg`, `θ2 = 135deg`                                        | `θ1 = 135deg`, `θ2 = 45deg`                                        |
    | ------------------------------------------------------------------ | ------------------------------------------------------------------ |
    | ![shorter với θ1 = 45deg và θ2 = 135deg](shorter_increasing.png) | ![shorter với θ1 = 135deg và θ2 = 45deg](shorter_decreasing.png) |

- `longer`
  - : Sử dụng cung dài hơn. Khi hai bán kính trùng nhau:
    - Nếu `θ1 ≤ θ2`, cung trở thành chu vi đầy đủ theo chiều kim đồng hồ.
    - Nếu `θ1 > θ2`, cung trở thành chu vi đầy đủ ngược chiều kim đồng hồ.

    Khi cả hai cung có cùng độ dài:
    - Nếu `θ1 < θ2`, sử dụng cung theo chiều kim đồng hồ;
    - Nếu `θ1 > θ2`, sử dụng cung ngược chiều kim đồng hồ.

    | `θ1 = 45deg`, `θ2 = 135deg`                                      | `θ1 = 135deg`, `θ2 = 45deg`                                      |
    | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
    | ![longer với θ1 = 45deg và θ2 = 135deg](longer_decreasing.png) | ![longer với θ1 = 135deg và θ2 = 45deg](longer_increasing.png) |

- `increasing`
  - : Sử dụng cung theo chiều kim đồng hồ. Khi hai bán kính trùng nhau, cung suy biến thành một điểm.

    | `θ1 = 45deg`, `θ2 = 135deg`                                           | `θ1 = 135deg`, `θ2 = 45deg`                                          |
    | --------------------------------------------------------------------- | -------------------------------------------------------------------- |
    | ![increasing với θ1 = 45deg và θ2 = 135deg](shorter_increasing.png) | ![increasing với θ1 = 135deg và θ2 = 45deg](longer_increasing.png) |

- `decreasing`
  - : Sử dụng cung ngược chiều kim đồng hồ. Khi hai bán kính trùng nhau, cung suy biến thành một điểm.

    | `θ1 = 45deg`, `θ2 = 135deg`                                          | `θ1 = 135deg`, `θ2 = 45deg`                                           |
    | -------------------------------------------------------------------- | --------------------------------------------------------------------- |
    | ![decreasing với θ1 = 45deg và θ2 = 135deg](longer_decreasing.png) | ![decreasing với θ1 = 135deg và θ2 = 45deg](shorter_decreasing.png) |

Vì chỉ có hai cung để lựa chọn, các thuật toán này tương đương theo từng cặp trong một số trường hợp nhất định. Cụ thể:

- Nếu `0deg < θ2 - θ1 < 180deg` hoặc `θ2 - θ1 < -180deg`, `shorter` và `increasing` tương đương, trong khi `longer` và `decreasing` tương đương.
- Nếu `-180deg < θ2 - θ1 < 0deg` hoặc `θ2 - θ1 > 180deg`, `shorter` và `decreasing` tương đương, trong khi `longer` và `increasing` tương đương.

Một đặc điểm đáng chú ý của `increasing` và `decreasing` là khi sự chênh lệch góc sắc độ vượt qua `180deg` trong quá trình chuyển đổi hoặc hoạt ảnh, cung sẽ không lật sang phía bên kia như `shorter` và `longer` làm.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### So sánh các thuật toán nội suy sắc độ

Ví dụ sau đây cho thấy hiệu ứng của việc sử dụng các thuật toán nội suy sắc độ khác nhau trong {{CSSXref("gradient/linear-gradient", "linear-gradient()")}}.

#### HTML

```html
<div class="hsl">
  <p>HSL</p>
</div>
<div class="hsl-increasing">
  <p>HSL increasing</p>
</div>
<div class="hsl-decreasing">
  <p>HSL decreasing</p>
</div>
<div class="hsl-shorter">
  <p>HSL shorter</p>
</div>
<div class="hsl-longer">
  <p>HSL longer</p>
</div>
<div class="hsl-named">
  <p>HSL named</p>
</div>
<div class="hsl-named-longer">
  <p>HSL named (longer)</p>
</div>
```

#### CSS

```css hidden
div {
  border: 1px solid black;
  height: 50px;
  margin: 10px;
  width: 90%;
}
p {
  color: white;
  margin: 6px;
}

/* Fallback styles */
.hsl,
.hsl-shorter,
.hsl-named {
  background: linear-gradient(
    to right,
    hsl(39 100% 50%),
    hsl(46 100% 50%),
    hsl(53 100% 50%),
    hsl(60 100% 50%)
  );
}
.hsl-increasing {
  background: linear-gradient(
    to right,
    hsl(190 100% 50%),
    hsl(225 100% 50%),
    hsl(260 100% 50%),
    hsl(295 100% 50%),
    hsl(330 100% 50%),
    hsl(365 100% 50%),
    hsl(400 100% 50%),
    hsl(435 100% 50%),
    hsl(470 100% 50%),
    hsl(505 100% 50%),
    hsl(540 100% 50%)
  );
}
.hsl-decreasing,
.hsl-longer,
.hsl-named-longer {
  background: linear-gradient(
    to right,
    hsl(399 100% 50%),
    hsl(368 100% 50%),
    hsl(337 100% 50%),
    hsl(307 100% 50%),
    hsl(276 100% 50%),
    hsl(245 100% 50%),
    hsl(214 100% 50%),
    hsl(183 100% 50%),
    hsl(152 100% 50%),
    hsl(122 100% 50%),
    hsl(91 100% 50%),
    hsl(60 100% 50%)
  );
}
```

```css
.hsl {
  background: linear-gradient(
    to right in hsl,
    hsl(39deg 100% 50%),
    hsl(60deg 100% 50%)
  );
}
.hsl-increasing {
  background: linear-gradient(
    to right in hsl increasing hue,
    hsl(190deg 100% 50%),
    hsl(180deg 100% 50%)
  );
}
.hsl-decreasing {
  background: linear-gradient(
    to right in hsl decreasing hue,
    hsl(39deg 100% 50%),
    hsl(60deg 100% 50%)
  );
}
.hsl-shorter {
  background: linear-gradient(
    to right in hsl shorter hue,
    hsl(39deg 100% 50%),
    hsl(60deg 100% 50%)
  );
}
.hsl-longer {
  background: linear-gradient(
    to right in hsl longer hue,
    hsl(39deg 100% 50%),
    hsl(60deg 100% 50%)
  );
}
.hsl-named {
  background: linear-gradient(to right in hsl, orange, yellow);
}
.hsl-named-longer {
  background: linear-gradient(to right in hsl longer hue, orange, yellow);
}
```

#### Kết quả

{{EmbedLiveSample("comparing_hue_interpolation_methods", "100%", 500)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSXref("&lt;color-interpolation-method&gt;")}}
- Kiểu dữ liệu {{cssxref("hue")}}
