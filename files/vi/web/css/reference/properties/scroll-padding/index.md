---
title: scroll-padding
slug: Web/CSS/Reference/Properties/scroll-padding
page-type: css-shorthand-property
browser-compat: css.properties.scroll-padding
sidebar: cssref
---

Thuộc tính viết tắt **`scroll-padding`** đặt khoảng đệm cuộn cho tất cả các cạnh của một phần tử cùng một lúc. Nó chỉ định các độ lệch xác định vùng hiển thị tối ưu của scrollport trong một {{glossary("scroll container")}}.

{{InteractiveExample("CSS Demo: scroll-padding")}}

```css interactive-example-choice
scroll-padding: 0;
```

```css interactive-example-choice
scroll-padding: 20px;
```

```css interactive-example-choice
scroll-padding: 20%;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="scroller" id="example-element">
    <div>1</div>
    <div>2</div>
    <div>3</div>
  </div>
  <div class="info">Scroll »</div>
</section>
```

```css interactive-example
.default-example .info {
  inline-size: 100%;
  padding: 0.5em 0;
  font-size: 90%;
  writing-mode: vertical-rl;
}

.scroller {
  text-align: left;
  height: 250px;
  width: 270px;
  overflow-y: scroll;
  display: flex;
  flex-direction: column;
  box-sizing: border-box;
  border: 1px solid black;
  scroll-snap-type: y mandatory;
}

.scroller > div {
  flex: 0 0 250px;
  background-color: rebeccapurple;
  color: white;
  font-size: 30px;
  display: flex;
  align-items: center;
  justify-content: center;
  scroll-snap-align: start;
}

.scroller > div:nth-child(even) {
  background-color: white;
  color: rebeccapurple;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{CSSXref("scroll-padding-bottom")}}
- {{CSSXref("scroll-padding-left")}}
- {{CSSXref("scroll-padding-right")}}
- {{CSSXref("scroll-padding-top")}}

## Cú pháp

```css
/* Giá trị từ khóa */
scroll-padding: auto;

/* Giá trị <length> */
scroll-padding: 10px;
scroll-padding: 1em 0.5em 1em 1em;
scroll-padding: 10%;

/* Giá trị toàn cục */
scroll-padding: inherit;
scroll-padding: initial;
scroll-padding: revert;
scroll-padding: revert-layer;
scroll-padding: unset;
```

### Giá trị

- {{cssxref("&lt;length-percentage&gt;")}}
  - : Độ lệch hướng vào trong từ cạnh tương ứng của scrollport, dưới dạng {{cssxref("&lt;length&gt;")}} hợp lệ hoặc {{cssxref("&lt;percentage&gt;")}}.
- `auto`
  - : Độ lệch được xác định bởi user agent. Giá trị này thường là `0px`, nhưng user agent có thể phát hiện và làm gì đó khác nếu giá trị khác không phù hợp hơn.

## Mô tả

Thuộc tính `scroll-padding` là viết tắt đặt {{CSSXref("scroll-padding-top")}}, {{CSSXref("scroll-padding-right")}}, {{CSSXref("scroll-padding-bottom")}}, và {{CSSXref("scroll-padding-left")}}, theo thứ tự đó, lần lượt đặt khoảng đệm cuộn trên, phải, dưới và trái của một scroll container.

Hữu ích khi tạo các scroll-snap container, thuộc tính `scroll-padding` cho phép xác định các độ lệch cho _vùng hiển thị tối ưu_ của scrollport: vùng được sử dụng làm vùng mục tiêu để đưa các phần tử vào tầm nhìn của người dùng. Điều này cho phép bạn tạo các khoảng đệm trong scrollport để dành chỗ cho các đối tượng có thể che khuất nội dung, chẳng hạn như thanh công cụ hoặc thanh bên cố định, hoặc để tạo thêm khoảng trống giữa phần tử mục tiêu và các cạnh của scrollport.

Mặc dù được định nghĩa trong module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap), thuộc tính này áp dụng cho tất cả các scroll container, bất kể giá trị của thuộc tính {{cssxref("scroll-snap-type")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-snap-type")}}
- [Khái niệm cơ bản về scroll-snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Basic_concepts)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
