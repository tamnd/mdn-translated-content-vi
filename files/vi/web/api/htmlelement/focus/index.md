---
title: "HTMLElement: phương thức focus()"
short-title: focus()
slug: Web/API/HTMLElement/focus
page-type: web-api-instance-method
browser-compat: api.HTMLElement.focus
---

{{ APIRef("HTML DOM") }}

Phương thức **`HTMLElement.focus()`** đặt tiêu điểm vào phần tử được chỉ định, nếu phần tử đó có thể nhận tiêu điểm.
Phần tử được tiêu điểm là phần tử sẽ nhận các sự kiện bàn phím và tương tự theo mặc định.

Theo mặc định, trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi đặt tiêu điểm, và cũng có thể hiển thị chỉ báo trực quan cho phần tử được tiêu điểm (thường bằng cách hiển thị "vòng tiêu điểm" quanh phần tử).
Các tùy chọn tham số được cung cấp để tắt cuộn mặc định và buộc hiển thị chỉ báo trực quan trên các phần tử.

## Cú pháp

```js-nolint
focus()
focus(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn để kiểm soát các khía cạnh của quá trình đặt tiêu điểm.
    Đối tượng này có thể chứa các thuộc tính sau:
    - `preventScroll` {{optional_inline}}
      - : Một giá trị boolean cho biết liệu trình duyệt có nên cuộn tài liệu để đưa phần tử mới được tiêu điểm vào tầm nhìn hay không.
        Giá trị `false` cho `preventScroll` (mặc định) có nghĩa là trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi đặt tiêu điểm.
        Nếu `preventScroll` được đặt thành `true`, sẽ không có cuộn nào xảy ra.
    - `focusVisible` {{optional_inline}} {{experimental_inline}}
      - : Một giá trị boolean, nên đặt thành `true` để buộc, hoặc `false` để ngăn chỉ báo trực quan rằng phần tử đang được tiêu điểm.
        Nếu thuộc tính không được chỉ định, trình duyệt sẽ hiển thị chỉ báo trực quan nếu xác định rằng điều đó sẽ cải thiện khả năng tiếp cận cho người dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Đặt tiêu điểm vào trường văn bản

Ví dụ này dùng nút để đặt tiêu điểm vào trường văn bản.

#### HTML

```html
<input id="myTextField" value="Text field." />
<button id="focusButton">Click to set focus on the text field</button>
```

#### JavaScript

Đoạn mã bên dưới thêm trình xử lý sự kiện để đặt tiêu điểm vào trường văn bản khi nhấn nút.
Lưu ý rằng hầu hết các trình duyệt sẽ tự động thêm chỉ báo trực quan (một "vòng tiêu điểm") cho trường văn bản được tiêu điểm, vì vậy đoạn mã không đặt `focusVisible` thành `true`.

```js
document.getElementById("focusButton").addEventListener("click", () => {
  document.getElementById("myTextField").focus();
});
```

#### Kết quả

Chọn nút để đặt tiêu điểm vào trường văn bản.

{{ EmbedLiveSample('Focus_on_a_text_field') }}

### Đặt tiêu điểm vào nút

Ví dụ này mô tả cách bạn có thể đặt tiêu điểm vào phần tử nút.

#### HTML

Đầu tiên chúng ta xác định ba nút.
Cả nút giữa và nút phải sẽ đặt tiêu điểm vào nút ngoài cùng bên trái.
Nút ngoài cùng bên phải cũng sẽ chỉ định `focusVisible`.

```html
<button id="myButton">Button</button>
<button id="focusButton">Click to set focus on "Button"</button>
<button id="focusButtonVisibleIndication">
  Click to set focus and focusVisible on "Button"
</button>
```

#### JavaScript

Đoạn mã bên dưới thiết lập trình xử lý sự kiện nhấp chuột cho nút giữa và nút phải.

```js
document.getElementById("focusButton").addEventListener("click", () => {
  document.getElementById("myButton").focus();
});

document
  .getElementById("focusButtonVisibleIndication")
  .addEventListener("click", () => {
    document.getElementById("myButton").focus({ focusVisible: true });
  });
```

#### Kết quả

Chọn nút giữa hoặc nút ngoài cùng bên phải để đặt tiêu điểm vào nút ngoài cùng bên trái.

Các trình duyệt thường không hiển thị chỉ báo tiêu điểm trực quan trên các phần tử nút khi tiêu điểm được đặt theo chương trình, vì vậy hiệu ứng khi chọn nút giữa có thể không rõ ràng.
Tuy nhiên, nếu tùy chọn `focusVisible` được hỗ trợ trên trình duyệt của bạn, bạn sẽ thấy tiêu điểm thay đổi trên nút ngoài cùng bên trái khi chọn nút ngoài cùng bên phải.

{{ EmbedLiveSample('Focus_on_a_button') }}

### Đặt tiêu điểm có và không có cuộn

Ví dụ này cho thấy hiệu ứng của việc đặt tiêu điểm với tùy chọn [`preventScroll`](#preventscroll) được đặt thành `true` và `false` (mặc định).

#### HTML

HTML định nghĩa hai nút sẽ được dùng để đặt tiêu điểm của nút thứ ba nằm ngoài màn hình

```html
<button id="focus_scroll">Click to set focus on off-screen button</button>
<button id="focus_no_scroll">
  Click to set focus on offscreen button without scrolling
</button>

<div id="container">
  <button id="myButton">Button</button>
</div>
```

```css hidden
#myButton {
  margin-top: 500px; /* Push the button off-screen */
}
```

#### JavaScript

Đoạn mã này đặt trình xử lý sự kiện nhấp chuột trên nút đầu và nút thứ hai để đặt tiêu điểm vào nút cuối.
Lưu ý rằng trình xử lý đầu tiên không chỉ định tùy chọn `preventScroll` nên cuộn đến phần tử được tiêu điểm sẽ được bật.

```js
document.getElementById("focus_scroll").addEventListener("click", () => {
  document.getElementById("myButton").focus(); // default: {preventScroll:false}
});

document.getElementById("focus_no_scroll").addEventListener("click", () => {
  document.getElementById("myButton").focus({ preventScroll: true });
});
```

#### Kết quả

Chọn nút đầu tiên để đặt tiêu điểm và cuộn đến nút ngoài màn hình.
Chọn nút thứ hai sẽ đặt tiêu điểm, nhưng cuộn bị tắt.

{{ EmbedLiveSample('Focus with and without scrolling') }}

## Thông số kỹ thuật

{{Specifications}}

## Ghi chú

- Nếu bạn gọi `HTMLElement.focus()` từ trình xử lý sự kiện mousedown, bạn phải gọi `event.preventDefault()` để giữ tiêu điểm không rời khỏi `HTMLElement`
- Hành vi của tiêu điểm liên quan đến các tính năng HTML khác như [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) hoặc {{Glossary("shadow tree", "shadow dom")}}, trước đây vẫn chưa được xác định rõ ràng, đã được cập nhật vào tháng 10 năm 2019.
  Xem [blog WHATWG](https://blog.whatwg.org/focusing-on-focus) để biết thêm thông tin.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.blur")}} để xóa tiêu điểm khỏi một phần tử.
- {{domxref("document.activeElement")}} để biết phần tử nào đang được tiêu điểm.
