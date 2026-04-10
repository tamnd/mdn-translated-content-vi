---
title: "HTMLInputElement: sự kiện invalid"
short-title: invalid
slug: Web/API/HTMLInputElement/invalid_event
page-type: web-api-event
browser-compat: api.HTMLInputElement.invalid_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`invalid`** kích hoạt khi một phần tử có thể gửi đã được kiểm tra tính hợp lệ và không thỏa mãn các ràng buộc của nó.

Sự kiện này có thể hữu ích để hiển thị tóm tắt các vấn đề với biểu mẫu khi gửi. Khi một biểu mẫu được gửi, các sự kiện `invalid` được kích hoạt tại mỗi điều khiển biểu mẫu không hợp lệ. Tính hợp lệ của các phần tử có thể gửi được kiểm tra trước khi gửi {{HtmlElement("form")}} sở hữu chúng, hoặc sau khi phương thức [`checkValidity()`](/en-US/docs/Web/API/HTMLInputElement/checkValidity) của phần tử hoặc `<form>` sở hữu nó được gọi.

Nó không được kiểm tra khi {{domxref("Element/blur_event", "blur")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("invalid", (event) => { })

oninvalid = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Nếu một biểu mẫu được gửi với giá trị không hợp lệ, các phần tử có thể gửi được kiểm tra và nếu tìm thấy lỗi, sự kiện `invalid` sẽ kích hoạt trên phần tử `invalid`. Trong ví dụ này, khi sự kiện invalid kích hoạt do giá trị không hợp lệ trong đầu vào, giá trị không hợp lệ được ghi lại.

### HTML

```html
<form action="#">
  <div>
    <label>
      Nhập một số nguyên từ 1 đến 10:
      <input type="number" min="1" max="10" required />
    </label>
  </div>
  <div><input type="submit" value="gửi" /></div>
</form>
<hr />
Giá trị không hợp lệ:
<ul id="log"></ul>
```

### JavaScript

```js
const input = document.querySelector("input");
const log = document.getElementById("log");

input.addEventListener("invalid", (e) => {
  log.appendChild(document.createElement("li")).textContent = JSON.stringify(
    e.target.value,
  );
});
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HtmlElement("form")}}
- Sự kiện liên quan: {{domxref("HTMLFormElement/submit_event", "submit")}}
- Lớp giả CSS {{cssxref(":invalid")}}
