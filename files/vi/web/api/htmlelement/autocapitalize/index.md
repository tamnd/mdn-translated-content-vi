---
title: "HTMLElement: thuộc tính autocapitalize"
short-title: autocapitalize
slug: Web/API/HTMLElement/autocapitalize
page-type: web-api-instance-property
browser-compat: api.HTMLElement.autocapitalize
---

{{APIRef("HTML DOM")}}

Thuộc tính **`autocapitalize`** của giao diện {{domxref("HTMLElement")}} thể hiện hành vi viết hoa của phần tử đối với đầu vào từ người dùng. Thuộc tính này có sẵn trên tất cả các phần tử HTML, mặc dù nó không ảnh hưởng đến tất cả chúng, bao gồm:

- Các phần tử {{htmlelement("input")}} và {{htmlelement("textarea")}}.
- Bất kỳ phần tử nào có thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt trên nó.

`autocapitalize` không ảnh hưởng đến hành vi khi gõ trên bàn phím vật lý. Nó ảnh hưởng đến hành vi của các cơ chế nhập liệu khác như bàn phím ảo trên thiết bị di động và nhập liệu bằng giọng nói. Điều này có thể hỗ trợ người dùng bằng cách giúp việc nhập liệu nhanh chóng và dễ dàng hơn, ví dụ bằng cách tự động viết hoa chữ cái đầu tiên của mỗi câu.

Nó phản ánh giá trị của thuộc tính toàn cục HTML [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize).

## Giá trị

Một chuỗi thể hiện hành vi viết hoa của phần tử đối với đầu vào từ người dùng. Các giá trị hợp lệ như sau:

- `none` hoặc `off`
  - : Không áp dụng tự động viết hoa, tức là tất cả các chữ cái sẽ mặc định là chữ thường.
- `sentences` hoặc `on`
  - : Chữ cái đầu tiên của mỗi câu sẽ mặc định là chữ hoa; tất cả các chữ cái khác sẽ mặc định là chữ thường.
- `words`
  - : Chữ cái đầu tiên của mỗi từ sẽ mặc định là chữ hoa; tất cả các chữ cái khác sẽ mặc định là chữ thường.
- `characters`
  - : Tất cả các chữ cái sẽ mặc định là chữ hoa.

## Ví dụ

Ví dụ sau cho thấy cách kiểm soát hành vi viết hoa đối với đầu vào từ người dùng thông qua script:

```html
<div>Hành vi viết hoa hiện tại là: <span id="ac-label"></span></div>
<div id="ac-element" contenteditable="true" autocapitalize="default">
  nhập vào đây
</div>
<select id="ac-controller" type="checkbox" checked>
  <option value="default">mặc định</option>
  <option value="none">không</option>
  <option value="sentences">câu</option>
  <option value="words">từ</option>
  <option value="characters">ký tự</option></select
>Chọn hành vi viết hoa
```

```js
const label = document.getElementById("ac-label");
const element = document.getElementById("ac-element");
const controller = document.getElementById("ac-controller");

controller.addEventListener("input", (e) => {
  const behavior = e.target.value;
  label.textContent = behavior;
  element.autocapitalize = behavior;
});
```

{{EmbedLiveSample('Examples', 600, 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính toàn cục HTML [`autocapitalize`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocapitalize)
