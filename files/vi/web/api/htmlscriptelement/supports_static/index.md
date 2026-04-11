---
title: "HTMLScriptElement: phương thức tĩnh supports()"
short-title: supports()
slug: Web/API/HTMLScriptElement/supports_static
page-type: web-api-static-method
browser-compat: api.HTMLScriptElement.supports_static
---

{{APIRef("HTML DOM")}}

Phương thức tĩnh **`supports()`** của giao diện {{domxref("HTMLScriptElement")}} cung cấp một phương thức đơn giản và nhất quán để phát hiện các loại tập lệnh được user agent hỗ trợ.

Phương thức này dự kiến trả về `true` với classic scripts và module scripts, vốn được hỗ trợ bởi hầu hết các trình duyệt hiện đại.

## Cú pháp

```js-nolint
HTMLScriptElement.supports(type)
```

### Tham số

- `type`
  - : Một chuỗi ký tự chỉ định loại tập lệnh cần kiểm tra hỗ trợ.
    Các giá trị được hỗ trợ phân biệt chữ hoa chữ thường, bao gồm:
    - `"classic"`
      - : Kiểm tra xem _classic scripts_ có được hỗ trợ hay không.
        Script "Classic" là các tệp JavaScript thông thường/truyền thống ra đời trước module scripts.
    - `"module"`
      - : Kiểm tra xem [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules) có được hỗ trợ hay không.
    - `"importmap"`
      - : Kiểm tra xem [import maps](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap) có được hỗ trợ hay không.
    - `"speculationrules"`
      - : Kiểm tra xem [speculation rules](/en-US/docs/Web/API/Speculation_Rules_API) có được hỗ trợ và bật hay không.

    Bất kỳ giá trị nào khác sẽ khiến phương thức trả về `false`.

### Giá trị trả về

Trả về `true` nếu loại tập lệnh được chỉ định được hỗ trợ và `false` nếu không.

## Ví dụ

Đoạn mã bên dưới cho thấy cách kiểm tra xem `HTMLScriptElement.supports()` có được xác định hay không, và nếu có, dùng nó để kiểm tra xem các loại tập lệnh cụ thể có được hỗ trợ hay không.

```js
const log = document.getElementById("log");

function checkSupport(type) {
  const result = HTMLScriptElement.supports(type) ? "true" : "false";
  log.textContent += `HTMLScriptElement.supports('${type}') is ${result}\n`;
}

if (typeof HTMLScriptElement.supports === "undefined") {
  log.textContent = "HTMLScriptElement.supports() method is not supported";
} else {
  // Kiểm tra xem các loại tập lệnh khác nhau có được hỗ trợ hay không
  checkSupport("module");
  checkSupport("classic");
  checkSupport("importmap");
  checkSupport("speculationrules");
  // Bất kỳ giá trị nào khác sẽ khiến phương thức trả về false
  checkSupport("anything else");
}
```

```html hidden
<textarea id="log" rows="6" cols="80"></textarea>
```

{{ EmbedLiveSample('Examples') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement")}}
- {{HTMLElement("script")}}
- [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules)
- Hàm khởi tạo {{domxref("Worker/Worker","Worker")}}
