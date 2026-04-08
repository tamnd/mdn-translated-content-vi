---
title: overlay
slug: Web/CSS/Reference/Properties/overlay
page-type: css-property
status:
  - experimental
browser-compat: css.properties.overlay
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/vi/docs/Web/CSS) **`overlay`** chỉ định liệu một phần tử xuất hiện trong [lớp trên cùng](/vi/docs/Glossary/Top_layer) (ví dụ: một [popover](/vi/docs/Web/API/Popover_API) đang hiển thị hoặc phần tử {{htmlelement("dialog")}} modal) có thực sự được hiển thị trong lớp trên cùng hay không. Thuộc tính này chỉ có liên quan trong danh sách các giá trị {{cssxref("transition-property")}}, và chỉ khi `allow-discrete` được đặt làm {{cssxref("transition-behavior")}}.

Cần lưu ý rằng `overlay` chỉ _có thể_ được đặt bởi trình duyệt — các kiểu do tác giả viết không thể thay đổi giá trị `overlay` của bất kỳ phần tử nào. Tuy nhiên, bạn có thể thêm `overlay` vào [danh sách các thuộc tính chuyển tiếp](/vi/docs/Web/CSS/Reference/Properties/transition-property) được đặt trên một phần tử. Điều này khiến việc xóa phần tử khỏi lớp trên cùng bị trì hoãn để nó có thể được hoạt hình thay vì biến mất ngay lập tức.

> [!NOTE]
> Khi chuyển tiếp `overlay`, bạn cần đặt [`transition-behavior: allow-discrete`](/vi/docs/Web/CSS/Reference/Properties/transition-behavior) trên chuyển tiếp để nó hoạt hình. Hoạt hình `overlay` khác với [hoạt hình rời rạc](/vi/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete) thông thường ở chỗ trạng thái hiển thị (tức là `auto`) sẽ luôn được hiển thị trong toàn bộ thời gian chuyển tiếp, bất kể đó là trạng thái bắt đầu hay kết thúc.

## Cú pháp

```css
/* Giá trị từ khóa */
overlay: auto;
overlay: none;

/* Giá trị toàn cục */
overlay: inherit;
overlay: initial;
overlay: revert;
overlay: revert-layer;
overlay: unset;
```

### Giá trị

- `auto`
  - : Phần tử được hiển thị trong lớp trên cùng nếu nó được đưa lên lớp trên cùng.
- `none`
  - : Phần tử không được hiển thị trong lớp trên cùng.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Chuyển tiếp một popover

Trong ví dụ này, một [popover](/vi/docs/Web/API/Popover_API) được hoạt hình khi nó [chuyển tiếp](/vi/docs/Web/CSS/Guides/Transitions) từ trạng thái ẩn sang hiện và ngược lại.

#### HTML

HTML chứa một phần tử {{htmlelement("div")}} được khai báo là popover sử dụng thuộc tính [popover](/vi/docs/Web/HTML/Reference/Global_attributes/popover), và một phần tử {{htmlelement("button")}} được chỉ định là điều khiển hiển thị popover sử dụng thuộc tính [popovertarget](/vi/docs/Web/HTML/Reference/Elements/button#popovertarget).

```html
<button popovertarget="mypopover">Show the popover</button>
<div popover="auto" id="mypopover">I'm a Popover! I should animate.</div>
```

#### CSS

Thuộc tính `overlay` chỉ có mặt trong danh sách các thuộc tính được chuyển tiếp. Vì `overlay` là thuộc tính được điều khiển bởi tác nhân người dùng, nó không được khai báo trong các trạng thái trước hoặc sau chuyển tiếp.

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

[popover]:popover-open {
  opacity: 1;
  transform: scaleX(1);
}

[popover] {
  font-size: 1.2rem;
  padding: 10px;

  /* Final state of the exit animation */
  opacity: 0;
  transform: scaleX(0);

  transition:
    opacity 0.7s,
    transform 0.7s,
    overlay 0.7s allow-discrete,
    display 0.7s allow-discrete;
  /* Equivalent to
  transition: all 0.7s allow-discrete; */
}

/* Needs to be included after the previous [popover]:popover-open
   rule to take effect, as the specificity is the same */
@starting-style {
  [popover]:popover-open {
    opacity: 0;
    transform: scaleX(0);
  }
}

/* Transition for the popover's backdrop */

[popover]::backdrop {
  background-color: transparent;
  transition:
    display 0.7s allow-discrete,
    overlay 0.7s allow-discrete,
    background-color 0.7s;
  /* Equivalent to
  transition: all 0.7s allow-discrete; */
}

[popover]:popover-open::backdrop {
  background-color: rgb(0 0 0 / 25%);
}

/* Nesting selectors (&) cannot represent pseudo-elements, so this 
   starting-style rule cannot be nested. */

@starting-style {
  [popover]:popover-open::backdrop {
    background-color: transparent;
  }
}
```

Hai thuộc tính chúng ta muốn hoạt hình là {{cssxref("opacity")}} và {{cssxref("transform")}}: chúng ta muốn popover mờ dần vào và ra trong khi phát triển và thu nhỏ theo chiều ngang. Chúng ta đặt trạng thái bắt đầu cho các thuộc tính này ở trạng thái ẩn mặc định của phần tử popover (được chọn qua `[popover]`), và trạng thái kết thúc ở trạng thái mở của popover (được chọn qua lớp giả {{cssxref(":popover-open")}}). Sau đó chúng ta đặt thuộc tính {{cssxref("transition")}} để hoạt hình giữa hai trạng thái.

Vì phần tử được hoạt hình đang được đưa lên [lớp trên cùng](/vi/docs/Glossary/Top_layer) khi hiển thị và bị xóa khỏi lớp trên cùng khi ẩn, `overlay` được thêm vào danh sách các phần tử được chuyển tiếp. Điều này đảm bảo rằng việc xóa phần tử khỏi lớp trên cùng bị trì hoãn cho đến khi hoạt hình kết thúc.

Các bước sau đây cũng cần thiết để hoạt hình hoạt động ở cả hai chiều:

- Trạng thái bắt đầu cho hoạt hình được đặt bên trong quy tắc at {{cssxref("@starting-style")}}. Điều này cần thiết để tránh hành vi không mong muốn. Theo mặc định, các chuyển tiếp không được kích hoạt trong các cập nhật kiểu đầu tiên của phần tử, hoặc khi loại `display` thay đổi từ `none` sang loại khác.
- `display` cũng được thêm vào danh sách các phần tử được chuyển tiếp để phần tử được hoạt hình hiển thị (đặt thành `display: block`) trong suốt cả hoạt hình vào và ra.

#### Kết quả

{{ EmbedLiveSample("Transitioning a popover", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Mô-đun [CSS transitions](/vi/docs/Web/CSS/Guides/Transitions)
- {{cssxref("@starting-style")}}
- {{cssxref("transition-behavior")}}
- [Four new CSS features for smooth entry and exit animations](https://developer.chrome.com/blog/entry-exit-animations/) trên developer.chrome.com (2023)
