---
title: baseline-source
slug: Web/CSS/Reference/Properties/baseline-source
page-type: css-property
browser-compat: css.properties.baseline-source
sidebar: cssref
---

Thuộc tính **`baseline-source`** [CSS](/en-US/docs/Web/CSS) xác định [đường cơ sở](/en-US/docs/Web/CSS/Reference/Values/baseline-position) nào được sử dụng khi các hộp cấp inline có nhiều đường cơ sở khả dụng, chẳng hạn như [inline block](/en-US/docs/Web/CSS/Guides/Display/Block_and_inline_layout) nhiều dòng hoặc [flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts#the_flex_container) inline.
Các giá trị cho phép chọn giữa căn chỉnh theo đường cơ sở đầu tiên, đường cơ sở cuối cùng, hoặc để trình duyệt tự quyết định dựa vào kiểu hộp.

## Cú pháp

```css
/* Giá trị từ khóa */
baseline-source: auto;
baseline-source: first;
baseline-source: last;

/* Giá trị toàn cục */
baseline-source: inherit;
baseline-source: initial;
baseline-source: revert;
baseline-source: revert-layer;
baseline-source: unset;
```

### Giá trị

- `auto`
  - : Chỉ định căn chỉnh [`last baseline`](/en-US/docs/Web/CSS/Reference/Values/baseline-position#last_baseline) cho inline-block, căn chỉnh [`first baseline`](/en-US/docs/Web/CSS/Reference/Values/baseline-position#first_baseline) cho mọi thứ khác.
- `first`
  - : Chỉ định căn chỉnh `first baseline`.
- `last`
  - : Chỉ định căn chỉnh `last baseline`.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Lựa chọn đường cơ sở trong inline flex containers

Ví dụ này minh họa cách dùng thuộc tính `baseline-source` để kiểm soát căn chỉnh đường cơ sở của inline flex containers.

#### HTML

HTML của chúng ta bao gồm nhiều phần tử {{htmlelement("span")}}, là các vùng chứa inline chung cho nội dung phụ.
Ba phần tử `<span>` chứa các phần tử `<span>` con lồng nhau.

```html
<span>Baseline ___</span>

<span class="box first">
  <span>First</span>
  <span>A</span>
  <span>B</span>
  <span>C</span>
</span>

<span class="box auto">
  <span>Auto</span>
  <span>A</span>
  <span>B</span>
  <span>C</span>
</span>

<span class="box last">
  <span>A</span>
  <span>B</span>
  <span>C</span>
  <span>Last</span>
</span>
```

#### CSS

```css hidden
body {
  font-family: sans-serif;
}

.box {
  border: 2px solid #888888;
  width: 50px;
}

span {
  padding: 0.4rem;
}
```

Chúng ta định nghĩa tất cả các hộp là inline flex containers.
Hộp `.first` sử dụng đường cơ sở đầu tiên, hộp `.auto` sử dụng đường cơ sở mặc định (là `first` cho inline flex containers), và hộp `.last` sử dụng đường cơ sở cuối cùng.

```css
.box {
  display: inline-flex;
  flex-direction: column;
}

.first {
  baseline-source: first;
}

.auto {
  baseline-source: auto;
}

.last {
  baseline-source: last;
}
```

#### Kết quả

{{EmbedLiveSample('baseline_selection_in_inline_flex_containers', '100%', 260)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("vertical-align")}}
- [Tổng quan căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment/Overview)
