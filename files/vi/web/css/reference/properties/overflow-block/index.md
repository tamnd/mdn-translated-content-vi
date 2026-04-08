---
title: overflow-block
slug: Web/CSS/Reference/Properties/overflow-block
page-type: css-property
browser-compat: css.properties.overflow-block
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overflow-block`** xác định nội dung được hiển thị như thế nào khi tràn ra ngoài các cạnh đầu và cuối khối của hộp. Có thể là không hiển thị gì, thanh cuộn, hoặc nội dung tràn ra ngoài.

> [!NOTE]
> Thuộc tính `overflow-block` ánh xạ đến {{Cssxref("overflow-y")}} hoặc {{Cssxref("overflow-x")}} tùy thuộc vào chế độ viết của tài liệu.

## Cú pháp

```css
/* Giá trị từ khóa */
overflow-block: visible;
overflow-block: hidden;
overflow-block: clip;
overflow-block: scroll;
overflow-block: auto;

/* Giá trị toàn cục */
overflow-block: inherit;
overflow-block: initial;
overflow-block: revert;
overflow-block: revert-layer;
overflow-block: unset;
```

Thuộc tính `overflow-block` được chỉ định là một giá trị từ khóa {{CSSXref("overflow_value", "&lt;overflow&gt;")}} duy nhất:

### Giá trị

- `visible`
  - : Nội dung không bị cắt và có thể hiển thị bên ngoài các cạnh đầu và cuối khối của hộp đệm.
- `hidden`
  - : Nội dung được cắt nếu cần để vừa với kích thước khối trong hộp đệm. Không có thanh cuộn nào được cung cấp.
- `clip`
  - : Nội dung tràn ra ngoài bị cắt tại cạnh clip tràn của phần tử được xác định bằng thuộc tính {{CSSXref("overflow-clip-margin")}}.
- `scroll`
  - : Nội dung được cắt nếu cần để vừa với kích thước khối trong hộp đệm. Trình duyệt hiển thị thanh cuộn dù nội dung có thực sự bị cắt hay không. (Điều này ngăn thanh cuộn xuất hiện hoặc biến mất khi nội dung thay đổi.) Máy in vẫn có thể in nội dung tràn ra ngoài.
- `auto`
  - : Phụ thuộc vào tác nhân người dùng. Nếu nội dung vừa trong hộp đệm, nó trông giống như `visible`, nhưng vẫn tạo ra ngữ cảnh định dạng khối mới.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<ul>
  <li>
    <code>overflow-block: hidden</code> (hides the text outside the box)
    <div id="hidden">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-block: scroll</code> (always adds a scrollbar)
    <div id="scroll">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-block: clip</code> (hides the text outside the box beyond the
    overflow clip edge)
    <div id="clip">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-block: visible</code> (displays the text outside the box if
    needed)
    <div id="visible">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>

  <li>
    <code>overflow-block: auto</code> (on most browsers, equivalent to
    <code>scroll</code>)
    <div id="auto">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
      tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
      commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
      velit esse cillum dolore eu fugiat nulla pariatur.
    </div>
  </li>
</ul>
```

### CSS

```css
div {
  border: 1px solid black;
  width: 250px;
  height: 100px;
  margin-bottom: 120px;
}

#hidden {
  overflow-block: hidden;
}
#scroll {
  overflow-block: scroll;
}
#clip {
  overflow-block: clip;
}
#visible {
  overflow-block: visible;
}
#auto {
  overflow-block: auto;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", "780")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-overflow")}}, {{cssxref("white-space")}}, {{Cssxref("overflow")}}, {{Cssxref("overflow-inline")}}, {{Cssxref("overflow-x")}}, {{Cssxref("overflow-y")}}, {{Cssxref("clip")}}, {{Cssxref("display")}}
- [Thuộc tính logic CSS](/vi/docs/Web/CSS/Guides/Logical_properties_and_values)
- Mô-đun [CSS overflow](/vi/docs/Web/CSS/Guides/Overflow)
- Mô-đun [CSS scrollbars style](/vi/docs/Web/CSS/Guides/Scrollbars_styling)
- [Chế độ viết CSS](/vi/docs/Web/CSS/Guides/Writing_modes)
- [Học: Nội dung tràn ra ngoài](/vi/docs/Learn_web_development/Core/Styling_basics/Overflow)
