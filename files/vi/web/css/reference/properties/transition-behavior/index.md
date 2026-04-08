---
title: transition-behavior
slug: Web/CSS/Reference/Properties/transition-behavior
page-type: css-property
browser-compat: css.properties.transition-behavior
sidebar: cssref
---

Thuộc tính **`transition-behavior`** của [CSS](/vi/docs/Web/CSS) chỉ định xem các transition có được bắt đầu cho các thuộc tính có hành vi hoạt ảnh là [rời rạc](/en-US/docs/Web/CSS/Guides/Animations/Animatable_properties#discrete) hay không.

## Cú pháp

```css
/* Giá trị từ khóa */
transition-behavior: allow-discrete;
transition-behavior: normal;

/* Giá trị toàn cục */
transition-behavior: inherit;
transition-behavior: initial;
transition-behavior: revert;
transition-behavior: revert-layer;
transition-behavior: unset;
```

### Giá trị

- `allow-discrete`
  - : Các transition sẽ được bắt đầu trên phần tử cho các thuộc tính được hoạt ảnh rời rạc.
- `normal`
  - : Các transition sẽ _không_ được bắt đầu trên phần tử cho các thuộc tính được hoạt ảnh rời rạc.

## Mô tả

Thuộc tính `transition-behavior` chỉ có liên quan khi được sử dụng kết hợp với các thuộc tính transition khác, đặc biệt là {{cssxref("transition-property")}} và {{cssxref("transition-duration")}}, vì không có transition nào xảy ra nếu không có thuộc tính nào được hoạt ảnh trong khoảng thời gian khác không.

```css
.card {
  transition-property: opacity, display;
  transition-duration: 0.25s;
  transition-behavior: allow-discrete;
}

.card.fade-out {
  opacity: 0;
  display: none;
}
```

Giá trị `transition-behavior` có thể được đưa vào như một phần của khai báo viết tắt {{cssxref("transition")}}. Khi được đưa vào viết tắt, khi sử dụng hoặc mặc định cho tất cả các thuộc tính, giá trị `allow-discrete` không có tác động đến các thuộc tính có thể hoạt ảnh thông thường. CSS sau đây tương đương với các khai báo dài ở trên:

```css
.card {
  transition: all 0.25s;
  transition: all 0.25s allow-discrete;
}

.card.fade-out {
  opacity: 0;
  display: none;
}
```

Trong đoạn trên, chúng ta đưa vào thuộc tính `transition` hai lần. Lần đầu không bao gồm giá trị `allow-discrete` — điều này cung cấp hỗ trợ đa trình duyệt, đảm bảo các thuộc tính khác của thẻ vẫn có transition trong các trình duyệt không hỗ trợ `transition-behavior`.

### Hành vi hoạt ảnh rời rạc

Các thuộc tính được hoạt ảnh rời rạc thường chuyển đổi giữa hai giá trị ở 50% trong quá trình hoạt ảnh giữa hai giá trị.

Tuy nhiên có một ngoại lệ, đó là khi hoạt ảnh đến hoặc từ `display: none` hoặc `content-visibility: hidden`. Trong trường hợp này, trình duyệt sẽ chuyển đổi giữa hai giá trị sao cho nội dung được transition hiển thị trong toàn bộ thời lượng hoạt ảnh.

Ví dụ:

- Khi hoạt ảnh `display` từ `none` đến `block` (hoặc giá trị `display` hiển thị khác), giá trị sẽ chuyển sang `block` ở `0%` của thời lượng hoạt ảnh để nó hiển thị suốt.
- Khi hoạt ảnh `display` từ `block` (hoặc giá trị `display` hiển thị khác) đến `none`, giá trị sẽ chuyển sang `none` ở `100%` của thời lượng hoạt ảnh để nó hiển thị suốt.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Transition một popover

Trong ví dụ này, một [popover](/en-US/docs/Web/API/Popover_API) được hoạt ảnh khi nó [chuyển đổi](/en-US/docs/Web/CSS/Guides/Transitions) từ ẩn sang hiện và ngược lại.

#### HTML

HTML bao gồm một phần tử {{htmlelement("div")}} được khai báo là popover bằng thuộc tính [popover](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), và một phần tử {{htmlelement("button")}} được chỉ định là nút điều khiển hiển thị popover bằng thuộc tính [popovertarget](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget).

```html
<button popovertarget="mypopover">Show the popover</button>
<div popover="auto" id="mypopover">I'm a Popover! I should animate.</div>
```

#### CSS

```css hidden
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

[popover] {
  font-size: 1.2rem;
  padding: 10px;
}
```

```css
[popover]:popover-open {
  opacity: 1;
  transform: scaleX(1);
}

[popover] {
  /* Trạng thái cuối của hoạt ảnh thoát */
  opacity: 0;
  transform: scaleX(0);

  transition-property: opacity, transform, overlay, display;
  transition-duration: 0.7s;
  transition-behavior: allow-discrete;
  /* Sử dụng thuộc tính viết tắt transition, chúng ta có thể viết:
    transition: 
      opacity 0.7s,
      transform 0.7s,
      overlay 0.7s allow-discrete,
      display 0.7s allow-discrete;

    hoặc thậm chí:
    transition: all 0.7s allow-discrete;
  */
}

/* Cần được đưa vào sau quy tắc [popover]:popover-open trước
   để có hiệu lực, vì độ đặc hiệu là như nhau */
@starting-style {
  [popover]:popover-open {
    opacity: 0;
    transform: scaleX(0);
  }
}
```

Hai thuộc tính chúng ta muốn hoạt ảnh là {{cssxref("opacity")}} và {{cssxref("transform")}}: chúng ta muốn popover mờ dần vào và ra trong khi phát triển và thu nhỏ theo chiều ngang. Chúng ta đặt trạng thái bắt đầu cho các thuộc tính này trên trạng thái ẩn mặc định của phần tử popover (được chọn qua `[popover]`), và trạng thái kết thúc trên trạng thái mở của popover (được chọn qua lớp giả {{cssxref(":popover-open")}}). Sau đó chúng ta đặt thuộc tính {{cssxref("transition")}} để hoạt ảnh giữa hai trạng thái.

Vì phần tử được hoạt ảnh được đưa lên [top layer](/en-US/docs/Glossary/Top_layer) khi hiển thị và bị xóa khỏi top layer khi ẩn — điều đó cũng có nghĩa là trạng thái ẩn của nó có [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display) — các thuộc tính sau được thêm vào danh sách các phần tử được transition để hoạt ảnh hoạt động theo cả hai chiều. Trong cả hai trường hợp, `transition-behavior: allow-discrete` được đặt trong viết tắt để bật hoạt ảnh rời rạc.

- `display`: Cần thiết để phần tử được hoạt ảnh hiển thị (được đặt thành `display: block`) trong suốt cả hoạt ảnh vào và thoát. Không có điều này, hoạt ảnh thoát sẽ không hiển thị; thực tế, popover sẽ chỉ biến mất.
- {{cssxref("overlay")}}: Cần thiết để đảm bảo việc xóa phần tử khỏi top layer bị hoãn lại cho đến khi hoạt ảnh hoàn thành. Điều này không tạo ra sự khác biệt lớn đối với các hoạt ảnh cơ bản như thế này, nhưng trong các trường hợp phức tạp hơn, không làm điều này có thể dẫn đến việc phần tử bị xóa khỏi overlay quá nhanh, khiến hoạt ảnh không mượt mà hoặc không hiệu quả.

Ngoài ra, trạng thái bắt đầu cho hoạt ảnh được đặt bên trong at-rule {{cssxref("@starting-style")}}. Điều này cần thiết để tránh hành vi không mong muốn. Theo mặc định, các transition không được kích hoạt trên các bản cập nhật kiểu đầu tiên của phần tử, hoặc khi loại `display` thay đổi từ `none` sang loại khác. `@starting-style` cho phép bạn ghi đè mặc định đó theo cách có kiểm soát cụ thể. Không có điều này, hoạt ảnh vào sẽ không xảy ra và popover sẽ chỉ xuất hiện.

#### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("Transitioning a popover", "100%", "200") }}

> [!NOTE]
> Vì các popover thay đổi từ `display: none` sang `display: block` mỗi khi chúng được hiển thị, popover chuyển đổi từ các kiểu `@starting-style` sang các kiểu `[popover]:popover-open` mỗi khi hoạt ảnh vào xảy ra. Khi popover đóng, nó chuyển đổi từ trạng thái `[popover]:popover-open` sang trạng thái `[popover]` mặc định.
>
> Có thể kiểu transition khi vào và thoát khác nhau trong các trường hợp như vậy. Xem ví dụ [Minh họa khi nào starting styles được sử dụng](/en-US/docs/Web/CSS/Reference/At-rules/@starting-style#demonstration_of_when_starting_styles_are_used) của chúng ta để có bằng chứng về điều này.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("overlay")}}
- {{cssxref("@starting-style")}}
- Mô-đun [CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions)
- [Four new CSS features for smooth entry and exit animations](https://developer.chrome.com/blog/entry-exit-animations/) trên developer.chrome.com (2023)
