---
title: "HTMLFormElement: sự kiện submit"
short-title: submit
slug: Web/API/HTMLFormElement/submit_event
page-type: web-api-event
browser-compat: api.HTMLFormElement.submit_event
---

{{APIRef("HTML DOM")}}

Sự kiện **`submit`** được kích hoạt khi một {{HtmlElement("form")}} được gửi.

Lưu ý rằng sự kiện `submit` được kích hoạt trên chính phần tử `<form>`, chứ không phải trên bất kỳ {{HtmlElement("button")}} hoặc `{{HtmlElement('input/submit', '&lt;input type="submit"&gt;')}}` nào bên trong nó. Tuy nhiên, {{domxref("SubmitEvent")}} được gửi để cho biết hành vi gửi biểu mẫu đã được kích hoạt bao gồm một thuộc tính {{domxref("SubmitEvent.submitter", "submitter")}}, là nút đã được nhấp để kích hoạt yêu cầu gửi.

Sự kiện `submit` được kích hoạt khi:

- người dùng nhấp vào {{Glossary("submit button")}},
- người dùng nhấn <kbd>Enter</kbd> trong khi chỉnh sửa một trường (ví dụ: {{HtmlElement('input/text', '&lt;input type="text"&gt;')}}) trong biểu mẫu,
- một script gọi phương thức {{domxref("HTMLFormElement.requestSubmit()", "form.requestSubmit()")}}

Tuy nhiên, sự kiện _không_ được gửi đến biểu mẫu khi một script gọi trực tiếp phương thức {{domxref("HTMLFormElement.submit()", "form.submit()")}}.

> [!NOTE]
> Việc cố gắng gửi một biểu mẫu không vượt qua [xác thực](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation) sẽ kích hoạt sự kiện {{domxref("HTMLInputElement/invalid_event", "invalid")}}. Trong trường hợp này, xác thực ngăn chặn việc gửi biểu mẫu, và do đó không có sự kiện `submit`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("submit", (event) => { })

onsubmit = (event) => { }
```

## Loại sự kiện

Một {{domxref("SubmitEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("SubmitEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê dưới đây, giao diện này kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("Event")}}._

- {{domxref("SubmitEvent.submitter", "submitter")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("HTMLElement")}} xác định nút hoặc phần tử khác đã được kích hoạt để gửi biểu mẫu.

## Ví dụ

Ví dụ này sử dụng {{domxref("EventTarget.addEventListener()")}} để lắng nghe sự kiện submit của biểu mẫu, và ghi lại {{domxref("Event.timeStamp")}} hiện tại mỗi khi điều đó xảy ra, sau đó ngăn chặn hành vi mặc định của việc gửi biểu mẫu.

### HTML

```html
<form id="form">
  <label>Trường kiểm tra: <input type="text" /></label>
  <br /><br />
  <button type="submit">Gửi biểu mẫu</button>
</form>
<p id="log"></p>
```

### JavaScript

```js
const form = document.getElementById("form");
const log = document.getElementById("log");

function logSubmit(event) {
  log.textContent = `Biểu mẫu đã được gửi! Timestamp: ${event.timeStamp}`;
  event.preventDefault();
}

form.addEventListener("submit", logSubmit);
```

### Kết quả

{{EmbedLiveSample("Examples", "", "", "", "", "", "", "allow-forms")}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HtmlElement("form")}}
- Sự kiện liên quan: {{domxref("HTMLInputElement/invalid_event", "invalid")}}
