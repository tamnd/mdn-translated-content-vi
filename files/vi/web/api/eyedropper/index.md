---
title: EyeDropper
slug: Web/API/EyeDropper
page-type: web-api-interface
status:
  - experimental
browser-compat: api.EyeDropper
---

{{securecontext_header}}{{APIRef("EyeDropper API")}}{{SeeCompatTable}}

Giao diện **`EyeDropper`** đại diện cho một phiên bản công cụ eyedropper có thể được mở và sử dụng bởi người dùng để chọn màu từ màn hình.

## Hàm khởi tạo

- {{DOMxRef("EyeDropper.EyeDropper", "EyeDropper()")}} {{Experimental_Inline}}
  - : Trả về một phiên bản `EyeDropper` mới.

## Phương thức phiên bản

_Giao diện `EyeDropper` không kế thừa bất kỳ phương thức nào_.

- {{DOMxRef("EyeDropper.open()")}} {{Experimental_Inline}}
  - : Trả về một promise giải quyết thành một đối tượng cung cấp quyền truy cập vào màu được chọn.

## Ví dụ

### Mở công cụ eyedropper và lấy mẫu màu

Ví dụ này cho thấy cách mở một công cụ eyedropper và chờ người dùng chọn một pixel từ màn hình, hoặc nhấn <kbd>Escape</kbd> để hủy chế độ eyedropper.

#### HTML

```html
<button id="start-button">Open the eyedropper</button> <span id="result"></span>
```

#### JavaScript

```js
document.getElementById("start-button").addEventListener("click", () => {
  const resultElement = document.getElementById("result");

  if (!window.EyeDropper) {
    resultElement.textContent =
      "Your browser does not support the EyeDropper API";
    return;
  }

  const eyeDropper = new EyeDropper();

  eyeDropper
    .open()
    .then((result) => {
      resultElement.textContent = result.sRGBHex;
      resultElement.style.backgroundColor = result.sRGBHex;
    })
    .catch((e) => {
      resultElement.textContent = e;
    });
});
```

#### Kết quả

{{EmbedLiveSample("Opening the eyedropper tool and sampling a color")}}

### Hủy chế độ eyedropper

Ví dụ này cho thấy rằng chế độ eyedropper cũng có thể bị hủy trước khi người dùng chọn màu hoặc nhấn <kbd>Escape</kbd>.

#### HTML

```html
<button id="start-button">Open the eyedropper</button> <span id="result"></span>
```

#### JavaScript

```js
document.getElementById("start-button").addEventListener("click", () => {
  const resultElement = document.getElementById("result");

  if (!window.EyeDropper) {
    resultElement.textContent =
      "Your browser does not support the EyeDropper API";
    return;
  }

  const eyeDropper = new EyeDropper();
  const abortController = new AbortController();

  eyeDropper
    .open({ signal: abortController.signal })
    .then((result) => {
      resultElement.textContent = result.sRGBHex;
      resultElement.style.backgroundColor = result.sRGBHex;
    })
    .catch((e) => {
      resultElement.textContent = e;
    });

  setTimeout(() => {
    abortController.abort();
  }, 2000);
});
```

#### Kết quả

{{EmbedLiveSample("Aborting the eyedropper mode")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
