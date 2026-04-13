---
title: "Document: phương thức mozSetImageElement()"
short-title: mozSetImageElement()
slug: Web/API/Document/mozSetImageElement
page-type: web-api-instance-method
status:
  - non-standard
browser-compat: api.Document.mozSetImageElement
---

{{ ApiRef("DOM") }}{{ non-standard_header() }}

Phương thức **`Document.mozSetImageElement()`** thay đổi phần tử đang được sử dụng làm nền CSS cho một nền có ID phần tử nền đã cho.

## Cú pháp

```js-nolint
mozSetImageElement(imageElementId, imageElement)
```

### Tham số

- `imageElementId`
  - : Một chuỗi cho biết tên của một phần tử đã được chỉ định làm hình nền bằng cách sử dụng hàm CSS {{ cssxref("element", "-moz-element") }}.
- `imageElement`
  - : Phần tử mới để sử dụng làm nền tương ứng với chuỗi phần tử hình ảnh đó. Chỉ định `null` để xóa phần tử nền.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này thay đổi nền của khối {{ HTMLElement("div") }} mỗi khi người dùng nhấp vào khối đó.

[Xem ví dụ này trực tiếp](https://mdn.dev/archives/media/samples/domref/mozSetImageElement.html).

```css
#my-box {
  background-image: -moz-element(#canvas-bg);
  text-align: center;
  width: 400px;
  height: 400px;
  cursor: pointer;
}
```

CSS được định nghĩa ở trên được sử dụng bởi {{HTMLElement("div")}} của chúng tôi để sử dụng một phần tử có id "canvas-bg" làm nền của nó.

```js
let c = 0x00;
function clicked() {
  const canvas = document.createElement("canvas");
  canvas.setAttribute("width", 100);
  canvas.setAttribute("height", 100);

  const ctx = canvas.getContext("2d");
  ctx.fillStyle = `#${c.toString(16)}0000`;
  ctx.fillRect(25, 25, 75, 75);

  c += 0x11;
  if (c > 0xff) {
    c = 0x00;
  }

  document.mozSetImageElement("canvas-bg", canvas);
}
```

Mã ở đây được gọi mỗi khi người dùng nhấp vào phần tử {{ HTMLElement("div") }}.
Nó tạo một {{ HTMLElement("canvas") }} mới với chiều rộng và chiều cao được đặt thành 100 pixel, sau đó vẽ vào đó một hình vuông 50x50 pixel. Mỗi khi hàm được gọi, hình vuông có màu khác nhau (thành phần đỏ của nó được tăng lên mỗi lần), vì vậy mỗi khi người dùng nhấp vào phần tử, nền được điền bằng mẫu gạch đỏ ngày càng sáng.

Sau khi canvas được vẽ, `document.mozSetImageElement()` được gọi để đặt nền cho bất kỳ CSS nào sử dụng ID "canvas-bg" làm ID phần tử nền thành canvas mới của chúng tôi.

## Đặc tả kỹ thuật

Không thuộc bất kỳ đặc tả kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ cssxref("element", "-moz-element") }}
