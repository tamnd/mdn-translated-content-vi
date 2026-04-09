---
title: HTML popover global attribute
short-title: popover
slug: Web/HTML/Reference/Global_attributes/popover
page-type: html-attribute
browser-compat: html.global_attributes.popover
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`popover`** được dùng để chỉ định một phần tử là phần tử popover.

## Giá trị

Thuộc tính `popover` có thể nhận một trong các giá trị sau:

- `"auto"`
  - : Popover kiểu [`auto`](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss) có thể được "đóng nhẹ" (light dismiss) — nghĩa là bạn có thể ẩn popover bằng cách nhấp ra ngoài hoặc nhấn phím <kbd>Esc</kbd>. Hiển thị một popover `auto` thường sẽ đóng các popover `auto` khác đang hiển thị, trừ khi chúng được lồng nhau.

    > [!NOTE]
    > Đặt giá trị rỗng cho `popover` — `popover` hoặc `popover=""` — tương đương với việc đặt `popover="auto"`.

- `"hint"`
  - : Popover kiểu [`hint`](/en-US/docs/Web/API/Popover_API/Using#using_hint_popover_state) không đóng các popover `auto` khi chúng được hiển thị, nhưng sẽ đóng các popover hint khác.
    Chúng có thể được đóng nhẹ và sẽ phản hồi với yêu cầu đóng.

- `"manual"`
  - : Popover kiểu [`manual`](/en-US/docs/Web/API/Popover_API/Using#using_manual_popover_state) không thể được "đóng nhẹ" và không tự động đóng. Popover phải được hiển thị và đóng một cách rõ ràng bằng cách sử dụng nút show/hide/toggle khai báo hoặc JavaScript. Có thể hiển thị đồng thời nhiều popover `manual` độc lập.

## Mô tả

Các phần tử popover bị ẩn thông qua `display: none` cho đến khi được mở bằng phần tử điều khiển (tức là `<button>` hoặc `<input type="button">` với thuộc tính [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)) hoặc lệnh gọi {{domxref("HTMLElement.showPopover()")}}.

Khi mở, các phần tử popover sẽ xuất hiện phía trên tất cả các phần tử khác trong {{glossary("top layer")}}, và sẽ không bị ảnh hưởng bởi kiểu dáng {{cssxref('position')}} hay {{cssxref('overflow')}} của các phần tử cha.

Các popover ở trạng thái [`auto`](/en-US/docs/Web/API/Popover_API/Using#auto_state_and_light_dismiss) có thể được hiển thị và ẩn bằng các điều khiển liên kết (được chỉ định bởi thuộc tính [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)) và được "đóng nhẹ" bằng cách nhấp ra ngoài vùng popover, mở một popover khác, hoặc nhấn các cơ chế dành riêng cho trình duyệt như phím <kbd>Esc</kbd>.

Thông thường chỉ có thể hiển thị một popover `auto` trên màn hình tại một thời điểm — hiển thị popover thứ hai khi đã có một popover đang hiển thị sẽ ẩn popover đầu tiên. Ngoại lệ của quy tắc này là khi bạn có các popover auto lồng nhau. Xem [Nested popovers](/en-US/docs/Web/API/Popover_API/Using#nested_popovers) để biết thêm chi tiết.

Chúng cũng có thể được điều khiển bằng JavaScript, ví dụ phương thức {{domxref("HTMLElement.togglePopover()")}} có thể được dùng để chuyển đổi trạng thái hiển thị/ẩn của popover.

Ngược lại, các popover kiểu [`manual`](/en-US/docs/Web/API/Popover_API/Using#using_manual_popover_state) phải được hiển thị và ẩn thủ công — chúng không tự động đóng các popover khác khi được hiển thị và không thể đóng nhẹ. Điều này cho phép các trường hợp sử dụng mà bạn muốn hiển thị nhiều popover cùng một lúc.

Popover kiểu [`hint`](/en-US/docs/Web/API/Popover_API/Using#using_hint_popover_state) không đóng các popover `auto` khi chúng được hiển thị, nhưng sẽ đóng các popover hint khác. Chúng có thể đóng nhẹ và sẽ phản hồi với yêu cầu đóng.

Thông thường các popover `hint` được hiển thị và ẩn để phản hồi các sự kiện JavaScript không phải nhấp chuột như [`mouseover`](/en-US/docs/Web/API/Element/mouseover_event)/[`mouseout`](/en-US/docs/Web/API/Element/mouseout_event) và [`focus`](/en-US/docs/Web/API/Element/focus_event)/[`blur`](/en-US/docs/Web/API/Element/blur_event). Nhấp vào nút để mở popover `hint` sẽ khiến popover `auto` đang mở bị đóng nhẹ.

Để biết thông tin chi tiết về cách sử dụng, xem trang chủ {{domxref("Popover API", "Popover API", "", "nocode")}}.

## Ví dụ

### Biến một phần tử thành popover

Đoạn mã sau tạo ra một nút mà khi được kích hoạt sẽ mở một phần tử popover. Hành vi này có thể đạt được chỉ bằng HTML.

```html
<button popovertarget="my-popover">Open Popover</button>

<div popover id="my-popover">Greetings, one and all!</div>
```

{{EmbedLiveSample('basic_example_of_popover', 600, 100)}}

### Lồng các popover

Trong ví dụ này, một nút mở một popover chứa các popover lồng nhau bổ sung. Các popover lồng nhau có thể được mở mà không đóng popover menu gốc.

#### HTML

Trong phần đầu tiên của HTML, chúng ta tạo một {{htmlElement("button")}} sẽ mở popover chính, là một menu chứa một vài tùy chọn.

```html
<header>
  <button popovertarget="menu">Open Menu</button>
</header>
<main>
  <!--  Page content goes here  -->
</main>
```

Trong phần thứ hai của HTML, chúng ta tạo popover menu được mở bởi nút đã tạo ở đoạn code trước. Popover menu này chứa danh sách không thứ tự các mục menu, mỗi mục có một nút thông tin để mở popover lồng nhau. Popover menu sử dụng `popover="auto"`, có nghĩa là nó sẽ không bị đóng khi các popover lồng nhau được mở.

```html
<!-- menu popover -->
<div id="menu" popover="auto">
  <ul>
    <li>
      <a href="#">New thing</a><button popovertarget="new-info">ⓘ</button>
    </li>
    <li>
      <a href="#">Open thing</a><button popovertarget="open-info">ⓘ</button>
    </li>
    <li>
      <a href="#">Save thing</a><button popovertarget="save-info">ⓘ</button>
    </li>
    <li>
      <a href="#">Close thing</a><button popovertarget="close-info">ⓘ</button>
    </li>
  </ul>
</div>
```

Trong phần cuối cùng của HTML, chúng ta tạo các popover thông tin cho từng mục menu. Mỗi popover bao gồm `popover="hint"`, nghĩa là nó sẽ không đóng popover menu gốc nhưng sẽ đóng các popover thông tin khác đang mở.

```html
<!-- info popovers -->
<div id="new-info" class="info-popover" popover="hint">
  This is some information about <strong>creating a new</strong> thing.
</div>
<div id="open-info" class="info-popover" popover="hint">
  This is some information about <strong>opening an existing</strong> thing.
</div>
<div id="save-info" class="info-popover" popover="hint">
  This is some information about <strong>saving the current</strong> thing.
</div>
<div id="close-info" class="info-popover" popover="hint">
  This is some information about <strong>closing the current</strong> thing.
</div>
```

#### CSS

```css hidden
header {
  display: flex;
  justify-content: center;
}
header button {
  margin: 0.4rem auto;
}
```

Chúng ta đã sử dụng [định vị neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning) để định vị popover menu bên dưới `<button>` và [grid](/en-US/docs/Web/CSS/Guides/Grid_layout) để bố trí các mục menu và nút thông tin.

```css
#menu {
  margin: 0;
  margin-top: 0.4rem;
  inset: auto;
  position-area: bottom;
}
#menu ul {
  display: grid;
  grid-template-columns: max-content 1fr;
  gap: 0.4rem;
  padding: 0.4rem;
}
#menu li {
  grid-column: span 2;
  display: grid;
  grid: inherit;
  grid-template-columns: subgrid;
  gap: 1.4rem;
}
li [popovertarget] {
  cursor: pointer;
  font-size: 1.2rem;
}
li button {
  border: none;
  padding: 0;
  background-color: inherit;
}
```

Ở đây, chúng ta đã sử dụng định vị neo để làm cho các popover thông tin xuất hiện ở bên phải các nút thông tin tương ứng.

```css
div.info-popover {
  margin: 2rem;
  inset: auto;
  max-width: 300px;
  position-area: right;
}
```

#### Kết quả

Nhấp vào nút _Open Menu_, sau đó nhấp vào biểu tượng thông tin (ⓘ) bên cạnh các tùy chọn menu để mở các popover thông tin.

{{EmbedLiveSample('popover_hint', 600, 250)}}

> [!NOTE]
> Xem [trang ví dụ Popover API](https://mdn.github.io/dom-examples/popover-api/) để truy cập toàn bộ bộ sưu tập ví dụ popover của MDN.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Popover API", "Popover API", "", "nocode")}}
- Thuộc tính HTML [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget)
- Thuộc tính HTML [`popovertargetaction`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertargetaction)
- Phần tử giả CSS {{cssxref("::backdrop")}}
- Lớp giả CSS {{cssxref(":popover-open")}}
