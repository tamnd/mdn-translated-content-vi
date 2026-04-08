---
title: :stalled
slug: Web/CSS/Reference/Selectors/:stalled
page-type: css-pseudo-class
browser-compat: css.selectors.stalled
sidebar: cssref
---

Bộ chọn **`:stalled`** [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) [CSS](/en-US/docs/Web/CSS) đại diện cho một phần tử có thể phát, chẳng hạn như {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, khi quá trình phát bị đình trệ.
Một tài nguyên được coi là bị đình trệ nếu người dùng đã yêu cầu phát lại tại một vị trí cụ thể trong tài nguyên media, nhưng nó không nhận được dữ liệu nào trong một khoảng thời gian nhất định.
Điều này khác với {{cssxref(":buffering")}} ở chỗ phần tử media bất ngờ không tải được dữ liệu khi bị đình trệ (ví dụ: do lỗi mạng) trong khoảng 3 giây (thời gian chính xác phụ thuộc vào [tác nhân người dùng](https://html.spec.whatwg.org/multipage/media.html#stall-timeout)).

> [!NOTE]
> Cũng như với lớp giả {{cssxref(":buffering")}}, phần tử vẫn được coi là "đang phát" khi nó "bị đình trệ".
> Nếu `:stalled` khớp với một phần tử, {{cssxref(":playing")}} cũng sẽ khớp với phần tử đó.

## Cú pháp

```css
:stalled {
  /* ... */
}
```

## Ví dụ

### CSS

```css
:stalled {
  outline: 5px solid red;
}

audio:stalled {
  background-color: red;
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":buffering")}}
- {{cssxref(":muted")}}
- {{cssxref(":paused")}}
- {{cssxref(":playing")}}
- {{cssxref(":seeking")}}
- {{cssxref(":volume-locked")}}
- [Bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors)
- Sự kiện [`stalled`](/en-US/docs/Web/API/HTMLMediaElement/stalled_event)
