---
title: font-family
slug: Web/CSS/Reference/Properties/font-family
page-type: css-property
browser-compat: css.properties.font-family
sidebar: cssref
---

Thuộc tính **`font-family`** [CSS](/en-US/docs/Web/CSS) chỉ định một danh sách ưu tiên gồm một hoặc nhiều tên họ font và/hoặc tên họ font chung cho phần tử được chọn.

{{InteractiveExample("CSS Demo: font-family")}}

```css interactive-example-choice
font-family: "Georgia", serif;
```

```css interactive-example-choice
font-family: "Gill Sans", sans-serif;
```

```css interactive-example-choice
font-family: sans-serif;
```

```css interactive-example-choice
font-family: serif;
```

```css interactive-example-choice
font-family: cursive;
```

```css interactive-example-choice
font-family: system-ui;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather. As much mud in the streets
    as if the waters had but newly retired from the face of the earth, and it
    would not be wonderful to meet a Megalosaurus, forty feet long or so,
    waddling like an elephantine lizard up Holborn Hill.
  </p>
</section>
```

```css interactive-example
section {
  font-size: 1.2em;
}
```

Các giá trị được ngăn cách bằng dấu phẩy để chỉ ra rằng chúng là các lựa chọn thay thế. Trình duyệt sẽ chọn font đầu tiên trong danh sách đã được cài đặt hoặc có thể tải xuống bằng quy tắc at {{CSSxRef("@font-face")}}.

Thường tiện lợi hơn khi sử dụng thuộc tính viết tắt {{CSSxRef("font")}} để đặt `font-size` và các thuộc tính liên quan đến font cùng một lúc.

Bạn nên luôn bao gồm ít nhất một tên họ font chung trong danh sách `font-family`, vì không có gì đảm bảo rằng bất kỳ font cụ thể nào sẽ khả dụng. Điều này cho phép trình duyệt chọn một font dự phòng chấp nhận được khi cần thiết.

Thuộc tính `font-family` chỉ định một danh sách font, từ mức ưu tiên cao nhất đến thấp nhất. Việc chọn font _không_ dừng lại ở font đầu tiên trong danh sách có trên hệ thống của người dùng. Thay vào đó, việc chọn font được thực hiện _từng ký tự một_, sao cho nếu một font khả dụng không có glyph cho một ký tự cần thiết, các font tiếp theo sẽ được thử. Khi một font chỉ khả dụng ở một số [kiểu](/en-US/docs/Web/CSS/Reference/Properties/font-style), [biến thể](/en-US/docs/Web/CSS/Reference/Properties/font-variant), hoặc [kích thước](/en-US/docs/Web/CSS/Reference/Properties/font-size) nhất định, những thuộc tính đó cũng có thể ảnh hưởng đến họ font nào được chọn.

## Cú pháp

```css
/* Tên họ font và tên họ font chung */
font-family: "Gill Sans Extrabold", sans-serif;
font-family: "Goudy Bookletter 1911", sans-serif;

/* Chỉ tên họ font chung */
font-family: serif;
font-family: sans-serif;
font-family: monospace;
font-family: cursive;
font-family: fantasy;
font-family: system-ui;
font-family: ui-serif;
font-family: ui-sans-serif;
font-family: ui-monospace;
font-family: ui-rounded;
font-family: math;
font-family: fangsong;

/* Giá trị toàn cục */
font-family: inherit;
font-family: initial;
font-family: revert;
font-family: revert-layer;
font-family: unset;
```

Thuộc tính `font-family` liệt kê một hoặc nhiều họ font, ngăn cách bằng dấu phẩy. Mỗi họ font được chỉ định dưới dạng giá trị `<family-name>` hoặc `<generic-name>`.

Ví dụ dưới đây liệt kê hai họ font, cái đầu với `<family-name>` và cái thứ hai với `<generic-name>`:

```css
font-family: "Gill Sans Extrabold", sans-serif;
```

### Các giá trị

- `<family-name>`
  - : Tên của một họ font. Đây phải là giá trị {{cssxref("string")}} đơn hoặc một chuỗi các giá trị {{cssxref("custom-ident")}} phân cách bằng khoảng trắng. Các giá trị chuỗi phải được đặt trong dấu ngoặc kép nhưng có thể chứa bất kỳ ký tự Unicode nào. Các định danh tùy chỉnh không được đặt trong ngoặc kép, nhưng một số ký tự phải được thoát.

    Nên đặt tên họ font trong dấu ngoặc kép nếu chứa khoảng trắng, chữ số, hoặc ký tự dấu câu khác dấu gạch nối.

    Xem thêm [Tên họ font hợp lệ](#valid_family_names).

- `<generic-name>`
  - : Họ font chung là cơ chế dự phòng, một phương tiện để bảo tồn một phần ý định của tác giả stylesheet khi không có font nào được chỉ định khả dụng. Tên họ font chung là các từ khóa và không được đặt trong dấu ngoặc kép. Họ font chung nên là mục cuối cùng trong danh sách tên họ font. Các từ khóa sau được định nghĩa:
    - `serif`
      - : Các glyph có nét kết thúc, đầu mở rộng hoặc thon dần, hoặc có kết thúc chân có chân.

        Ví dụ: Lucida Bright, Lucida Fax, Palatino, Palatino Linotype, Palladio, URW Palladio, serif.

    - `sans-serif`
      - : Các glyph có nét kết thúc phẳng.

        Ví dụ: Open Sans, Fira Sans, Lucida Sans, Lucida Sans Unicode, Trebuchet MS, Liberation Sans, Nimbus Sans L, sans-serif.

    - `monospace`
      - : Tất cả các glyph có cùng chiều rộng cố định.

        Ví dụ: Fira Mono, DejaVu Sans Mono, Menlo, Consolas, Liberation Mono, Monaco, Lucida Console, monospace.

    - `cursive`
      - : Các glyph trong font cursive thường có nét nối hoặc các đặc điểm cursive khác ngoài những nét của kiểu chữ italic. Các glyph được kết nối một phần hoặc hoàn toàn, và kết quả trông giống với nét viết tay bằng bút hoặc cọ hơn là chữ in.

        Ví dụ: Brush Script MT, Brush Script Std, Lucida Calligraphy, Lucida Handwriting, Apple Chancery, cursive.

    - `fantasy`
      - : Font fantasy chủ yếu là các font trang trí chứa các biểu diễn vui nhộn của ký tự.

        Ví dụ: Papyrus, Herculanum, Party LET, Curlz MT, Harrington, fantasy.

    - `system-ui`
      - : Các glyph được lấy từ font giao diện người dùng mặc định trên nền tảng nhất định. Vì các truyền thống kiểu chữ rất đa dạng trên thế giới, họ font chung này được cung cấp cho các kiểu chữ không ánh xạ gọn gàng vào các họ font chung khác.
        > [!NOTE]
        > Như tên gợi ý, `system-ui` được thiết kế để làm cho các phần tử giao diện người dùng trông giống như ứng dụng gốc, không dành cho việc trình bày các đoạn văn bản dài. Nó có thể khiến kiểu chữ hiển thị không mong muốn cho một số người dùng — ví dụ, font CJK mặc định của Windows có thể hiển thị chữ Latin kém, và thuộc tính `lang` có thể không ảnh hưởng đến font hiển thị. Một số hệ điều hành không cho phép tùy chỉnh `system-ui`, trong khi trình duyệt thường cho phép tùy chỉnh họ font `sans-serif`. Đối với các đoạn văn dài, hãy dùng `sans-serif` hoặc họ font không phải UI khác.
    - `ui-serif`
      - : Font giao diện người dùng serif mặc định.
    - `ui-sans-serif`
      - : Font giao diện người dùng sans-serif mặc định.
    - `ui-monospace`
      - : Font giao diện người dùng monospace mặc định.
    - `ui-rounded`
      - : Font giao diện người dùng mặc định có các nét bo tròn.
    - `math`
      - : Font giải quyết các vấn đề kiểu chữ đặc biệt của việc biểu diễn toán học: chỉ số trên và dưới, dấu ngoặc bắc qua nhiều dòng, biểu thức lồng nhau, và các glyph đánh đôi với các nghĩa riêng biệt.
        Các stylesheet UA có thể đặt `math { font-family: math }` để phần tử {{MathMLElement("math")}} sử dụng font phù hợp theo mặc định.
    - `fangsong`
      - : Một kiểu chữ Hán cụ thể nằm giữa kiểu có chân Song và kiểu chữ viết Kai. Kiểu này thường được dùng cho các tài liệu chính phủ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Một số họ font phổ biến

```css
.serif {
  font-family: "Times", "Times New Roman", "Georgia", serif;
}

.sansserif {
  font-family: "Verdana", "Helvetica", "Arial", sans-serif;
}

.monospace {
  font-family: "Lucida Console", "Courier New", monospace;
}

.cursive {
  font-family: cursive;
}

.fantasy {
  font-family: fantasy;
}

.math {
  font-family: math;
}

.fangsong {
  font-family: fangsong;
}
```

```css hidden
div {
  margin: 0.5rem;
}
```

```html hidden
<div class="serif">This is an example of a serif font.</div>

<div class="sansserif">This is an example of a sans-serif font.</div>

<div class="monospace">This is an example of a monospace font.</div>

<div class="cursive">This is an example of a cursive font.</div>

<div class="fantasy">This is an example of a fantasy font.</div>

<div class="fangsong">This is an example of a fangsong font.</div>

<div class="math">This is an example of a math font: ℝ, ∫, ∑…</div>
```

{{EmbedLiveSample("Some_common_font_families", 600, 220)}}

### Tên họ font hợp lệ

Các khai báo sau là hợp lệ:

```css example-good
font-family: "Goudy Bookletter 1911", sans-serif;
```

Các khai báo sau là không hợp lệ:

```css-nolint example-bad
font-family: Goudy Bookletter 1911, sans-serif;
font-family: Red/Black, sans-serif;
font-family: "Lucida" Grande, sans-serif;
font-family: Ahem!, sans-serif;
font-family: test@foo, sans-serif;
font-family: #POUND, sans-serif;
font-family: Hawaii 5-0, sans-serif;
```

Ví dụ sau về mặt kỹ thuật là hợp lệ nhưng không được khuyến nghị:

```css
font-family:
  Gill Sans Extrabold,
  sans-serif;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-style")}}
- {{cssxref("font-weight")}}
- {{cssxref("font-variant-emoji")}}
- Thuộc tính SVG {{SVGAttr("font-family")}}
- [Học: Định dạng văn bản và font cơ bản](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
