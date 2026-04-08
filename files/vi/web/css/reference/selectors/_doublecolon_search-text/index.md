---
title: ::search-text
slug: Web/CSS/Reference/Selectors/::search-text
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.search-text
sidebar: cssref
---

{{SeeCompatTable}}

Phần tử giả **`::search-text`** trong [CSS](/en-US/docs/Web/CSS) áp dụng kiểu cho các kết quả tìm kiếm được xác định bởi tính năng tìm kiếm văn bản "Find" hoặc "Find in page" của tác nhân người dùng.

{{InteractiveExample("CSS Demo: ::search-text", "tabbed-shorter")}}

```css interactive-example
p::search-text {
  color: crimson;
  background-color: wheat;
}
```

```html interactive-example
<p>
  Using your browser's "Find in page" functionality, find a word or phrase that
  appears in this sentence, and note how, in supporting browsers, each result is
  highlighted using the specified custom styles.
</p>
```

## Cú pháp

```css
::search-text {
  /* ... */
}
```

## Mô tả

Hầu hết các trình duyệt đều có một loại chức năng tìm kiếm văn bản trong trang, thường được gọi là "Find" hoặc "Find in page". Phần tử giả `::search-text`, một trong các [phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements), cho phép bạn áp dụng [một tập hợp kiểu giới hạn](#allowable_properties) cho các kết quả văn bản được trình duyệt tô sáng bằng chức năng tìm kiếm.

Không phải tất cả các trình duyệt và phiên bản trình duyệt đều tô sáng kết quả tìm kiếm bằng các highlight trong trang có thể tạo kiểu bằng CSS. Trong những trường hợp như vậy, `::search-text` có thể chưa được triển khai hoặc chỉ bị bỏ qua.

Sử dụng `::search-text` làm bộ chọn đơn lẻ sẽ tạo kiểu cho các kết quả tìm kiếm của trình duyệt xuất hiện _ở bất kỳ đâu_ trên trang. Nếu bạn chỉ muốn tạo kiểu cho kết quả tìm kiếm của trình duyệt xuất hiện bên trong một số phần tử nhất định, bạn có thể kết hợp `::search-text` với các bộ chọn khác, ví dụ: `section::search-text`.

Ngoài ra, `::search-text` có thể được kết hợp với [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) {{cssxref(":current")}} để cung cấp kiểu cụ thể cho kết quả tìm kiếm đang được tập trung, ví dụ:

```css
p::search-text {
  color: white;
  background-color: purple;
}

p::search-text:current {
  background-color: crimson;
}
```

### Mô hình kế thừa

Phần tử giả `::search-text` tuân theo mô hình kế thừa đặc biệt chung cho tất cả các phần tử giả highlight, trong đó kiểu được kế thừa từ cả phần tử cha của chúng và các phần tử giả của cha chúng. Để biết thêm chi tiết về cách kế thừa này hoạt động, xem phần [Kế thừa của các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements_inheritance).

### Các thuộc tính được phép sử dụng

Một tập hợp con giới hạn các thuộc tính CSS có thể được dùng với `::search-text`:

- {{CSSxRef("color")}}
- {{CSSxRef("background-color")}}
- Viết tắt {{CSSxRef("text-decoration")}} và các thuộc tính dài hạn liên quan:
  - {{CSSxRef("text-decoration-line")}}: chỉ các giá trị `grammar-error`, `spelling-error`, `line-through`, `none` và `underline`.
  - {{CSSxRef("text-decoration-color")}}
  - {{CSSxRef("text-decoration-style")}}
  - {{CSSxRef("text-decoration-thickness")}}
  - {{CSSxRef("text-decoration-skip-ink")}}
- {{CSSxRef("text-underline-offset")}}
- {{CSSxRef("text-shadow")}}

## Khả năng tiếp cận

**Hãy hạn chế ghi đè kiểu kết quả tìm kiếm văn bản**, đặc biệt khi làm vậy chỉ vì lý do thẩm mỹ. Đối với những người có vấn đề về nhận thức hoặc ít thành thạo về công nghệ, những thay đổi bất ngờ đối với các kiểu này có thể ảnh hưởng đến khả năng hiểu chức năng của họ.

Trường hợp sử dụng chính của `::search-text` là tăng độ tương phản màu so với kiểu mặc định của trình duyệt. Khi tùy chỉnh văn bản được tô sáng, điều quan trọng là đảm bảo rằng [tỷ lệ tương phản giữa màu nền trước và nền sau](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background) đủ lớn để người dùng khiếm thị có thể đọc được nội dung của văn bản được tô sáng.

## Ví dụ

### Kiểu tùy chỉnh cho kết quả tìm kiếm văn bản

Ví dụ này cho thấy cách sử dụng `::search-text` và `:current` để tạo kiểu tùy chỉnh cho kết quả tìm kiếm "Find in page" của trình duyệt.

#### HTML

HTML gồm một đoạn văn bản cơ bản. Chúng ta sẽ không hiển thị nguồn HTML, vừa để ngắn gọn, vừa để dễ dàng điều hướng kết quả tìm kiếm trong ví dụ được hiển thị.

```html hidden live-sample___custom-search-results
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec finibus est
  eget eros congue pellentesque. Etiam a augue accumsan, scelerisque nisl sit
  amet, lobortis nulla. Aliquam condimentum eu orci eu elementum. Donec
  porttitor quam et posuere commodo. Mauris rhoncus diam a scelerisque molestie.
  Integer sollicitudin risus dui, ut sagittis lorem laoreet eget. Duis eget
  pretium enim. Morbi tristique, diam sit amet gravida finibus, metus ex
  tincidunt nibh, ac volutpat urna purus et arcu. Donec risus risus, semper vel
  purus sit amet, gravida vestibulum est. Sed et tristique urna. Nam vel mi eget
  nisi consectetur elementum. Aenean faucibus aliquam cursus. Morbi posuere
  tincidunt velit, et sagittis quam sagittis in. Nam eget ante ultrices, auctor
  dui vel, euismod lacus. Vivamus tincidunt, sem ac sodales aliquet, tortor
  tortor consequat diam, nec tempor mi dui vel eros. Aliquam ac erat et metus
  egestas scelerisque.
</p>
```

#### CSS

Trong CSS, chúng ta bắt đầu bằng cách tạo kiểu cho phần tử giả `::search-text`. Chúng ta đặt kiểu tùy chỉnh cho {{cssxref("background-color")}}, {{cssxref("color")}} và {{cssxref("text-shadow")}}.

```css hidden live-sample___custom-search-results
html {
  font-family: "Helvetica", "Arial";
}

p {
  font-size: 1.5rem;
  line-height: 1.5;
  width: 90%;
  margin: 0 auto;
}
@layer no-support {
  body::before {
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1em 0;
  }
  @supports not selector(:current) {
    body::before {
      content: "Your browser doesn't support the :current pseudo-class.";
    }
  }
  @supports not selector(::search-text) {
    body::before {
      content: "Your browser doesn't support the ::search-text pseudo-element.";
    }
  }
}
```

```css live-sample___custom-search-results
::search-text {
  background-color: purple;
  color: white;
  text-shadow: 1px 1px 1px black;
}
```

Cuối cùng, chúng ta tạo kiểu cho kết quả tìm kiếm đang được tập trung qua `::search-text:current`, cung cấp cho nó một `background-color` khác và một số kiểu {{cssxref("text-decoration")}} để phân biệt với các kết quả còn lại.

```css live-sample___custom-search-results
::search-text:current {
  background-color: crimson;
  text-decoration-line: underline;
  text-decoration-color: yellow;
  text-decoration-thickness: 3px;
}
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{EmbedLiveSample("live-sample___custom-search-results", "100%", 300)}}

Hãy thử dùng giao diện tìm kiếm trong trang của trình duyệt để tìm một từ xuất hiện nhiều lần trong văn bản ví dụ, chẳng hạn như "aliquam", "amet" hoặc "tortor". Di chuyển giữa các kết quả trước và tiếp theo để xem kiểu `:current`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":current")}}
- [Các phần tử giả highlight](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements#highlight_pseudo-elements)
- Module [các phần tử giả CSS](/en-US/docs/Web/CSS/Guides/Pseudo-elements)
