---
title: drop-shadow()
slug: Web/CSS/Reference/Values/filter-function/drop-shadow
page-type: css-function
browser-compat: css.types.filter-function.drop-shadow
sidebar: cssref
---

Hàm **`drop-shadow()`** [CSS](/vi/docs/Web/CSS) áp dụng hiệu ứng đổ bóng lên ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: drop-shadow()")}}

```css interactive-example-choice
filter: drop-shadow(30px 10px 4px #4444dd);
```

```css interactive-example-choice
filter: drop-shadow(0 -6mm 4mm rgb(160 0 210));
```

```css interactive-example-choice
filter: drop-shadow(0 0 0.75rem crimson);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

Bóng đổ thực chất là một phiên bản làm mờ và dịch chuyển của mặt nạ alpha của ảnh đầu vào, được vẽ theo màu cụ thể và ghép bên dưới ảnh.

> [!NOTE]
> Hàm này có phần tương tự với thuộc tính {{Cssxref("box-shadow")}}. Thuộc tính `box-shadow` tạo ra bóng hình chữ nhật phía sau _toàn bộ hộp_ của phần tử, trong khi hàm bộ lọc `drop-shadow()` tạo ra bóng phù hợp với hình dạng (kênh alpha) của _chính ảnh đó_.

## Cú pháp

```css
/* Hai giá trị độ dài */
/* drop-shadow( <length> <length> ) */
drop-shadow(5px 5px)

/* Ba giá trị độ dài */
/* drop-shadow( <length> <length> <length> ) */
drop-shadow(5px 5px 15px)

/* Hai giá trị độ dài và một màu */
/* drop-shadow( <length> <length> <color> ) */
drop-shadow(5px 5px red)

/* Ba giá trị độ dài và một màu */
/* drop-shadow( <length> <length> <length> <color> ) */
drop-shadow(5px 5px 15px red)

/* Thứ tự màu và giá trị độ dài có thể hoán đổi */
/* drop-shadow( <color> <length> <length> <length> ) */
drop-shadow(#ee2233 0.5rem 0.5rem 1rem)

/* Truyền nhiều bóng đổ vào bộ lọc để xếp chồng */
drop-shadow(10px 10px red) drop-shadow(-5px -5px yellow)
```

Hàm `drop-shadow()` chấp nhận tham số kiểu `<shadow>` (được định nghĩa trong thuộc tính {{cssxref("box-shadow")}}), ngoại trừ từ khóa `inset` và tham số `spread` không được phép.

### Tham số

- `<color>` {{optional_inline}}
  - : Chỉ định màu cho bóng. Nếu không chỉ định, giá trị của thuộc tính {{cssxref("color")}} được định nghĩa trong phần tử cha sẽ được sử dụng.

- `<length>`
  - : Chỉ định độ dài bù của bóng. Tham số này chấp nhận hai hoặc ba giá trị. Nếu hai giá trị được chỉ định, chúng được hiểu là `<offset-x>` (bù ngang) và `<offset-y>` (bù dọc). Giá trị `<offset-x>` âm đặt bóng sang trái phần tử. Giá trị `<offset-y>` âm đặt bóng lên trên phần tử. Nếu giá trị thứ ba được chỉ định, nó được hiểu là `<standard-deviation>`, là giá trị độ lệch chuẩn cho hàm [làm mờ Gaussian](https://en.wikipedia.org/wiki/Gaussian_blur). Giá trị `<standard-deviation>` lớn hơn tạo ra bóng lớn hơn và mờ hơn. Giá trị âm cho `<standard-deviation>` không được phép.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Thiết lập bóng đổ

```html
<div>drop-shadow(16px 16px)</div>
<div>drop-shadow(16px 16px red)</div>
<div>drop-shadow(red 1rem 1rem 10px)</div>
<div>drop-shadow(-16px -16px red)</div>
<div>
  drop-shadow(1px 1px red) drop-shadow(1px -1px red) drop-shadow(-1px 1px red)
  drop-shadow(-1px -1px red)
</div>
```

```css
div {
  display: inline-block;
  margin: 0 0.5rem 2rem 1rem;
  padding: 0.5rem;
  height: 100px;
  width: 190px;
  vertical-align: top;
  background-color: #222222;

  color: lime;
}

div:nth-child(1) {
  filter: drop-shadow(16px 16px);
}

div:nth-child(2) {
  filter: drop-shadow(16px 16px red);
}

div:nth-child(3) {
  filter: drop-shadow(red 1rem 1rem 10px);
}

div:nth-child(4) {
  filter: drop-shadow(-16px -16px red);
}

div:nth-child(5) {
  filter: drop-shadow(1px 1px red) drop-shadow(1px -1px red)
    drop-shadow(-1px 1px red) drop-shadow(-1px -1px red);
}
```

{{EmbedLiveSample("Setting a drop shadow", "100%", "300px")}}

Khi không có giá trị `<color>` trong hàm `drop-shadow()` ở hộp đầu tiên, bóng sử dụng giá trị của thuộc tính `color` từ phần tử (`lime`). Bóng thứ hai và thứ ba minh họa rằng giá trị độ dài và màu có thể được chỉ định theo bất kỳ thứ tự nào. Bóng thứ ba cho thấy hiệu ứng làm mờ khi giá trị `<length>` thứ ba được chỉ định. Bóng thứ tư sử dụng bù âm, dịch chuyển bóng sang trái và lên trên. Ví dụ thứ năm cho thấy cách dùng nhiều bóng đổ trên một phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hàm {{cssxref("filter-function")}}:
  - {{cssxref("filter-function/blur", "blur()")}}
  - {{cssxref("filter-function/brightness", "brightness()")}}
  - {{cssxref("filter-function/contrast", "contrast()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/opacity", "opacity()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
- {{cssxref("filter")}}
- {{cssxref("backdrop-filter")}}
- {{cssxref("box-shadow")}}
- {{cssxref("text-shadow")}}
- [Giới thiệu về bóng văn bản](/vi/docs/Web/CSS/Guides/Text_decoration/Text_shadows)
- Module [hiệu ứng bộ lọc CSS](/vi/docs/Web/CSS/Guides/Filter_effects)
