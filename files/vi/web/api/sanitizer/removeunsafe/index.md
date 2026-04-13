---
title: "Sanitizer: phương thức removeUnsafe()"
short-title: removeUnsafe()
slug: Web/API/Sanitizer/removeUnsafe
page-type: web-api-instance-method
browser-compat: api.Sanitizer.removeUnsafe
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`removeUnsafe()`** của giao diện {{domxref("Sanitizer")}} cấu hình bộ làm sạch để nó sẽ xóa tất cả các phần tử và thuộc tính được trình duyệt coi là không an toàn XSS.

Phương thức có thể được gọi để làm cho bất kỳ `Sanitizer` nào an toàn XSS.

## Cú pháp

```js-nolint
removeUnsafe()
```

### Tham số

Không có.

### Giá trị trả về

`true` nếu thao tác xóa bất kỳ phần tử, thuộc tính hoặc thuộc tính nội dung trình xử lý sự kiện nào được coi là không an toàn XSS, và `false` nếu không có phần tử hoặc thuộc tính nào bị xóa.

## Mô tả

Phương thức **`removeUnsafe()`** cấu hình bộ làm sạch để nó sẽ xóa tất cả các phần tử và thuộc tính được trình duyệt coi là không an toàn XSS.
Bao gồm các phần tử {{htmlelement("embed")}}, {{htmlelement("frame")}}, {{htmlelement("iframe")}}, {{htmlelement("object")}}, {{htmlelement("script")}} và {{SVGElement("use")}}, cùng các thuộc tính nội dung trình xử lý sự kiện như `onafterprint`, `onbeforeinput`, v.v.

Lưu ý rằng nếu bạn đang dùng bộ làm sạch với một trong các setter HTML "an toàn", chẳng hạn như {{domxref("Element.setHTML()")}} và {{domxref("ShadowRoot.setHTML()")}}, bạn không cần gọi phương thức này để làm cho bộ làm sạch an toàn.
Khi dùng trong các setter này, các phần tử và thuộc tính tương tự sẽ bị xóa khỏi đầu vào mà không sửa đổi phiên bản `Sanitizer` được truyền vào.

## Ví dụ

### Sử dụng cơ bản

Mã sau đây cho thấy cách `removeUnsafe()` được dùng.

```js
// Tạo bộ làm sạch.
const sanitizer = new Sanitizer(/* Một số cấu hình */);

// Làm cho cấu hình an toàn XSS
sanitizer.removeUnsafe();
```

### Làm cho cấu hình bộ làm sạch an toàn

Ví dụ này minh họa cách gọi `removeUnsafe()` làm cho cấu hình bộ làm sạch an toàn XSS.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 420px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent += text;
}
```

#### JavaScript

Mã trước tiên tạo một đối tượng `Sanitizer` mới cho phép phần tử an toàn {{htmlelement("p")}}, các phần tử không an toàn {{htmlelement("script")}} và {{htmlelement("iframe")}}, và thuộc tính trình xử lý sự kiện không an toàn `onwebkitanimationend`.

Mã sau đó gọi `removeUnsafe()` trên bộ làm sạch và ghi nhật ký cấu hình của nó.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch cho phép
const sanitizer = new Sanitizer({
  elements: ["p", "script"],
  attributes: ["onwebkitanimationend"],
  replaceWithChildrenElements: ["iframe"],
});

// Làm cho bộ làm sạch an toàn!
sanitizer.removeUnsafe();

// Ghi nhật ký cấu hình bộ làm sạch
const sanitizerConfig = sanitizer.get();
log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Cấu hình kết quả được hiển thị bên dưới.
Lưu ý cách các phần tử và thuộc tính không an toàn đã bị xóa khỏi danh sách "cho phép" vào các danh sách "xóa" tương ứng.
Trong trường hợp này chúng tôi vẫn có {{htmlelement("p")}} trong các phần tử được phép, vì vậy chỉ các phần tử `<p>` trong đầu vào mới được nhập khi bộ làm sạch được dùng.

{{EmbedLiveSample("Making a sanitizer configuration safe","100","480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
