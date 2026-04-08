---
title: hyphens
slug: Web/CSS/Reference/Properties/hyphens
page-type: css-property
browser-compat: css.properties.hyphens
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`hyphens`** xác định cách các từ nên được gạch nối khi văn bản xuống dòng trên nhiều dòng. Nó có thể ngăn hoàn toàn việc gạch nối, gạch nối tại các điểm được chỉ định thủ công trong văn bản, hoặc để trình duyệt tự động chèn gạch nối ở những vị trí thích hợp.

{{InteractiveExample("CSS Demo: hyphens")}}

```css interactive-example-choice
hyphens: none;
```

```css interactive-example-choice
hyphens: manual;
```

```css interactive-example-choice
hyphens: auto;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">An extra­ordinarily long English word!</p>
</section>
```

```css interactive-example
#example-element {
  border: 2px dashed #999999;
  font-size: 1.5rem;
  text-align: left;
  width: 7rem;
}
```

> [!NOTE]
> Trong bản demo trên, chuỗi "An extraordinarily long English word!" chứa ký tự ẩn `&shy;` (gạch nối mềm): `An extra&shy;ordinarily long English word!`. Ký tự này được dùng để chỉ ra vị trí tiềm năng có thể chèn gạch nối khi `hyphens: manual;` được chỉ định.

Quy tắc gạch nối phụ thuộc vào ngôn ngữ. Trong HTML, ngôn ngữ được xác định bởi thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang), và trình duyệt sẽ gạch nối chỉ khi thuộc tính này có mặt và từ điển gạch nối phù hợp được cài đặt. Trong XML, thuộc tính [`xml:lang`](/en-US/docs/Web/SVG/Reference/Attribute/xml:lang) phải được sử dụng.

> [!NOTE]
> Các quy tắc xác định cách thực hiện gạch nối không được định nghĩa rõ ràng trong đặc tả, do đó cách gạch nối chính xác có thể khác nhau giữa các trình duyệt.

Nếu được hỗ trợ, {{cssxref("hyphenate-character")}} có thể được dùng để chỉ định một ký tự gạch nối thay thế ở cuối dòng đang ngắt.

## Cú pháp

```css
/* Giá trị từ khóa */
hyphens: none;
hyphens: manual;
hyphens: auto;

/* Giá trị toàn cục */
hyphens: inherit;
hyphens: initial;
hyphens: revert;
hyphens: revert-layer;
hyphens: unset;
```

Thuộc tính `hyphens` được chỉ định là một giá trị từ khóa đơn được chọn từ danh sách bên dưới.

### Giá trị

- `none`
  - : Các từ không bị ngắt tại điểm xuống dòng, ngay cả khi các ký tự bên trong từ gợi ý điểm ngắt dòng. Các dòng chỉ ngắt tại khoảng trắng.
- `manual`
  - : Giá trị mặc định. Các từ chỉ bị ngắt để xuống dòng tại những chỗ mà các ký tự bên trong từ gợi ý cơ hội ngắt dòng. Xem [Gợi ý cơ hội ngắt dòng](#suggesting_line_break_opportunities) bên dưới để biết chi tiết.
- `auto`
  - : Trình duyệt được tự do tự động ngắt từ tại các điểm gạch nối phù hợp, theo bất kỳ quy tắc nào nó chọn. Tuy nhiên, các cơ hội ngắt dòng được gợi ý (xem [Gợi ý cơ hội ngắt dòng](#suggesting_line_break_opportunities) bên dưới) sẽ ghi đè việc lựa chọn điểm ngắt tự động khi có mặt.

> [!NOTE]
> Hành vi của cài đặt `auto` phụ thuộc vào ngôn ngữ được gắn thẻ đúng cách để chọn các quy tắc gạch nối phù hợp. Bạn phải chỉ định ngôn ngữ bằng thuộc tính HTML `lang` để đảm bảo rằng gạch nối tự động được áp dụng cho ngôn ngữ đó.

> [!NOTE]
> Nếu bạn áp dụng [`word-break: break-all`](/en-US/docs/Web/CSS/Reference/Properties/word-break#break-all) thì sẽ không có gạch nối nào được hiển thị, ngay cả khi từ ngắt tại điểm gạch nối.

## Gợi ý cơ hội ngắt dòng

Có hai ký tự Unicode được dùng để chỉ định thủ công các điểm ngắt dòng tiềm năng trong văn bản:

- U+2010 (HYPHEN)
  - : Ký tự gạch nối "cứng" chỉ ra cơ hội ngắt dòng hiển thị. Ngay cả khi dòng không thực sự ngắt tại điểm đó, gạch nối vẫn được hiển thị.
- U+00AD (SHY)
  - : Một gạch nối "**mềm**" vô hình. Ký tự này không được hiển thị; thay vào đó, nó đánh dấu một chỗ mà trình duyệt nên ngắt từ nếu cần gạch nối. Trong HTML, dùng `&shy;` để chèn gạch nối mềm.

> [!NOTE]
> Khi phần tử HTML [`<wbr>`](/en-US/docs/Web/HTML/Reference/Elements/wbr) dẫn đến ngắt dòng, không có gạch nối nào được thêm vào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định gạch nối văn bản

Ví dụ này sử dụng ba lớp, một lớp cho mỗi cấu hình có thể của thuộc tính `hyphens`.

#### HTML

```html
<dl>
  <dt><code>none</code>: no hyphen; overflow if needed</dt>
  <dd lang="en" class="none">An extreme&shy;ly long English word</dd>
  <dt>
    <code>manual</code>: hyphen only at &amp;hyphen; or &amp;shy; (if needed)
  </dt>
  <dd lang="en" class="manual">An extreme&shy;ly long English word</dd>
  <dt><code>auto</code>: hyphens where the algorithm decides (if needed)</dt>
  <dd lang="en" class="auto">An extreme&shy;ly long English word</dd>
</dl>
```

#### CSS

```css
dd {
  width: 55px;
  border: 1px solid black;
}
dd.none {
  hyphens: none;
}
dd.manual {
  hyphens: manual;
}
dd.auto {
  hyphens: auto;
}
```

#### Kết quả

{{EmbedLiveSample("Specifying_text_hyphenation", "100%", 490)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("content")}}
- {{cssxref("overflow-wrap")}} (trước đây là `word-wrap`)
- {{cssxref("word-break")}}
- [Hướng dẫn ngắt và xuống dòng văn bản](/en-US/docs/Web/CSS/Guides/Text/Wrapping_breaking_text)
