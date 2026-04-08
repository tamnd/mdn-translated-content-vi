---
title: text-wrap-mode
slug: Web/CSS/Reference/Properties/text-wrap-mode
page-type: css-property
browser-compat: css.properties.text-wrap-mode
sidebar: cssref
---

Thuộc tính **`text-wrap-mode`** [CSS](/en-US/docs/Web/CSS) kiểm soát liệu văn bản bên trong một phần tử có được xuống dòng hay không. Các giá trị khác nhau cung cấp các cách thay thế để xuống dòng nội dung của một phần tử khối. Nó cũng có thể được đặt và đặt lại bằng viết tắt {{CSSXRef("text-wrap")}} hoặc viết tắt {{CSSXRef("white-space")}}.

> [!NOTE]
> Các thuộc tính {{CSSxRef("white-space-collapse")}} và `text-wrap-mode` có thể được khai báo cùng nhau bằng thuộc tính viết tắt {{CSSxRef("white-space")}}.

> [!NOTE]
> Tên của thuộc tính này là tạm thời, chờ CSSWG tìm được tên tốt hơn.

{{InteractiveExample("CSS Demo: text-wrap-mode")}}

```css interactive-example-choice
text-wrap-mode: wrap;
```

```css interactive-example-choice
text-wrap-mode: nowrap;
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
text-wrap-mode: wrap;
text-wrap-mode: nowrap;

/* Giá trị toàn cục */
text-wrap-mode: inherit;
text-wrap-mode: initial;
text-wrap-mode: revert;
text-wrap-mode: revert-layer;
text-wrap-mode: unset;
```

## Giá trị

Thuộc tính này xác định liệu các dòng có thể xuống dòng tại các cơ hội xuống dòng mềm không bắt buộc hay không. Các giá trị có thể:

- `wrap`
  - : Văn bản được xuống dòng tại các ký tự thích hợp (ví dụ khoảng cách, trong các ngôn ngữ như tiếng Anh sử dụng dấu phân cách bằng khoảng cách) để giảm thiểu tràn. Đây là giá trị mặc định.
- `nowrap`
  - : Văn bản không xuống dòng. Nó sẽ tràn ra ngoài phần tử chứa thay vì ngắt sang dòng mới.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Xuống dòng nội dung

Cài đặt mặc định là xuống dòng nội dung nên thuộc tính `text-wrap-mode` không cần thiết. Trong ví dụ này, nội dung sẽ chảy sang dòng tiếp theo để vừa với hộp, dòng cuối cùng dài hơn hộp chứa nên bị tràn.

#### HTML

```html
<div class="box">CSS IS AWESOME</div>
```

#### CSS

```css
.box {
  font-family: "Arial", sans-serif;
  font-weight: bold;
  font-size: 64px;
  box-sizing: border-box;
  border: 4px solid black;
  padding: 0px 3px;
  width: 223px;
  text-wrap-mode: wrap;
}
```

#### Kết quả

{{EmbedLiveSample("wrapping_content", "100%", 250)}}

### Không xuống dòng nội dung

Trong ví dụ này, nội dung sẽ **không** chảy sang dòng tiếp theo để vừa với hộp vì nội dung đã được yêu cầu không xuống dòng với `text-wrap-mode: nowrap;`, nội dung dài hơn hộp chứa nên bị tràn.

#### HTML

```html
<div class="box">CSS IS AWESOME</div>
```

#### CSS

```css
.box {
  font-family: "Arial", sans-serif;
  font-weight: bold;
  font-size: 64px;
  box-sizing: border-box;
  border: 4px solid black;
  padding: 0px 3px;
  width: 223px;
  text-wrap-mode: nowrap;
}
```

#### Kết quả

{{EmbedLiveSample("not_wrapping_content", "100%",100)}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("text-wrap")}}
- {{CSSxRef("text-wrap-style")}}
