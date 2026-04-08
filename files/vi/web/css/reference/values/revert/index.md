---
title: revert
slug: Web/CSS/Reference/Values/revert
page-type: css-keyword
browser-compat: css.types.global_keywords.revert
sidebar: cssref
---

Từ khóa **`revert`** [CSS](/vi/docs/Web/CSS) khôi phục giá trị cascade của thuộc tính từ giá trị hiện tại về giá trị mà thuộc tính đó sẽ có nếu không có thay đổi nào được thực hiện bởi **{{Glossary("style origin")}}** hiện tại cho phần tử hiện tại. Như vậy, nó đặt lại thuộc tính về giá trị do tác nhân người dùng thiết lập, giá trị do người dùng thiết lập, giá trị kế thừa của nó (nếu nó có thể kế thừa), hoặc giá trị khởi đầu. Nó có thể được áp dụng cho bất kỳ thuộc tính CSS nào, bao gồm thuộc tính viết tắt CSS {{cssxref("all")}}.

Từ khóa này loại bỏ khỏi cascade tất cả các kiểu đã bị ghi đè cho đến khi đạt đến kiểu đang được khôi phục về.

- Nếu được sử dụng bởi các kiểu của trang web (nguồn gốc tác giả), `revert` khôi phục giá trị cascade của thuộc tính về kiểu tùy chỉnh của người dùng, nếu có; nếu không, nó khôi phục kiểu về kiểu mặc định của tác nhân người dùng.
- Nếu được sử dụng trong stylesheet tùy chỉnh của người dùng, hoặc nếu kiểu được áp dụng bởi người dùng (nguồn gốc người dùng), `revert` khôi phục giá trị cascade về kiểu mặc định của tác nhân người dùng.
- Nếu được sử dụng trong các kiểu mặc định của tác nhân người dùng, từ khóa này tương đương về mặt chức năng với {{cssxref("unset")}}.

Từ khóa `revert` hoạt động giống hệt {{cssxref("unset")}} trong nhiều trường hợp. Sự khác biệt duy nhất là đối với các thuộc tính có giá trị được thiết lập bởi trình duyệt hoặc bởi các stylesheet tùy chỉnh do người dùng tạo ra (thiết lập ở phía trình duyệt).

Revert sẽ không ảnh hưởng đến các quy tắc áp dụng cho con cái của phần tử bạn đặt lại (nhưng sẽ loại bỏ các hiệu ứng của quy tắc cha lên con). Vì vậy nếu bạn có `color: green` cho tất cả các section và `all: revert` trên một section cụ thể, màu của section sẽ là đen. Nhưng nếu bạn có quy tắc làm tất cả đoạn văn đỏ, thì tất cả các đoạn văn vẫn sẽ đỏ trong tất cả các section.

> [!NOTE]
> Revert chỉ là một giá trị. Vẫn có thể ghi đè giá trị `revert` bằng [tính đặc hiệu](/vi/docs/Web/CSS/Guides/Cascade/Specificity).

> [!NOTE]
> Từ khóa `revert` khác với và không nên nhầm lẫn với từ khóa {{cssxref("initial")}}, sử dụng [giá trị khởi đầu](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) được định nghĩa trên cơ sở từng thuộc tính bởi các thông số kỹ thuật CSS. Ngược lại, các stylesheet tác nhân người dùng thiết lập giá trị mặc định dựa trên các bộ chọn CSS.
>
> Ví dụ, [giá trị khởi đầu](/vi/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) cho thuộc tính [`display`](/vi/docs/Web/CSS/Reference/Properties/display#formal_definition) là `inline`, trong khi stylesheet tác nhân người dùng thông thường thiết lập giá trị {{cssxref("display")}} mặc định của các {{HTMLElement("div")}} là `block`, của các {{HTMLElement("table")}} là `table`, v.v.

## Ví dụ

### Revert so với unset

Mặc dù `revert` và `unset` tương tự nhau, chúng khác nhau đối với một số thuộc tính cho một số phần tử.

Vì vậy trong ví dụ dưới đây, chúng ta thiết lập [`font-weight`](/vi/docs/Web/CSS/Reference/Properties/font-weight#formal_definition) tùy chỉnh, rồi thử `revert` và `unset` nó trực tiếp trong tài liệu HTML. Từ khóa `revert` sẽ khôi phục văn bản về in đậm vì đó là giá trị mặc định cho tiêu đề trong hầu hết các trình duyệt. Từ khóa `unset` sẽ giữ văn bản bình thường vì, như là thuộc tính kế thừa, `font-weight` sẽ kế thừa giá trị từ body.

#### HTML

```html
<h3 style="font-weight: revert; color: revert;">
  This should have its original font-weight (bold) and color: black
</h3>
<p>Just some text</p>
<h3 style="font-weight: unset; color: unset;">
  This will still have font-weight: normal, but color: black
</h3>
<p>Just some text</p>
```

#### CSS

```css
h3 {
  font-weight: normal;
  color: blue;
}
```

#### Kết quả

{{EmbedLiveSample('Revert_vs_unset', 0, 200)}}

### Revert tất cả

Khôi phục tất cả các giá trị hữu ích trong tình huống bạn đã thực hiện nhiều thay đổi kiểu và muốn khôi phục về giá trị mặc định của trình duyệt. Vì vậy trong ví dụ trên, thay vì khôi phục `font-weight` và `color` riêng lẻ, bạn có thể khôi phục tất cả chúng cùng một lúc - bằng cách áp dụng từ khóa `revert` trên `all`.

#### HTML

```html
<h3>This will have custom styles</h3>
<p>Just some text</p>
<h3 style="all: revert">This should be reverted to browser/user defaults.</h3>
<p>Just some text</p>
```

#### CSS

```css
h3 {
  font-weight: normal;
  color: blue;
  border-bottom: 1px solid grey;
}
```

#### Kết quả

{{EmbedLiveSample('Revert_all', 0, 200)}}

### Revert trên phần tử cha

Khôi phục thực sự loại bỏ giá trị cho phần tử bạn chọn với một số quy tắc và điều này chỉ xảy ra cho phần tử đó. Để minh họa điều này, chúng ta sẽ đặt màu xanh lá cây trên section và màu đỏ trên đoạn văn.

#### HTML

```html
<main>
  <section>
    <h3>This h3 will be dark green</h3>
    <p>Text in paragraph will be red.</p>
    This stray text will also be dark green.
  </section>
  <section class="with-revert">
    <h3>This h3 will be steelblue</h3>
    <p>Text in paragraph will be red.</p>
    This stray text will also be steelblue.
  </section>
</main>
```

#### CSS

```css hidden
main {
  border: 3px solid steelblue;
}

section {
  margin: 0.5rem;
  border: 2px dashed darkgreen;
}
```

```css
main {
  color: steelblue;
}
section {
  color: darkgreen;
}
p {
  color: red;
}
section.with-revert {
  color: revert;
}
```

#### Kết quả

{{EmbedLiveSample('Revert_on_a_parent', '100%', '300px')}}

Lưu ý rằng đoạn văn vẫn màu đỏ mặc dù thuộc tính `color` cho section đã bị khôi phục. Ngoài ra, cả tiêu đề và nút văn bản đều là màu `steelblue`. Kết quả của việc khôi phục làm cho nó như thể `section { color: darkgreen; }` không tồn tại cho section có `color: revert` được áp dụng.

Ngoài ra, nếu cả tác nhân người dùng lẫn người dùng không ghi đè giá trị màu `<h3>` hoặc `<section>`, thì màu `steelblue` được kế thừa từ `<main>`, vì thuộc tính {{cssxref("color")}} là thuộc tính kế thừa.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sử dụng từ khóa {{cssxref("initial")}} để đặt thuộc tính về giá trị khởi đầu.
- Sử dụng từ khóa {{cssxref("inherit")}} để làm cho thuộc tính của phần tử giống với cha của nó.
- Sử dụng từ khóa {{cssxref("revert-layer")}} để đặt lại thuộc tính về giá trị được thiết lập trong lớp cascade trước đó.
- Sử dụng từ khóa {{cssxref("unset")}} để đặt thuộc tính về giá trị kế thừa nếu nó kế thừa hoặc giá trị khởi đầu nếu không.
- Thuộc tính {{cssxref("all")}} cho phép bạn đặt lại tất cả các thuộc tính về trạng thái khởi đầu, kế thừa, revert hoặc unset cùng một lúc.
