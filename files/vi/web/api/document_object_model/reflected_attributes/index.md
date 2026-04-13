---
title: Phản ánh thuộc tính
slug: Web/API/Document_Object_Model/Reflected_attributes
page-type: guide
---

{{DefaultAPISidebar("DOM")}}

{{glossary("attribute", "Thuộc tính")}} mở rộng phần tử {{glossary("HTML")}}, {{glossary("XML")}}, {{glossary("SVG")}} hoặc phần tử khác, thay đổi hành vi của nó hoặc cung cấp siêu dữ liệu.

Nhiều thuộc tính được _phản ánh_ trong giao diện [DOM](/en-US/docs/Web/API/Document_Object_Model) tương ứng. Điều này có nghĩa là giá trị của thuộc tính có thể được đọc hoặc ghi trực tiếp trong JavaScript thông qua thuộc tính trên giao diện tương ứng và ngược lại. Các thuộc tính được phản ánh cung cấp cách tiếp cận lập trình tự nhiên hơn so với việc lấy và đặt giá trị thuộc tính bằng cách sử dụng phương thức {{domxref("Element.getAttribute()","getAttribute()")}} và {{domxref("Element.setAttribute()","setAttribute()")}} của giao diện {{domxref("Element")}}.

## Getter/setter thuộc tính

Đầu tiên hãy xem cơ chế mặc định để lấy và đặt thuộc tính, có thể sử dụng dù thuộc tính có được phản ánh hay không. Để lấy thuộc tính, bạn gọi phương thức {{domxref("Element.getAttribute()","getAttribute()")}} của giao diện {{domxref("Element")}}, chỉ định tên thuộc tính. Để đặt thuộc tính bạn gọi phương thức {{domxref("Element.setAttribute()","setAttribute()")}}, chỉ định tên thuộc tính và giá trị mới.

```html
<input placeholder="Original placeholder" />
```

```js
// Lấy giá trị thuộc tính bằng getAttribute()
const input = document.querySelector("input");
let attr = input.getAttribute("placeholder");
console.log(attr); // "Original placeholder"

// Đặt giá trị thuộc tính bằng setAttribute()
input.setAttribute("placeholder", "New placeholder");
attr = input.getAttribute("placeholder");
console.log(attr); // "New placeholder"
```

## Thuộc tính được phản ánh

Đối với các thuộc tính được phản ánh, bạn có thể đọc và ghi giá trị trực tiếp thông qua thuộc tính IDL trên giao diện DOM. Đây thường là tiện lợi và phù hợp hơn.

```js
// Đọc thuộc tính được phản ánh
const input = document.querySelector("input");
let placeholder = input.placeholder;
console.log(placeholder); // "Original placeholder"

// Ghi thuộc tính được phản ánh
input.placeholder = "New placeholder";
placeholder = input.placeholder;
console.log(placeholder); // "New placeholder"
```

## Sự không nhất quán về kiểu dữ liệu

Trong hầu hết các trường hợp, có sự tương ứng 1-1 giữa giá trị thuộc tính và giá trị thuộc tính IDL được phản ánh. Tuy nhiên, có những trường hợp giá trị được chuyển đổi giữa chuỗi (giá trị thuộc tính) và kiểu dữ liệu khác (giá trị IDL). Ví dụ, thuộc tính `checked` của phần tử `<input type="checkbox">` được phản ánh dưới dạng giá trị boolean.

```html
<input type="checkbox" checked />
```

```js
const checkbox = document.querySelector("input");
// Thuộc tính trả về chuỗi
console.log(checkbox.getAttribute("checked")); // ""
// Thuộc tính IDL được phản ánh trả về boolean
console.log(checkbox.checked); // true
```

## Xem thêm

- {{domxref("Element.getAttribute()")}}
- {{domxref("Element.setAttribute()")}}
- [HTML Living Standard - Phản ánh nội dung thuộc tính trong IDL thuộc tính](https://html.spec.whatwg.org/multipage/common-dom-interfaces.html#reflecting-content-attributes-in-idl-attributes)
