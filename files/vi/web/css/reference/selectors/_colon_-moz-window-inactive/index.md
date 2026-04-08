---
title: :-moz-window-inactive
slug: Web/CSS/Reference/Selectors/:-moz-window-inactive
page-type: css-pseudo-class
status:
  - non-standard
browser-compat: css.selectors.-moz-window-inactive
sidebar: cssref
---

{{Non-standard_header}}

**`:-moz-window-inactive`** là [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/vi/docs/Web/CSS) là một [phần mở rộng Mozilla](/vi/docs/Web/CSS/Reference/Mozilla_extensions) khớp với bất kỳ phần tử nào khi nó nằm trong một cửa sổ không hoạt động.

`:-moz-window-inactive` cũng hoạt động trong các tài liệu HTML nội dung.

> [!NOTE]
> Trước khi lớp giả này được thêm vào, việc cung cấp kiểu khác nhau cho các cửa sổ nền được thực hiện bằng cách đặt một thuộc tính (`active="true"`) trên cửa sổ chrome XUL cấp cao nhất. Thuộc tính này không còn được sử dụng nữa.

## Cú pháp

```css
:-moz-window-inactive {
  /* ... */
}
```

## Ví dụ

Ví dụ này thay đổi giao diện nền của một hộp tùy thuộc vào việc cửa sổ của nó có đang hoạt động hay không.

### HTML

```html
<div id="my-box">
  <p>This is a box!</p>
</div>
```

### CSS

```css
#my-box {
  background: linear-gradient(to bottom, yellow, cyan);
  width: 200px;
  height: 200px;
}

#my-box:-moz-window-inactive {
  background: cyan;
}
```

### Kết quả

Kết quả của đoạn mã này được hiển thị bên dưới. Bạn cũng có thể xem nó như một {{LiveSampleLink('Examples', 'trang riêng biệt')}}.

{{EmbedLiveSample('Examples', 220, 220)}}

## Thông số kỹ thuật

Không thuộc bất kỳ tiêu chuẩn nào.

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các phần mở rộng Mozilla CSS](/vi/docs/Web/CSS/Reference/Mozilla_extensions)
- Các bộ chọn CSS liên quan:
  - {{cssxref(":active")}}

- Thuộc tính {{domxref("Document.activeElement")}} cho DOM thông thường, và thuộc tính {{domxref("ShadowRoot.activeElement")}} cho các gốc [shadow DOM](/vi/docs/Web/API/Web_components/Using_shadow_DOM).
