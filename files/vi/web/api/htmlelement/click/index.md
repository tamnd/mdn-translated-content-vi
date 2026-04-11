---
title: "HTMLElement: phương thức click()"
short-title: click()
slug: Web/API/HTMLElement/click
page-type: web-api-instance-method
browser-compat: api.HTMLElement.click
---

{{ APIRef("HTML DOM") }}

Phương thức **`HTMLElement.click()`** mô phỏng một cú nhấp chuột trên một phần tử. Khi được gọi trên một phần tử, sự kiện {{domxref("Element/click_event", "click")}} của phần tử sẽ được kích hoạt (trừ khi thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) của nó được đặt).

## Cú pháp

```js-nolint
click()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Mô phỏng một cú nhấp chuột khi di chuyển con trỏ chuột qua một hộp kiểm:

### HTML

```html
<form>
  <input type="checkbox" id="myCheck" />
</form>
```

### JavaScript

```js
const checkbox = document.getElementById("myCheck");

// Khi di chuột qua, thực thi myFunction
checkbox.addEventListener("mouseover", () => {
  // Mô phỏng một cú nhấp chuột
  checkbox.click();
});

checkbox.addEventListener("click", () => {
  console.log("Sự kiện click đã xảy ra");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các trình xử lý sự kiện liên quan
  - {{domxref("Element.click_event", "Element.onclick")}}
  - {{domxref("Element.dblclick_event", "Element.ondblclick")}}
  - {{domxref("Element.auxclick_event", "Element.onauxclick")}}
