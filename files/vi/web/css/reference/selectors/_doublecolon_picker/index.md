---
title: ::picker()
slug: Web/CSS/Reference/Selectors/::picker
page-type: css-pseudo-element
browser-compat: css.selectors.picker
sidebar: cssref
---

Phần tử giả **`::picker()`** trong [CSS](/en-US/docs/Web/CSS) nhắm vào phần picker của một phần tử, ví dụ như picker thả xuống của một [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select).

## Cú pháp

```css-nolint
::picker(<ident>) {
  /* ... */
}
```

### Tham số

- {{cssxref("ident")}}
  - : Một chuỗi đại diện cho phần tử mà bạn muốn nhắm vào picker. Các giá trị sau đây có sẵn:
    - `select`
      - : Picker thả xuống của các phần tử select có thể tùy chỉnh.

## Mô tả

Phần tử giả `::picker()` nhắm vào phần picker của một điều khiển biểu mẫu, tức là phần bật lên xuất hiện để cho phép bạn thực hiện lựa chọn khi bạn nhấn nút điều khiển. Nó chỉ có thể nhắm vào khi phần tử gốc có picker và có giao diện cơ sở được đặt trên nó thông qua giá trị `base-select` của thuộc tính {{cssxref("appearance")}}.

Bộ chọn `::picker(select)` nhắm vào tất cả các phần tử con của phần tử `<select>` có thể tùy chỉnh ngoại trừ phần tử con `<button>` đầu tiên; những phần tử con này được trình duyệt nhóm lại với nhau và hiển thị như picker. Phần tử con `<button>` đầu tiên đại diện cho nút điều khiển mở picker khi được nhấn.

Điều này cho phép bạn nhắm vào tất cả nội dung của picker như một thực thể duy nhất, ví dụ nếu bạn muốn tùy chỉnh đường viền của nó, tạo hiệu ứng khi nó xuất hiện và biến mất, hoặc đặt nó ở vị trí khác với vị trí mặc định. Hướng dẫn [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) của chúng tôi hiển thị nhiều ví dụ về cách sử dụng `::picker(select)`.

### Hành vi popover của picker

Phần tử `<select>` và picker có mối quan hệ invoker/popover ngầm được gán cho chúng tự động, như được chỉ định bởi [Popover API](/en-US/docs/Web/API/Popover_API). Xem [Sử dụng Popover API](/en-US/docs/Web/API/Popover_API/Using) để biết thêm chi tiết về hành vi popover, và xem [Tạo hiệu ứng cho picker thả xuống bằng trạng thái popover](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select#animating_the_picker_using_popover_states) cho một trường hợp sử dụng điển hình được cho phép bởi liên kết popover ngầm.

### Định vị anchor của picker

Một tác dụng phụ của mối quan hệ invoker/popover ngầm được đề cập ở trên là phần tử `<select>` và picker cũng có một tham chiếu anchor ngầm, nghĩa là picker được tự động liên kết với select thông qua [định vị anchor CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning). Điều này có một số ưu điểm, đáng chú ý nhất là:

- Các kiểu mặc định của trình duyệt định vị picker tương đối với nút (anchor) và bạn có thể tùy chỉnh vị trí này như được giải thích trong [Định vị phần tử tương đối với anchor của chúng](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#positioning_elements_relative_to_their_anchor). Để tham khảo, các kiểu mặc định liên quan như sau:

  ```css
  inset: auto;
  margin: 0;
  min-inline-size: anchor-size(self-inline);
  min-block-size: 1lh;
  /* Go to the edge of the viewport, and add scrollbars if needed. */
  max-block-size: stretch;
  overflow: auto;
  /* Below and span-right, by default. */
  position-area: block-end span-inline-end;
  ```

- Các kiểu mặc định của trình duyệt cũng định nghĩa một số position-try fallback để định vị lại picker nếu nó có nguy cơ tràn ra ngoài viewport. Position-try fallback được giải thích trong hướng dẫn [Các tùy chọn fallback và ẩn có điều kiện cho tràn](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding). Để tham khảo, các kiểu fallback mặc định liên quan như sau:

  ```css
  position-try-order: most-block-size;
  position-try-fallbacks:
    /* First try above and span-right, */
    /* then below but span-left, */
    /* then above and span-left. */
    block-start span-inline-end,
    block-end span-inline-start,
    block-start span-inline-start;
  ```

> [!NOTE]
> Nếu bạn muốn xóa tham chiếu anchor ngầm để ngừng picker được neo vào phần tử `<select>`, bạn có thể làm điều đó bằng cách đặt thuộc tính `position-anchor` của picker thành một tên anchor không tồn tại trong tài liệu hiện tại, chẳng hạn như `--not-an-anchor-name`. Xem thêm [xóa liên kết anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#removing_an_anchor_association).

## Ví dụ

### Sử dụng select tùy chỉnh cơ bản

Để bật chức năng select tùy chỉnh và kiểu cơ sở tối thiểu của trình duyệt (và xóa kiểu do hệ điều hành cung cấp), phần tử `<select>` và picker của nó đều cần có giá trị {{cssxref("appearance")}} là `base-select`:

```css
select,
::picker(select) {
  appearance: base-select;
}
```

Bạn có thể, ví dụ, xóa {{cssxref("border")}} màu đen mặc định của picker:

```css
::picker(select) {
  border: none;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("select")}}, {{htmlelement("option")}}, {{htmlelement("optgroup")}}, {{htmlelement("label")}}, {{htmlelement("button")}}, {{htmlelement("selectedcontent")}}
- {{cssxref("appearance")}}
- {{cssxref("::picker-icon")}}, {{cssxref("::checkmark")}}
- {{cssxref(":open")}}, {{cssxref(":checked")}}
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
