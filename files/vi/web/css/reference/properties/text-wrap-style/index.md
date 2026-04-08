---
title: text-wrap-style
slug: Web/CSS/Reference/Properties/text-wrap-style
page-type: css-property
browser-compat: css.properties.text-wrap-style
sidebar: cssref
---

Thuộc tính **`text-wrap-style`** [CSS](/en-US/docs/Web/CSS) kiểm soát cách văn bản bên trong một phần tử được xuống dòng. Các giá trị khác nhau cung cấp các cách thay thế để xuống dòng nội dung của một phần tử khối. Nó cũng có thể được đặt và đặt lại bằng viết tắt {{CSSXRef("text-wrap")}}.

{{InteractiveExample("CSS Demo: text-wrap-style")}}

```css interactive-example-choice
text-wrap-style: auto;
```

```css interactive-example-choice
text-wrap-style: balance;
```

```css interactive-example-choice
text-wrap-style: pretty;
```

```css interactive-example-choice
text-wrap-style: stable;
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

## Cú pháp

```css
/* Giá trị từ khóa */
text-wrap-style: auto;
text-wrap-style: balance;
text-wrap-style: pretty;
text-wrap-style: stable;

/* Giá trị toàn cục */
text-wrap-style: inherit;
text-wrap-style: initial;
text-wrap-style: revert;
text-wrap-style: revert-layer;
text-wrap-style: unset;
```

Khi cho phép xuống dòng (xem {{CSSXRef("text-wrap-mode")}}), thuộc tính `text-wrap-style` được chỉ định là một từ khóa đơn được chọn từ danh sách các giá trị bên dưới.

### Giá trị

- `auto`
  - : Văn bản được xuống dòng theo cách hiệu quả nhất cho trình duyệt và không tính đến số ký tự.
- `balance`
  - : Văn bản được xuống dòng theo cách cân bằng tốt nhất số ký tự trên mỗi dòng, nâng cao chất lượng bố cục và khả năng đọc. Vì việc đếm ký tự và cân bằng chúng trên nhiều dòng tốn kém về mặt tính toán, giá trị này chỉ được hỗ trợ cho các khối văn bản kéo dài trong một số dòng giới hạn (sáu dòng trở xuống đối với Chromium và mười dòng trở xuống đối với Firefox).
- `pretty`
  - : Văn bản được xuống dòng bằng thuật toán chậm hơn để ưu tiên bố cục đẹp hơn tốc độ. Điều này dành cho nội dung văn bản thân bài nơi kiểu chữ tốt được ưu tiên hơn hiệu suất (ví dụ khi số lượng [orphan](/en-US/docs/Web/CSS/Reference/Properties/orphans) nên được giữ ở mức tối thiểu).
- `stable`
  - : Văn bản được xuống dòng sao cho khi người dùng đang chỉnh sửa nội dung, các dòng xuất hiện trước các dòng họ đang chỉnh sửa vẫn tĩnh thay vì cả khối văn bản được xuống dòng lại.

> [!NOTE]
> Module [CSS text](/en-US/docs/Web/CSS/Guides/Text) định nghĩa giá trị `avoid-orphans` cho thuộc tính `text-wrap-style` để tránh các dòng cuối quá ngắn và mong đợi user agent xem xét nhiều hơn một dòng khi đưa ra quyết định ngắt. Giá trị này chưa được hỗ trợ trong bất kỳ trình duyệt nào.

## Mô tả

Khi nội dung được phép xuống dòng, điều mặc định, thì có một số lựa chọn có thể ảnh hưởng đến cách nội dung được xuống dòng.

Giá trị bạn chọn cho `text-wrap-style` phụ thuộc vào số lượng dòng văn bản bạn dự kiến sẽ được định style, liệu văn bản có phải là `contenteditable` hay không, và liệu bạn cần ưu tiên giao diện hay hiệu suất.

Khi nội dung được định style sẽ bị giới hạn ở một số lượng dòng ngắn, chẳng hạn như tiêu đề, chú thích và trích dẫn khối, `text-wrap-style: balance` có thể được thêm vào để cân bằng số ký tự trên mỗi dòng, nâng cao chất lượng bố cục và khả năng đọc. Vì các trình duyệt giới hạn số dòng bị ảnh hưởng bởi thuộc tính này, tác động đến hiệu suất của giá trị này là không đáng kể.

Đối với các đoạn văn bản dài hơn, `text-wrap-style: pretty` có thể được dùng. Lưu ý rằng `pretty` có tác động tiêu cực đến hiệu suất, vì vậy nó chỉ nên được dùng cho các khối văn bản dài hơn khi bố cục quan trọng hơn tốc độ.

Giá trị `stable` cải thiện trải nghiệm người dùng khi được dùng trên nội dung [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable). Giá trị này đảm bảo rằng, khi người dùng đang chỉnh sửa văn bản, các dòng trước đó trong khu vực đang chỉnh sửa vẫn ổn định.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Văn bản cân bằng

Ví dụ này có hai đoạn văn, đoạn đầu tiên là mặc định `auto` và đoạn thứ hai là `balance`.

#### HTML

```html
<h2>Unbalanced</h2>
<p>
  Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit, ad. Impedit
  adipisci rerum modi praesentium atque aperiam vitae nesciunt consectetur
  assumenda deleniti repudiandae perferendis sed odio doloremque, aliquid natus
  laboriosam?
</p>
<h2>Balanced</h2>
<p class="balanced">
  Lorem ipsum dolor sit amet consectetur adipisicing elit. Velit, ad. Impedit
  adipisci rerum modi praesentium atque aperiam vitae nesciunt consectetur
  assumenda deleniti repudiandae perferendis sed odio doloremque, aliquid natus
  laboriosam?
</p>
```

#### CSS

```css
p {
  max-width: 60ch;
}
.balanced {
  text-wrap-style: balance;
}
```

#### Kết quả

{{EmbedLiveSample("balanced_text", "100%",310)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("text-wrap")}}
- {{CSSxRef("text-wrap-mode")}}
