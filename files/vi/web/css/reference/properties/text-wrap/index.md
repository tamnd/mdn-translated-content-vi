---
title: text-wrap
slug: Web/CSS/Reference/Properties/text-wrap
page-type: css-shorthand-property
browser-compat: css.properties.text-wrap
sidebar: cssref
---

Thuộc tính viết tắt **`text-wrap`** [CSS](/en-US/docs/Web/CSS) kiểm soát cách văn bản bên trong một phần tử được xuống dòng. Các giá trị khác nhau cung cấp:

- Cải thiện kiểu chữ, ví dụ như độ dài dòng cân bằng hơn trên các tiêu đề bị ngắt
- Một cách để tắt hoàn toàn việc xuống dòng văn bản.

{{InteractiveExample("CSS Demo: text-wrap")}}

```css interactive-example-choice
text-wrap: wrap;
```

```css interactive-example-choice
text-wrap: nowrap;
```

```css interactive-example-choice
text-wrap: balance;
```

```css interactive-example-choice
text-wrap: pretty;
```

```css interactive-example-choice
text-wrap: stable;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="whole-content-wrapper">
    <p>Edit the text in the box:</p>
    <div class="transition-all" id="example-element">
      <p contenteditable>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem aut
        cum eum id quos est.
      </p>
    </div>
  </div>
</section>
```

```css interactive-example
.whole-content-wrapper {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
}

#example-element {
  border: 1px solid #c5c5c5;
  width: 250px;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("text-wrap-mode")}}
- {{cssxref("text-wrap-style")}}

## Cú pháp

```css
/* Giá trị từ khóa */
text-wrap: wrap;
text-wrap: nowrap;
text-wrap: balance;
text-wrap: pretty;
text-wrap: stable;

/* Giá trị toàn cục */
text-wrap: inherit;
text-wrap: initial;
text-wrap: revert;
text-wrap: revert-layer;
text-wrap: unset;
```

Thuộc tính `text-wrap` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị bên dưới.

### Giá trị

- `wrap`
  - : Văn bản được xuống dòng tại các ký tự thích hợp (ví dụ khoảng cách, trong các ngôn ngữ như tiếng Anh sử dụng dấu phân cách bằng khoảng cách) để giảm thiểu tràn. Đây là giá trị mặc định.
- `nowrap`
  - : Văn bản không xuống dòng. Nó sẽ tràn ra ngoài phần tử chứa thay vì ngắt sang dòng mới.
- `balance`
  - : Văn bản được xuống dòng theo cách cân bằng tốt nhất số ký tự trên mỗi dòng, nâng cao chất lượng bố cục và khả năng đọc. Vì việc đếm ký tự và cân bằng chúng trên nhiều dòng tốn kém về mặt tính toán, giá trị này chỉ được hỗ trợ cho các khối văn bản kéo dài trong một số dòng giới hạn (sáu dòng trở xuống đối với Chromium và mười dòng trở xuống đối với Firefox).
- `pretty`
  - : Cho kết quả giống hành vi `wrap`, ngoại trừ user agent sẽ sử dụng thuật toán chậm hơn để ưu tiên bố cục đẹp hơn tốc độ. Điều này dành cho nội dung văn bản thân bài nơi kiểu chữ tốt được ưu tiên hơn hiệu suất (ví dụ khi số lượng [orphan](/en-US/docs/Web/CSS/Reference/Properties/orphans) nên được giữ ở mức tối thiểu).
- `stable`
  - : Cho kết quả giống hành vi `wrap`, ngoại trừ khi người dùng đang chỉnh sửa nội dung, các dòng xuất hiện trước các dòng họ đang chỉnh sửa vẫn tĩnh thay vì cả khối văn bản được xuống dòng lại.

## Mô tả

Có 2 cách văn bản có thể chảy qua các dòng trong một khối nội dung, chẳng hạn như đoạn văn ({{HTMLElement("p")}}) hoặc tiêu đề ({{HTMLElement("heading_elements","&lt;h1&gt;–&lt;h6&gt;")}}). Đó là _ngắt dòng buộc_, được người dùng kiểm soát, và _ngắt dòng mềm_, được trình duyệt kiểm soát. Thuộc tính `text-wrap` có thể được dùng để nhắc nhở trình duyệt cách kiểm soát các _ngắt dòng mềm_.

Giá trị bạn chọn cho `text-wrap` phụ thuộc vào số lượng dòng văn bản bạn dự kiến sẽ được định style, liệu văn bản có phải là `contenteditable` hay không, và liệu bạn cần ưu tiên giao diện hay hiệu suất.

Khi nội dung được định style sẽ bị giới hạn ở một số lượng dòng ngắn, chẳng hạn như tiêu đề, chú thích và trích dẫn khối, `text-wrap: balance` có thể được thêm vào để cân bằng số ký tự trên mỗi dòng, nâng cao chất lượng bố cục và khả năng đọc. Vì các trình duyệt giới hạn số dòng bị ảnh hưởng bởi thuộc tính này, tác động đến hiệu suất của giá trị này là không đáng kể.

Đối với các đoạn văn bản dài hơn, `text-wrap: pretty` có thể được dùng. Lưu ý rằng `pretty` có tác động tiêu cực đến hiệu suất, vì vậy nó chỉ nên được dùng cho các khối văn bản dài hơn khi bố cục quan trọng hơn tốc độ.

Giá trị `stable` cải thiện trải nghiệm người dùng khi được dùng trên nội dung [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable). Giá trị này đảm bảo rằng, khi người dùng đang chỉnh sửa văn bản, các dòng trước đó trong khu vực đang chỉnh sửa vẫn ổn định.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### So sánh giá trị text-wrap cơ bản

#### HTML

```html
<h2 class="wrap" contenteditable="true">
  The default behavior; the text in the heading wraps "normally"
</h2>

<h2 class="nowrap" contenteditable="true">
  In this case the text in the heading doesn't wrap, and overflows the container
</h2>

<h2 class="balance" contenteditable="true">
  In this case the text in the heading is nicely balanced across lines
</h2>
```

### CSS

```css
.wrap {
  text-wrap: wrap;
}

.nowrap {
  text-wrap: nowrap;
}

.balance {
  text-wrap: balance;
}

h2 {
  font-size: 2rem;
  font-family: sans-serif;
}
```

#### Kết quả

Văn bản trong ví dụ có thể chỉnh sửa được. Thay đổi văn bản, thêm các từ dài, để xem cách độ dài dòng và từ khác nhau ảnh hưởng đến việc xuống dòng.

{{EmbedLiveSample("Examples", "100%", 350)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("white-space")}}
- {{CSSxRef("white-space-collapse")}}
- [Module CSS text](/en-US/docs/Web/CSS/Guides/Text)
- [CSS `text-wrap: balance`](https://developer.chrome.com/docs/css-ui/css-text-wrap-balance) trên developer.chrome.com (2023)
- [CSS `text-wrap: pretty`](https://developer.chrome.com/blog/css-text-wrap-pretty/) trên developer.chrome.com (2023)
- [Balancing Japanese and Korean typography](https://ryelle.codes/2025/04/typography-troubles-balancing-in-japanese-korean/) bởi Kelly Choyce-Dwan (2025)
