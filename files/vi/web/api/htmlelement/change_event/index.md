---
title: "HTMLElement: sự kiện change"
short-title: change
slug: Web/API/HTMLElement/change_event
page-type: web-api-event
browser-compat: api.HTMLElement.change_event
---

{{APIRef("HTML DOM")}}

Sự kiện `change` được kích hoạt với các phần tử {{HTMLElement("input")}}, {{HTMLElement("select")}} và {{HTMLElement("textarea")}} khi người dùng thay đổi giá trị của phần tử. Không giống sự kiện {{domxref("Element/input_event", "input")}}, sự kiện `change` không nhất thiết được kích hoạt sau mỗi lần thay đổi giá trị của phần tử.

Tùy thuộc vào loại phần tử và cách người dùng tương tác, sự kiện `change` sẽ kích hoạt vào các thời điểm khác nhau:

- Khi phần tử `{{HTMLElement('input/checkbox', '&lt;input type="checkbox"&gt;')}}` được chọn hoặc bỏ chọn (bằng cách nhấp hoặc dùng bàn phím);
- Khi phần tử `{{HTMLElement('input/radio', '&lt;input type="radio"&gt;')}}` được chọn (nhưng không phải khi bỏ chọn);
- Khi người dùng xác nhận thay đổi một cách rõ ràng (ví dụ: chọn một giá trị từ danh sách thả xuống của {{HTMLElement("select")}} bằng chuột, chọn ngày từ bộ chọn ngày cho `{{HTMLElement('input/date', '&lt;input type="date"&gt;')}}`, chọn tệp trong trình chọn tệp cho `{{HTMLElement('input/file', '&lt;input type="file"&gt;')}}`, v.v.);
- Khi phần tử mất tiêu điểm sau khi giá trị thay đổi: đối với các phần tử mà tương tác của người dùng là nhập chữ thay vì chọn, chẳng hạn như {{HTMLElement("textarea")}} hoặc kiểu `{{HTMLElement('input/text', 'text')}}`, `{{HTMLElement('input/search', 'search')}}`, `{{HTMLElement('input/url', 'url')}}`, `{{HTMLElement('input/tel', 'tel')}}`, `{{HTMLElement('input/email', 'email')}}`, hoặc `{{HTMLElement('input/password', 'password')}}` của phần tử {{HTMLElement('input')}}.

Đặc tả HTML liệt kê [các loại `<input>` sẽ kích hoạt sự kiện `change`](https://html.spec.whatwg.org/multipage/forms.html#concept-input-apply).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Phần tử \<select>

#### HTML

```html
<label>
  Choose an ice cream flavor:
  <select class="ice-cream" name="ice-cream">
    <option value="">Select One …</option>
    <option value="chocolate">Chocolate</option>
    <option value="sardine">Sardine</option>
    <option value="vanilla">Vanilla</option>
  </select>
</label>

<div class="result"></div>
```

```css hidden
body {
  display: grid;
  grid-template-areas: "select result";
}

select {
  grid-area: select;
}

.result {
  grid-area: result;
}
```

#### JavaScript

```js
const selectElement = document.querySelector(".ice-cream");
const result = document.querySelector(".result");

selectElement.addEventListener("change", (event) => {
  result.textContent = `You like ${event.target.value}`;
});
```

#### Kết quả

{{ EmbedLiveSample('select_element', '100%', '75px') }}

### Phần tử nhập văn bản

Đối với một số phần tử, bao gồm `<input type="text">`, sự kiện `change` không kích hoạt cho đến khi điều khiển mất tiêu điểm. Hãy thử nhập nội dung vào trường bên dưới, rồi nhấp vào nơi khác để kích hoạt sự kiện.

#### HTML

```html
<input placeholder="Enter some text" name="name" />
<p id="log"></p>
```

#### JavaScript

```js
const input = document.querySelector("input");
const log = document.getElementById("log");

input.addEventListener("change", updateValue);

function updateValue(e) {
  log.textContent = e.target.value;
}
```

#### Kết quả

{{ EmbedLiveSample('Text_input_element', '100%', '90px') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

Các trình duyệt khác nhau không luôn đồng ý về việc có nên kích hoạt sự kiện `change` cho một số loại tương tác nhất định hay không. Ví dụ: điều hướng bàn phím trong các phần tử {{HTMLElement("select")}} trước đây không bao giờ kích hoạt sự kiện `change` trong Gecko cho đến khi người dùng nhấn Enter hoặc chuyển tiêu điểm khỏi `<select>` (xem [Firefox bug 126379](https://bugzil.la/126379)). Từ Firefox 63 (Quantum), hành vi này đã nhất quán giữa tất cả các trình duyệt chính.
