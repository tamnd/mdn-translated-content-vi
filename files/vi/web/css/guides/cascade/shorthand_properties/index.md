---
title: Shorthand properties
slug: Web/CSS/Guides/Cascade/Shorthand_properties
page-type: guide
sidebar: cssref
---

**_Shorthand properties_** là các thuộc tính CSS cho phép bạn đặt các giá trị của nhiều thuộc tính CSS khác trong một khai báo duy nhất. Sử dụng shorthand property, bạn có thể viết các style sheet ngắn gọn hơn (và thường dễ đọc hơn), tiết kiệm thời gian và công sức.

Đặc tả CSS định nghĩa shorthand properties để nhóm các định nghĩa của các thuộc tính phổ biến tác động đến cùng một chủ đề. Ví dụ, thuộc tính CSS {{cssxref("background")}} là một shorthand property có thể định nghĩa các giá trị của {{cssxref("background-color")}}, {{cssxref("background-image")}}, {{cssxref("background-repeat")}} và {{cssxref("background-position")}}.

## Các trường hợp đặc biệt cần chú ý

Có một số trường hợp đặc biệt cần lưu ý khi sử dụng shorthand properties.

### Bỏ qua thuộc tính

Một giá trị không được chỉ định sẽ được đặt thành giá trị mặc định được định nghĩa bởi shorthand, có thể khác với initial value của thuộc tính đó.

Điều đó có nghĩa là nó **ghi đè** các giá trị đã được đặt trước đó.
Ví dụ:

```css
p {
  background-color: red;
  background: url("images/bg.gif") no-repeat left top;
}
```

Điều này sẽ không đặt màu nền thành `red` mà thành giá trị mặc định của {{cssxref("background-color")}}, đó là `transparent`.

Chỉ có thể kế thừa các giá trị của thuộc tính riêng lẻ. Vì các giá trị bị thiếu được thay thế bằng initial value của chúng, không thể cho phép kế thừa các thuộc tính riêng lẻ bằng cách bỏ qua chúng. Từ khóa `inherit` có thể được áp dụng cho một thuộc tính, nhưng chỉ như một toàn thể, không phải như từ khóa cho một giá trị hay giá trị khác. Điều đó có nghĩa là cách duy nhất để làm cho một số giá trị cụ thể được kế thừa là sử dụng longhand property với từ khóa `inherit`.

### Thứ tự thuộc tính

Shorthand properties cố gắng không bắt buộc một thứ tự cụ thể cho các giá trị của các thuộc tính chúng thay thế. Điều này hoạt động tốt khi các thuộc tính này sử dụng các giá trị thuộc các kiểu khác nhau, vì thứ tự không quan trọng, nhưng điều này không hoạt động dễ dàng khi một số thuộc tính có thể có giá trị giống nhau.

Hai trường hợp quan trọng ở đây là:

- Các thuộc tính liên quan đến các cạnh của box, như {{cssxref("border-style")}}, {{cssxref("margin")}} hoặc {{cssxref("padding")}}
- Các thuộc tính liên quan đến các góc của box, như {{cssxref("border-radius")}}

#### Các cạnh của box

Shorthand xử lý các thuộc tính liên quan đến các cạnh của box, như {{cssxref("border-style")}}, {{cssxref("margin")}} hoặc {{cssxref("padding")}}, luôn sử dụng cú pháp nhất quán từ 1 đến 4 giá trị đại diện cho các cạnh đó:

- **Cú pháp 1 giá trị:** `border-width: 1em` — Giá trị đơn đại diện cho tất cả các cạnh: ![Box edges with one-value syntax](border1.png)

- **Cú pháp 2 giá trị:** `border-width: 1em 2em` — Giá trị đầu tiên đại diện cho các cạnh dọc, tức là trên và dưới, giá trị thứ hai đại diện cho các cạnh ngang, tức là trái và phải: ![Box edges with two-value syntax](border2.png)

- **Cú pháp 3 giá trị:** `border-width: 1em 2em 3em` — Giá trị đầu tiên đại diện cho cạnh trên, giá trị thứ hai đại diện cho các cạnh ngang, tức là trái và phải, và giá trị thứ ba đại diện cho cạnh dưới: ![Box edges with three-value syntax](border3.png)

- **Cú pháp 4 giá trị:** `border-width: 1em 2em 3em 4em` — Bốn giá trị đại diện lần lượt cho cạnh trên, phải, dưới và trái, luôn theo thứ tự đó, tức là theo chiều kim đồng hồ bắt đầu từ trên: ![Box edges with four-value syntax](border4.png) Chữ cái đầu của Top-Right-Bottom-Left khớp với thứ tự phụ âm của từ _trouble_: TRBL. Bạn cũng có thể nhớ nó theo thứ tự tay quay của đồng hồ: `1em` bắt đầu ở vị trí 12 giờ, sau đó `2em` ở vị trí 3 giờ, sau đó `3em` ở vị trí 6 giờ, và `4em` ở vị trí 9 giờ.

#### Các góc của box

Tương tự, shorthand xử lý các thuộc tính liên quan đến các góc của box, như {{cssxref("border-radius")}}, luôn sử dụng cú pháp nhất quán từ 1 đến 4 giá trị đại diện cho các góc đó:

- **Cú pháp 1 giá trị:** `border-radius: 1em` — Giá trị đơn đại diện cho tất cả các góc: ![Box corners with one-value syntax](corner1.png)

- **Cú pháp 2 giá trị:** `border-radius: 1em 2em` — Giá trị đầu tiên đại diện cho góc trên trái và dưới phải, giá trị thứ hai đại diện cho góc trên phải và dưới trái: ![Box corners with two-value syntax](corner2.png)

- **Cú pháp 3 giá trị:** `border-radius: 1em 2em 3em` — Giá trị đầu tiên đại diện cho góc trên trái, giá trị thứ hai đại diện cho góc trên phải và dưới trái, và giá trị thứ ba đại diện cho góc dưới phải: ![Box corners with three-value syntax](corner3.png)

- **Cú pháp 4 giá trị:** `border-radius: 1em 2em 3em 4em` — Bốn giá trị đại diện lần lượt cho các góc trên trái, trên phải, dưới phải và dưới trái, luôn theo thứ tự đó, tức là theo chiều kim đồng hồ bắt đầu từ trên trái: ![Box corners with four-value syntax](corner4.png)

## Thuộc tính background

Hãy xem xét một background với các thuộc tính sau

```css
background-color: black;
background-image: url("images/bg.gif");
background-repeat: no-repeat;
background-position: left top;
```

Bốn khai báo này có thể được rút ngắn thành chỉ một:

```css
background: black url("images/bg.gif") no-repeat left top;
```

(Dạng shorthand thực sự tương đương với các longhand properties ở trên cộng với `background-attachment: scroll` và, trong CSS3, một số thuộc tính bổ sung.)

Xem {{cssxref("background")}} để biết thêm thông tin chi tiết, bao gồm cả các thuộc tính CSS3.

## Thuộc tính font

Hãy xem xét các khai báo sau:

```css
font-style: italic;
font-weight: bold;
font-size: 0.8em;
line-height: 1.2;
font-family: "Arial", sans-serif;
```

5 khai báo này có thể được rút ngắn thành như sau:

```css
font:
  italic bold 0.8em/1.2 "Arial",
  sans-serif;
```

Khai báo shorthand này thực sự tương đương với các longhand declarations ở trên cộng với `font-variant: normal`, `font-size-adjust: none` và `font-stretch: normal`.

## Thuộc tính border

Với borders, chiều rộng, màu sắc và kiểu có thể được đơn giản hóa thành một khai báo. Ví dụ, hãy xem xét CSS sau:

```css
border-width: 1px;
border-style: solid;
border-color: black;
```

Nó có thể được đơn giản hóa thành:

```css
border: 1px solid black;
```

## Thuộc tính margin và padding

Các phiên bản shorthand của giá trị margin và padding hoạt động tương tự; thuộc tính margin cho phép các giá trị shorthand được chỉ định bằng một, hai, ba hoặc bốn giá trị. Hãy xem xét các khai báo CSS sau:

```css
margin-top: 10px;
margin-right: 5px;
margin-bottom: 10px;
margin-left: 5px;
```

Chúng giống với khai báo sau sử dụng shorthand bốn giá trị. Lưu ý rằng các giá trị theo thứ tự chiều kim đồng hồ, bắt đầu từ trên: trên, phải, dưới, rồi trái (TRBL, các phụ âm trong "trouble").

```css
margin: 10px 5px 10px 5px;
```

Quy tắc shorthand margin cho một, hai, ba và bốn giá trị khai báo là:

- Khi chỉ định **một** giá trị, nó áp dụng cùng margin cho **tất cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, margin đầu tiên áp dụng cho **trên và dưới**, cái thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, margin đầu tiên áp dụng cho **trên**, cái thứ hai cho **trái và phải**, cái thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các margin áp dụng cho **trên**, **phải**, **dưới** và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

## Thuộc tính position

Với position, các phiên bản shorthand của top, right, bottom và left có thể được đơn giản hóa thành một khai báo. Ví dụ, hãy xem xét CSS sau:

```css
top: 0;
right: 20px;
bottom: 0;
left: 20px;
```

Nó có thể được đơn giản hóa thành:

```css
inset: 0 20px 0 20px;
```

Giống như margins và paddings, các giá trị inset được sắp xếp theo chiều kim đồng hồ — trên, phải, dưới, rồi trái (TRBL).

## Shorthand property phổ quát

CSS cung cấp một shorthand property phổ quát, {{cssxref("all")}}, áp dụng giá trị của nó cho mỗi thuộc tính trong tài liệu. Mục đích của nó là thay đổi mô hình inheritance của các thuộc tính.

Xem [Handling conflicts](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts) hoặc [Giới thiệu về CSS Cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) để biết thêm thông tin về cách inheritance hoạt động trong CSS.

## Shorthand properties

- {{cssxref("all")}}
- {{cssxref("animation")}}
- {{cssxref("animation-range")}}
- {{cssxref("background")}}
- {{cssxref("border")}}
- {{cssxref("border-block")}}
- {{cssxref("border-block-end")}}
- {{cssxref("border-block-start")}}
- {{cssxref("border-bottom")}}
- {{cssxref("border-color")}}
- {{cssxref("border-image")}}
- {{cssxref("border-inline")}}
- {{cssxref("border-inline-end")}}
- {{cssxref("border-inline-start")}}
- {{cssxref("border-left")}}
- {{cssxref("border-radius")}}
- {{cssxref("border-right")}}
- {{cssxref("border-style")}}
- {{cssxref("border-top")}}
- {{cssxref("border-width")}}
- {{cssxref("column-rule")}}
- {{cssxref("columns")}}
- {{cssxref("contain-intrinsic-size")}}
- {{cssxref("container")}}
- {{cssxref("flex")}}
- {{cssxref("flex-flow")}}
- {{cssxref("font")}}
- {{cssxref("font-synthesis")}}
- {{cssxref("font-variant")}}
- {{cssxref("gap")}}
- {{cssxref("grid")}}
- {{cssxref("grid-area")}}
- {{cssxref("grid-column")}}
- {{cssxref("grid-row")}}
- {{cssxref("grid-template")}}
- {{cssxref("inset")}}
- {{cssxref("inset-block")}}
- {{cssxref("inset-inline")}}
- {{cssxref("list-style")}}
- {{cssxref("margin")}}
- {{cssxref("margin-block")}}
- {{cssxref("margin-inline")}}
- {{cssxref("mask")}}
- {{cssxref("mask-border")}}
- {{cssxref("offset")}}
- {{cssxref("outline")}}
- {{cssxref("overflow")}}
- {{cssxref("overscroll-behavior")}}
- {{cssxref("padding")}}
- {{cssxref("padding-block")}}
- {{cssxref("padding-inline")}}
- {{cssxref("place-content")}}
- {{cssxref("place-items")}}
- {{cssxref("place-self")}}
- {{cssxref("position-try")}}
- {{cssxref("scroll-margin")}}
- {{cssxref("scroll-margin-block")}}
- {{cssxref("scroll-margin-inline")}}
- {{cssxref("scroll-padding")}}
- {{cssxref("scroll-padding-block")}}
- {{cssxref("scroll-padding-inline")}}
- {{cssxref("scroll-timeline")}}
- {{cssxref("text-box")}}
- {{cssxref("text-decoration")}}
- {{cssxref("text-emphasis")}}
- {{cssxref("text-wrap")}}
- {{cssxref("transition")}}
- {{cssxref("view-timeline")}}
- {{cssxref("-webkit-text-stroke")}}
- {{cssxref("-webkit-border-before")}}
- {{cssxref("-webkit-mask-box-image")}}

## Xem thêm

- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
- [Giới thiệu cú pháp CSS: declarations, rulesets và statements](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- [At-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules)
- [Specificity](/en-US/docs/Web/CSS/Guides/Cascade/Specificity)
- [Inheritance](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance)
- [Giới thiệu về CSS cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction)
- [Học: Xử lý xung đột](/en-US/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts)
- [Học: Cascade layers](/en-US/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- [Mô hình định dạng trực quan](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model)
- Giá trị: [initial](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value), [computed](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value), [used](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#used_value), và [actual](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#actual_value)
- [Value definition syntax](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
