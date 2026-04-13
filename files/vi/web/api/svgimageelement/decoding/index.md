---
title: "SVGImageElement: decoding property"
short-title: decoding
slug: Web/API/SVGImageElement/decoding
page-type: web-api-instance-property
browser-compat: api.SVGImageElement.decoding
---

{{APIRef("SVG")}}

Thuộc tính **`decoding`** của giao diện {{domxref("SVGImageElement")}} cung cấp gợi ý cho trình duyệt về việc nên thực hiện giải mã hình ảnh đồng bộ hay bất đồng bộ.

## Giá trị

Một chuỗi đại diện cho gợi ý giải mã. Các giá trị có thể là:

- `"sync"`
  - : Giải mã hình ảnh đồng bộ để trình bày nguyên tử cùng với nội dung khác.
- `"async"`
  - : Giải mã hình ảnh bất đồng bộ và cho phép nội dung khác được hiển thị trước khi hoàn thành.
- `"auto"`
  - : Không có sở thích về chế độ giải mã; trình duyệt quyết định điều tốt nhất cho người dùng. Đây là giá trị mặc định, nhưng các trình duyệt khác nhau có các mặc định khác nhau:
    - Chromium mặc định là `"sync"`.
    - Firefox mặc định là `"async"`.
    - Safari mặc định là `"sync"` trừ một số trường hợp nhỏ.

## Ghi chú sử dụng

Thuộc tính `decoding` cung cấp gợi ý cho trình duyệt về việc nên thực hiện giải mã hình ảnh cùng với các tác vụ khác trong một bước (`"sync"`), hay cho phép nội dung khác được hiển thị trước khi hoàn thành (`"async"`). Trong thực tế, sự khác biệt giữa hai giá trị thường khó nhận thấy và khi có sự khác biệt, thường có cách tốt hơn.

Đối với hình ảnh được chèn vào DOM trong vùng nhìn thấy, `"async"` có thể dẫn đến hiện tượng nhấp nháy nội dung chưa được tạo kiểu, trong khi `"sync"` có thể dẫn đến một lượng nhỏ [jank](/en-US/docs/Glossary/Jank). Sử dụng phương thức {{domxref("SVGImageElement.decode()")}} thường là cách tốt hơn để đạt được trình bày nguyên tử mà không giữ lại nội dung khác.

Đối với hình ảnh được chèn vào DOM bên ngoài vùng nhìn thấy, các trình duyệt hiện đại thường giải mã chúng trước khi chúng được cuộn vào tầm nhìn và sẽ không có sự khác biệt đáng chú ý khi sử dụng bất kỳ giá trị nào.

## Ví dụ

Trong ví dụ dưới đây, bạn có thể thấy hình ảnh trống trên trang trong khi hình ảnh đang được tải xuống. Đặt `decoding` sẽ không ngăn điều đó.

```js
const SVG_NS = "http://www.w3.org/2000/svg";
const svg = document.querySelector("svg");

const img = document.createElementNS(SVG_NS, "image");
img.decoding = "sync";
img.setAttribute("href", "img/logo.svg");
svg.appendChild(img);
```

Chèn hình ảnh sau khi tải xuống có thể làm cho thuộc tính `decoding` trở nên liên quan hơn:

```js
async function loadImage(url, elem) {
  return new Promise((resolve, reject) => {
    elem.onload = () => resolve(elem);
    elem.onerror = reject;
    elem.src = url;
  });
}

const SVG_NS = "http://www.w3.org/2000/svg";
const svg = document.querySelector("svg");

const img = document.createElementNS(SVG_NS, "image");
await loadImage("img/logo.svg", img);
// Using `sync` can ensure other content is only updated with the image
img.decoding = "sync";
svg.appendChild(img);
const text = document.createElementNS(SVG_NS, "text");
text.textContent = "Image is fully loaded!";
svg.appendChild(text);
```

Tuy nhiên, giải pháp tốt hơn là sử dụng phương thức {{domxref("SVGImageElement.decode()")}} để giải quyết vấn đề này. Nó cung cấp cách giải mã hình ảnh bất đồng bộ, trì hoãn việc chèn vào DOM cho đến khi được tải xuống và giải mã hoàn toàn, tránh vấn đề hình ảnh trống đề cập ở trên. Điều này đặc biệt hữu ích nếu bạn đang hoán đổi động một hình ảnh hiện có với một hình ảnh mới.

Sử dụng `img.decoding = "async"` có thể tránh giữ lại nội dung khác khỏi việc hiển thị nếu thời gian giải mã dài:

```js
const SVG_NS = "http://www.w3.org/2000/svg";
const svg = document.querySelector("svg");

const img = document.createElementNS(SVG_NS, "image");
img.decoding = "async";
img.setAttribute("href", "img/logo.svg");
svg.appendChild(img);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức {{domxref("SVGImageElement.decode()")}}
- Thuộc tính {{SVGAttr("decoding")}} của phần tử SVG {{SVGElement("image")}}.
