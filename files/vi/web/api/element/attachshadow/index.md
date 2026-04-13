---
title: "Element: phương thức attachShadow()"
short-title: attachShadow
slug: Web/API/Element/attachShadow
page-type: web-api-instance-method
browser-compat: api.Element.attachShadow
---

{{APIRef("Shadow DOM")}}

Phương thức **`attachShadow()`** của giao diện {{domxref("Element")}} gắn một shadow root vào một phần tử cụ thể.

## Cú pháp

```js
attachShadow(init)
```

### Tham số

`init`
: Một đối tượng có chứa các thuộc tính sau:

  `mode`
  : Một chuỗi chỉ định chế độ đóng gói cho shadow DOM. Giá trị có thể là:
    - `"open"`: Cho phép truy cập vào các phần tử của shadow root từ JavaScript bên ngoài, sử dụng {{domxref("Element.shadowRoot")}}.
    - `"closed"`: Đóng shadow root và không cho phép truy cập từ bên ngoài.

  `delegatesFocus` {{optional_inline}}
  : Một giá trị boolean chỉ định xem có ủy quyền tập trung cho các phần tử con hay không.

  `slotAssignment` {{optional_inline}}
  : Một chuỗi chỉ định cách các slot được gán. Giá trị mặc định là `"named"`.

### Giá trị trả về

Một đối tượng {{domxref("ShadowRoot")}}.

### Ngoại lệ

`NotSupportedError` {{domxref("DOMException")}}
: Ném nếu phần tử không hỗ trợ shadow DOM, hoặc nếu shadow root đã được gắn vào phần tử đó.

## Ví dụ

Ví dụ sau đây cho thấy cách sử dụng `attachShadow()` để gắn một shadow root vào một phần tử tùy chỉnh:

```js
class MyElement extends HTMLElement {
  constructor() {
    super();
    // Gắn shadow root với chế độ mở
    const shadow = this.attachShadow({ mode: "open" });
    
    // Thêm nội dung vào shadow DOM
    shadow.innerHTML = `
      <style>
        p { color: blue; }
      </style>
      <p>Nội dung shadow DOM</p>
    `;
  }
}

customElements.define("my-element", MyElement);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [Shadow DOM](/en-US/docs/Web/Web_Components/Using_shadow_DOM)
- {{domxref("Element.shadowRoot")}}
