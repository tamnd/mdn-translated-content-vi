---
title: "ARIA: vai trò term"
short-title: term
slug: Web/Accessibility/ARIA/Reference/Roles/term_role
page-type: aria-role
spec-urls: https://w3c.github.io/aria/#term
sidebar: accessibilitysidebar
---

Vai trò `term` có thể được dùng cho một từ hoặc cụm từ kèm theo một [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role) tương ứng tùy chọn.

## Mô tả

Vai trò `term` có thể được dùng cho một từ hoặc cụm từ kèm theo một [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role) tương ứng tùy chọn. Nó tương đương về mặt ngữ nghĩa với phần tử HTML {{HTMLElement('dfn')}} và phần tử thuật ngữ định nghĩa ({{HTMLElement('dt')}}) trong một danh sách định nghĩa ({{HTMLElement('dl')}} ).

Vai trò `term` được dùng để xác định rõ ràng một từ hoặc cụm từ mà tác giả đã cung cấp định nghĩa hoặc người dùng được kỳ vọng sẽ cung cấp định nghĩa. Nếu đã có định nghĩa, hoặc có một form hay điều khiển form để nhập định nghĩa, tác giả NÊN đặt [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details) trỏ tới phần tử liên quan.

Đừng dùng `role="term"` trên các phần tử tương tác như liên kết vì nó có thể cản trở khả năng tương tác của người dùng công nghệ hỗ trợ với phần tử đó. Ngoài ra, bản thân term chính là tên khả năng tiếp cận, vì vậy đừng dùng [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) hoặc [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby).

> [!WARNING]
> Tên khả năng tiếp cận nên chính là term, vì vậy KHÔNG dùng `aria-label` hoặc `aria-labelledby`.

### Các vai trò, trạng thái và thuộc tính WAI-ARIA liên quan

Không có.

### Tương tác bàn phím

Không có.

### Tính năng JavaScript bắt buộc

Không có.

## Ví dụ

```html
<p>
  <span role="term">Mansplaining</span>,
  <span role="definition"
    >a portmanteau of "man" and "explain", is the patronizing act of explaining
    without being asked to do so, to someone already learned on the topic, often
    after someone has already explained it</span
  >.
</p>
```

Có thêm ngữ nghĩa tốt hơn, đoạn trên cũng có thể viết là:

```html
<p>
  <dfn role="term">Mansplaining</dfn>,
  <span role="definition"
    >a portmanteau of "man" and "explain", is the patronizing act of explaining
    without being asked to do so, to someone already learned on the topic, often
    after someone has already explained it</span
  >.
</p>
```

hoặc không dùng ARIA nào cả (nhưng có thể không phải cách bạn muốn nó được trình bày)

```html
<dl>
  <dt>Mansplaining</dt>
  <dd>
    A portmanteau of "man" and "explain", is the patronizing act of explaining
    without being asked to do so, to someone already learned on the topic, often
    after someone has already explained it.
  </dd>
</dl>
```

## Lưu ý về khả năng tiếp cận

Đừng dùng `role="term"` trên các phần tử tương tác như liên kết vì nó có thể cản trở khả năng của người dùng công nghệ hỗ trợ khi tương tác với phần tử đó.

## Thực hành tốt nhất

Hãy để chính term định nghĩa tên khả năng tiếp cận. Đừng dùng `aria-label` hoặc `aria-labelledby`.

## Đặc tả

{{Specifications}}

## Xem thêm

- [ARIA: `definition` role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role).
- Phần tử HTML {{HTMLElement('dfn')}}
